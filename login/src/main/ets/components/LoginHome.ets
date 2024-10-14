import {AlertView} from './AlertView';

@Component
export struct LoginHome {
  @State agree: boolean = false;
  @State interval: number = 60;
  @State btnTitle: string = '获取验证码';

  dialogController: CustomDialogController = new CustomDialogController({
    builder: AlertView()
  })

  onPageShow(): void {
    this.dialogController.open()
  }

  build() {
    RelativeContainer() {
      Column() {
        Image($r('app.media.startIcon'))
          .width(80)
          .height(80)
          .margin({
            top: 120
          })
        Text('欢迎登录')
          .fontSize(24)
          .fontWeight(500)
          .fontColor(0x000000)
          .margin({
            top: 20
          })
        TextInput({
          placeholder: '请输入手机号',
        })
          .maxLength(11)
          .backgroundColor('#F1F2F6')
          .borderRadius(8)
          .height(50)
          .margin({
            top: 52,
          })
        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          TextInput({
            placeholder: '请输入验证码',
          })
            .maxLength(6)
            .backgroundColor(Color.Transparent)
            .height(50)
            .width(200)
          Button(this.btnTitle)
            .backgroundColor(Color.Transparent)
            .fontColor('#E28C22')
            .fontSize(14)
            .fontWeight(500)
            .onClick(() => {
              if (this.interval < 60) {
                return;
              }
              this.timerInterval()
            })
        }
        .backgroundColor('#F1F2F6')
        .borderRadius(8)
        .margin({
          top: 15,
        })

        Button('登 录')
          .fontColor('#F6E0C8')
          .fontSize(16)
          .fontWeight(500)
          .width('100%')
          .margin({
            top: 52,
          })
          .linearGradient({
            direction: GradientDirection.Right,
            colors: [
              ['#4F4535', 0.2],
              ['#312920', 0.7]
            ]
          })
        Blank()
        Row() {
          Button() {
            Image(this.agree ? $r('app.media.choose_open') : $r('app.media.choose_close'))
              .width(14)
              .height(14)
          }
          .backgroundColor(Color.Transparent)
          .onClick(() => {
            this.agree = !this.agree
            console.log((this.agree ? '勾选' : '取消') + '协议')
          })

          Text() {
            Span('若您的手机号未注册，登录时将自动注册，且代表您已阅读并同意')
              .fontSize(13)
              .fontWeight(400)
              .fontColor('#86909C')
            Span('《用户协议》')
              .fontColor('#D09520')
              .fontSize(13)
              .fontWeight(400)
              .onClick(() => {
                console.log('查看用户协议')
              })
            Span('与')
              .fontSize(13)
              .fontWeight(400)
              .fontColor('#86909C')
            Span('《隐私协议》')
              .fontColor('#D09520')
              .fontSize(13)
              .fontWeight(400)
              .onClick(() => {
                console.log('查看隐私协议')
              })
          }
          .margin({
            left: 8
          })
        }
        .alignItems(VerticalAlign.Top)
      }
      .width('100%')
      .height('100%')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Start)
      .padding({
        left: 30,
        right: 30
      })
    }
    .height('100%')
    .width('100%')
    .linearGradient({
      colors: [['#F8E7CF', 0.2,], ['#FFFFFF', 0.3],],
    })
  }

  timerInterval() {
    let timerId = setInterval(() =>{
      if (this.interval > 0) {
        this.interval -= 1
        this.btnTitle = `(${this.interval}s)重新获取`
      } else {
        this.btnTitle = '获取验证码';
        clearInterval(timerId)
      }
    }, 1000)
  }
}