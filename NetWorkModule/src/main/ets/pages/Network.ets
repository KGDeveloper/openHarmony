import { http } from '@kit.NetworkKit'
import { Data, Dictionary } from './Request'

type NetObject = Record<string, http.HttpRequest>

declare const readTimeout = 60000;

declare const connectTimeout = 60000;

export class NetWork {
  private static netPool: NetObject[] = []
  private static instance: NetWork
  private static header: Dictionary

  private constructor() {
    // 设置Header默认参数
    NetWork.header = {
      'Content-Type': 'application/json'
    }
  }

  public static async get(url: string, query?: Dictionary): Promise<http.HttpResponse> {
    return NetWork.network(url, http.RequestMethod.GET, query)
  }

  public static async post(url: string, params: Dictionary): Promise<http.HttpResponse> {
    return NetWork.network(url, http.RequestMethod.POST, params)
  }

  public static async upload(name: string, contentType: string, remoteFileName?: string, data?: Data, filePath?: string,
    params?: Dictionary): Promise<http.HttpResponse> {
    return NetWork.network('', http.RequestMethod.POST, params, {
      name: name,
      contentType: contentType,
      remoteFileName: remoteFileName,
      data: data,
      filePath: filePath
    })
  }

  public static async download(url: string, params: Dictionary): Promise<http.HttpResponse> {
    return NetWork.network(url, http.RequestMethod.POST, params)
  }

  public static getInstance(): NetWork {
    if (!NetWork.instance) {
      NetWork.instance = new NetWork()
    }
    return NetWork.instance
  }

  private static async network(url: string, method: http.RequestMethod, extraData?: Dictionary,
    formData?: http.MultiFormData): Promise<http.HttpResponse> {
    let request = http.createHttp()
    NetWork.netPool.push({ '': request })
    let response = await request.request(url, {
      method: method,
      extraData: extraData,
      header: NetWork.header,
      readTimeout: readTimeout,
      connectTimeout: connectTimeout,
      multiFormDataList: formData == null ? [] : [formData],
    })
    if (response.responseCode == 3000) {
      // 发送全局通知，进行打开登录页面
    }
    return response
  }
}
