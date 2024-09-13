import ethernet from '@ohos.net.ethernet';
import { BusinessError } from '@ohos.base';
import {Logger} from 'entry/src/main/ets/common/Logger';

export class EthConfigurator {
  private logger: Logger = new Logger('myWebSocket');
  private eth_port: string = 'eth0';
  private eth_config: ethernet.InterfaceConfiguration = {
    mode: 0,
    ipAddr: '',
    route: '',
    gateway: '',
    netMask: '',
    dnsServers: ''
  };
  private current_eth_config: ethernet.InterfaceConfiguration = {
    mode: 0,
    ipAddr: '',
    route: '',
    gateway: '',
    netMask: '',
    dnsServers: ''
  };

  constructor() {
    this.logger.info("class EthConfigurator constructor");
  }

  setEthPort(eth_port: string) {
    this.eth_port = eth_port;
    this.logger.info("setEthPort success");
  } //setEthPort()

  setEthConfig(ip_config: ethernet.InterfaceConfiguration) {
    this.eth_config.mode = ip_config.mode;
    this.eth_config.ipAddr = ip_config.ipAddr;
    this.eth_config.route = ip_config.route;
    this.eth_config.gateway = ip_config.gateway;
    this.eth_config.netMask = ip_config.netMask;
    this.eth_config.dnsServers = ip_config.dnsServers;
    this.logger.info("setEthConfig success");
  } //setEthConfig()

  setEthConfigPromise() {
    // getAllActiveIfaces获取所有活动的网络设备名称
    ethernet.getAllActiveIfaces().then((data: string[]) => {
      this.logger.info("getAllActiveIfaces promise data.length = " + JSON.stringify(data.length));
      for (let i = 0; i < data.length; i++) {
        this.logger.info("getAllActiveIfaces promise  = " + JSON.stringify(data[i]));
      }
    }).catch((error: BusinessError) => {
      this.logger.error("getAllActiveIfaces promise error = " + JSON.stringify(error));
    });

    // isIfaceActive判断指定网口是否已激活
    ethernet.isIfaceActive(this.eth_port).then((data: number) => {
      this.logger.info("isIfaceActive promise = " + JSON.stringify(data));
    }).catch((error: BusinessError) => {
      this.logger.error("isIfaceActive promise error = " + JSON.stringify(error));
    });

    const setConfigPromise = ethernet.setIfaceConfig(this.eth_port, this.eth_config);

    setConfigPromise.then(() => {
      this.logger.info("setIfaceConfig promise ok");
    }).catch((error: BusinessError) => {
      this.logger.error("setIfaceConfig promise error = " + JSON.stringify(error));
    });
  } // setEthConfigPromise()

  getEthConfig(): ethernet.InterfaceConfiguration {
    // getIfaceConfig获取指定以太网的网络属性
    ethernet.getIfaceConfig("eth0").then((data: ethernet.InterfaceConfiguration) => {

      this.current_eth_config.mode = data.mode;
      this.current_eth_config.ipAddr = data.ipAddr;
      this.current_eth_config.route = data.route;
      this.current_eth_config.gateway = data.gateway;
      this.current_eth_config.netMask = data.netMask;
      this.current_eth_config.dnsServers = data.dnsServers;

      this.logger.info("getIfaceConfig promise mode = " + JSON.stringify(data.mode));
      this.logger.info("getIfaceConfig promise ipAddr = " + JSON.stringify(data.ipAddr));
      this.logger.info("getIfaceConfig promise route = " + JSON.stringify(data.route));
      this.logger.info("getIfaceConfig promise gateway = " + JSON.stringify(data.gateway));
      this.logger.info("getIfaceConfig promise netMask = " + JSON.stringify(data.netMask));
      this.logger.info("getIfaceConfig promise dnsServers = " + JSON.stringify(data.dnsServers));

    }).catch((error: BusinessError) => {
      this.logger.error("getIfaceConfig promise error = " + JSON.stringify(error));
    });
    return this.current_eth_config;
  } // getEthConfig()
} // class EthConfigurator