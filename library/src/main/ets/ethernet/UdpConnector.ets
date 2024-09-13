import ethernet from '@ohos.net.ethernet';
import socket from '@ohos.net.socket';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

export class IpConfig {
  ipAddr: string = '';
  route: string = '';
  gateway: string = '';
  netMask: string = '';
  dnsServers: string = '';
}

class SocketInfo {
  message: ArrayBuffer = new ArrayBuffer(1);
  remoteInfo: socket.SocketRemoteInfo = {} as socket.SocketRemoteInfo;
}

export class UdpConnector {
  private udp: socket.UDPSocket = socket.constructUDPSocketInstance();
  private currentIpAddr: string = '';

  constructor() {
    if (canIUse("SystemCapability.Communication.NetStack")) {
      hilog.info(0x0001, 'testUDP', '%{public}s', "support SystemCapability.Communication.NetStack");
    } else {
      hilog.error(0x0001, 'testUDP', '%{public}s', "no support SystemCapability.Communication.NetStack");
    }
  }

  eth0_config(ip: IpConfig) {
    // getAllActiveIfaces获取所有活动的网络设备名称
    ethernet.getAllActiveIfaces().then((data: string[]) => {
      console.log("getAllActiveIfaces promise data.length = " + JSON.stringify(data.length));
      for (let i = 0; i < data.length; i++) {
        console.log("getAllActiveIfaces promise  = " + JSON.stringify(data[i]));
      }
    }).catch((error: BusinessError) => {
      hilog.error(0x0001, 'testUDP', '%{public}s', 'getAllActiveIfaces promise error = ' + JSON.stringify(error));
    });

    // isIfaceActive判断指定网口是否已激活
    ethernet.isIfaceActive("eth0").then((data: number) => {
      console.log("isIfaceActive promise = " + JSON.stringify(data));
    }).catch((error: BusinessError) => {
      console.log("isIfaceActive promise error = " + JSON.stringify(error));
      hilog.error(0x0001, 'testUDP', '%{public}s', 'isIfaceActive promise error');

    });

    // setIfaceConfig配置指定以太网的网络属性
    let config: ethernet.InterfaceConfiguration = {
      mode: 0,
      ipAddr: ip.ipAddr,
      route: ip.route,
      gateway: ip.gateway,
      netMask: ip.netMask,
      dnsServers: ip.dnsServers
    };

    const setConfigPromise = ethernet.setIfaceConfig("eth0", config);

    setConfigPromise.then(() => {
      console.log("setIfaceConfig promise ok");
    }).catch((error: BusinessError) => {
      console.log("setIfaceConfig promise error = " + JSON.stringify(error));
      hilog.error(0x0001, 'testUDP', '%{public}s', 'setIfaceConfig promise error');

    });

    // getIfaceConfig获取指定以太网的网络属性
    ethernet.getIfaceConfig("eth0").then((data: ethernet.InterfaceConfiguration) => {
      console.log("getIfaceConfig promise mode = " + JSON.stringify(data.mode));
      console.log("getIfaceConfig promise ipAddr = " + JSON.stringify(data.ipAddr));
      console.log("getIfaceConfig promise route = " + JSON.stringify(data.route));
      console.log("getIfaceConfig promise gateway = " + JSON.stringify(data.gateway));
      console.log("getIfaceConfig promise netMask = " + JSON.stringify(data.netMask));
      console.log("getIfaceConfig promise dnsServers = " + JSON.stringify(data.dnsServers));
    }).catch((error: BusinessError) => {
      console.log("getIfaceConfig promise error = " + JSON.stringify(error));
      hilog.error(0x0001, 'testUDP', '%{public}s', 'getIfaceConfig promise error');

    });
  }

  bind(ip_addr: string, port: number) {
    let bindAddr: socket.NetAddress = {
      address: ip_addr,
      port: port
    }

    this.udp.bind(bindAddr, (err: BusinessError) => {
      if (err) {
        hilog.error(0x0001, 'testUDP', '%{public}s', 'udp bind fail');
        return;
      }
      hilog.info(0x0001, 'testUDP', '%{public}s', 'udp bind success');
    });
  } // connect()

  send(ip_addr: string, port: number, data: ArrayBuffer) {
    let sendOptions: socket.UDPSendOptions = {
      data: data,
      address: {
        address: ip_addr,
        port: port
      }
    }

    this.udp.send(sendOptions).then(() => {
      hilog.info(0x0001, 'testUDP', '%{public}s', 'udp send success');
    }).catch((err: BusinessError) => {
      hilog.error(0x0001, 'testUDP', '%{public}s', 'udp send fail');
    });
  }

  close() {
    this.udp.close((err: BusinessError) => {
      if (err) {
        hilog.error(0x0001, 'testUDP', '%{public}s', 'udp close fail');
        return;
      }
      hilog.info(0x0001, 'testUDP', '%{public}s', 'udp close success');
    })

  } // close

  getIpAddr(): string {

    ethernet.getIfaceConfig("eth0").then((data: ethernet.InterfaceConfiguration) => {
      console.log("getIfaceConfig promise mode = " + JSON.stringify(data.mode));
      console.log("getIfaceConfig promise ipAddr = " + JSON.stringify(data.ipAddr));
      console.log("getIfaceConfig promise route = " + JSON.stringify(data.route));
      console.log("getIfaceConfig promise gateway = " + JSON.stringify(data.gateway));
      console.log("getIfaceConfig promise netMask = " + JSON.stringify(data.netMask));
      console.log("getIfaceConfig promise dnsServers = " + JSON.stringify(data.dnsServers));
      this.currentIpAddr = data.ipAddr;
    }).catch((error: BusinessError) => {
      console.log("getIfaceConfig promise error = " + JSON.stringify(error));
      this.currentIpAddr = 'error';
    });

    return this.currentIpAddr;
  } //getIpAddr

  /**
   * Uint8Array转ArrayBuffer
   * @param str
   * @returns
   */
  unit8ArrayToBuffer(src: Uint8Array): ArrayBuffer {
    // return buffer.from(src).buffer;
    return src.buffer as ArrayBuffer;
  }//unit8ArrayToBuffer

} // class TcpConnector