import socket from '@ohos.net.socket';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

class SocketInfo {
  message: ArrayBuffer = new ArrayBuffer(1);
  remoteInfo: socket.SocketRemoteInfo = {} as socket.SocketRemoteInfo;
}

// let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State tcp: socket.TCPSocket = socket.constructTCPSocketInstance();

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
            hilog.info(0x0001, 'testTCP', '%{public}s', 'xixi');

            // 创建一个TCPSocket连接，返回一个TCPSocket对象。
            this.tcp.on('message', (value: SocketInfo) => {
              hilog.info(0x0001, 'testTCP', '%{public}s', 'on message');

              console.log("on message");
              let buffer = value.message;
              let dataView = new DataView(buffer);
              let str = "";
              for (let i = 0; i < dataView.byteLength; ++i) {
                str += String.fromCharCode(dataView.getUint8(i));
              }
              console.log("on connect received:" + str);
            });
            this.tcp.on('connect', () => {
              console.log("on connect");
            });
            this.tcp.on('close', () => {
              console.log("on close");
            });
            // 绑定本地IP地址和端口。
            let ipAddress: socket.NetAddress = {} as socket.NetAddress;
            ipAddress.address = "192.168.137.1";
            ipAddress.port = 1234;
            this.tcp.bind(ipAddress, (err: BusinessError) => {
              if (err) {
                console.log('bind fail');
                return;
              }
              console.log('bind success');
              hilog.info(0x0001, 'testTCP', '%{public}s', 'bind success');

              // 连接到指定的IP地址和端口。
              ipAddress.address = "192.168.137.166";
              ipAddress.port = 5678;

              let tcpConnect: socket.TCPConnectOptions = {} as socket.TCPConnectOptions;
              tcpConnect.address = ipAddress;
              tcpConnect.timeout = 6000;

              this.tcp.connect(tcpConnect).then(() => {
                console.log('connect success');
                hilog.info(0x0001, 'testTCP', '%{public}s', 'connect success');

                let tcpSendOptions: socket.TCPSendOptions = {
                  data: 'Hello, server!'
                }
                this.tcp.send(tcpSendOptions).then(() => {
                  hilog.info(0x0001, 'testTCP', '%{public}s', 'send success');

                  console.log('send success');

                }).catch((err: BusinessError) => {
                  console.log('send fail');
                });
              }).catch((err: BusinessError) => {
                console.log('connect fail');
              });
            });
          })
          .id('btnConnect')
          .margin({ bottom: 20 })

        Button("发送")
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            hilog.info(0x0001, 'testTCP', '%{public}s', 'haha');

          })
          .id('btnSend')
          .margin({ bottom: 20 })

        Button("断开")
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            hilog.info(0x0001, 'testTCP', '%{public}s', 'nono');

            // 连接使用完毕后，主动关闭。取消相关事件的订阅。
            setTimeout(() => {
              this.tcp.close().then(() => {
                console.log('close success');
                hilog.info(0x0001, 'testTCP', '%{public}s', 'close success');

              }).catch((err: BusinessError) => {
                console.log('close fail');
                hilog.info(0x0001, 'testTCP', '%{public}s', 'close fail');

              });
              this.tcp.off('message');
              this.tcp.off('connect');
              this.tcp.off('close');
            }, 30 * 1000);

          })
          .id('btnCancel')
          .margin({ bottom: 20 })
      }
      .width('100%')
    }
    .height('100%')
  }
}