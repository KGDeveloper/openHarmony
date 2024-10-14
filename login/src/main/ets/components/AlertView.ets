@Component
@CustomDialog
export struct AlertView {

  title?: string
  content?: string
  confirm?: () => void
  cancel?: () => void
  controller: CustomDialogController

  build() {
    Column(){
      Stack(){
        Image($r('app.media.alert_mask'))
          .width('100%')
          .renderFit(RenderFit.RESIZE_CONTAIN)
      }
    }
    .justifyContent(FlexAlign.Center)
  }
}