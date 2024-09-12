import socket from '@ohos.net.socket';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { TcpConnector } from 'library/src/main/ets/ethernet/TcpConnector'

@Entry
@Component
struct Index {
  @State message: string = 'TCP通信测试';
  @State tcp_connector: TcpConnector = new TcpConnector();

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button("连接")
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.tcp_connector.connect();
          })
          .id('btnConnect')
          .margin({ bottom: 20 })

        Button("发送")
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.tcp_connector.send();
          })
          .id('btnSend')
          .margin({ bottom: 20 })

        Button("断开")
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.tcp_connector.close();
          })
          .id('btnCancel')
          .margin({ bottom: 20 })
      }
      .width('100%')
    }
    .height('100%')
  }
}