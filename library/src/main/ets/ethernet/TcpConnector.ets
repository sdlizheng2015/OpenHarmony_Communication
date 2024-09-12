import socket from '@ohos.net.socket';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

class SocketInfo {
  message: ArrayBuffer = new ArrayBuffer(1);
  remoteInfo: socket.SocketRemoteInfo = {} as socket.SocketRemoteInfo;
}

export class TcpConnector {
  private tcp: socket.TCPSocket = socket.constructTCPSocketInstance();

  private bindAddr: socket.NetAddress = {
    address: '192.168.1.166',
    port: 8080
  }

  private tcpConnectOptions: socket.TCPConnectOptions = {
    address: {
      address: '192.168.1.15',
      port: 9090
    },
    timeout: 6000
  }

  constructor() {
    if (canIUse("SystemCapability.Communication.NetStack")) {
      hilog.info(0x0001, 'testTCP', '%{public}s', "support SystemCapability.Communication.NetStack");
    } else {
      hilog.error(0x0001, 'testTCP', '%{public}s', "no support SystemCapability.Communication.NetStack");
    }

    this.tcp.bind(this.bindAddr, (err: BusinessError) => {
      if (err) {
        hilog.error(0x0001, 'testTCP', '%{public}s', 'bind fail');
        return;
      }
      hilog.info(0x0001, 'testTCP', '%{public}s', 'bind success');
    })
  }

  connect() {
    this.tcp.connect(this.tcpConnectOptions, (err: BusinessError) => {
      if (err) {
        hilog.error(0x0001, 'testTCP', '%{public}s, error code: %{public}d', 'connect fail', err.code);
        return;
      }
      hilog.info(0x0001, 'testTCP', '%{public}s', 'connect success');
    })
  } // connect()

  send() {
    console.log('send');

    hilog.info(0x0001, 'testTCP', '%{public}s', 'send');
  }

  close() {
    hilog.info(0x0001, 'testTCP', '%{public}s', 'close');
  } // close
} // class TcpConnector