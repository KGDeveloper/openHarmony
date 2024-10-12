// Index.ets
// 导入页面路由模块
import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Row() {
        Image('')
          .backgroundColor('#F5F7F6')
          .size({width: 40, height: 40})
          .borderRadius(5)
          Text('数煤宝服务端')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
            .margin({
              left:15
            })
      }
      .margin({
        left: 15,
        right: 15
      })
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Start)
    }
    .width('100%')
    .height('100%')
    .linearGradient({
      colors: [
        ['#1C2A8E', 0.0],
        ['#4257B3', 0.05],
        ['#7D9AE0', 0.1],
        ['#B3CAF4',0.2],
        ['#DEE9F9',0.3],
        ['#E6EFFA',0.4]
      ]
    })
  }
}
