export type id = string | boolean | number | object | null;
export type Data = string | Object | ArrayBuffer;
export type Dictionary = Record<string, id>;
export type  NullableString = string | null;

export enum FormDataType {
  text_plain,
  image_png,
  image_jpeg,
  audio_mpeg,
  video_mp4,
}

export interface FormData {
  name: string
  contentType: FormDataType
  data?: Data
  filePath?: string
  remoteFileName?: string
}

export function paramsToQuery(params?: Dictionary): NullableString {
  if (params == null) {
    return null
  }
  let query = '';
  Object.keys(params).forEach((key)=>{
    query += `${key}=${params[key]}&`
  })
  return query.slice(0,query.length - 1)
}

export function queryToParams(query: NullableString): Dictionary {
  if (query == null) {
    return {}
  }
  if (query.length < 1) {
    return {}
  }
  let params: Dictionary = {};
  let queryArray = query.split('&')
  queryArray.forEach((value)=> {
    let keyValue = value.split('=')
    if (keyValue.length > 1) {
      let key: string = keyValue[0]
      let value = keyValue[1]
      params[key] = value
    }
  })
  return params
}