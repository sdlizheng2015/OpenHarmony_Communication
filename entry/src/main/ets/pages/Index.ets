import router from '@ohos.router'
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { UdpConnector, IpConfig } from 'library/src/main/ets/ethernet/UdpConnector'
import { lifting } from 'entry/src/main/ets/proto_js/lifting_service.js'
import { steering_mode } from 'entry/src/main/ets/proto_js/steering_mode_service.js'
import { EthConfigurator } from 'library/src/main/ets/ethernet/EthConfigurator'
import { WebSocketConnector } from 'library/src/main/ets/ethernet/WebSocketConnector'

import ethernet from '@ohos.net.ethernet';
import { Logger } from 'entry/src/main/ets/common/Logger';

const defaultEthPort: string = 'eth0';
const defaultEthConfig: ethernet.InterfaceConfiguration = {
  mode: 0,
  ipAddr: '192.168.137.166',
  route: '192.168.137.2',
  gateway: '192.168.137.2',
  netMask: '255.255.255.0',
  dnsServers: '8.8.8.8'
};
const defaultWsIpAddress: string = 'ws://192.168.137.1:8080';

@Entry
@Component
struct Index {
  @State display: string = '请配置IP';
  @State ethPort: string = 'eth0';
  @State ethConfig: ethernet.InterfaceConfiguration = {
    mode: 0,
    ipAddr: '',
    route: '',
    gateway: '',
    netMask: '',
    dnsServers: ''
  };
  @State ethConfigurator: EthConfigurator = new EthConfigurator();
  @State wsIpAddr: string = '';
  @State wsConnector: WebSocketConnector = new WebSocketConnector();

  build() {
    Row() { // Row()
      Scroll() { //Scroll()
        Column() { // Column()

          Text('WebSocket通信')
            .fontSize(40)
            .fontWeight(FontWeight.Bold)

          Row() {
            Text('  Eth Port: ')
              .fontSize(20)
              .margin({ top: 10 })
              .margin({ bottom: 10 })

            TextInput({ placeholder: 'eth0' })
              .onChange((value: string) => {
                this.ethPort = value;
              })
              .margin({ top: 10 })
              .margin({ bottom: 10 })
              .width('60%')
              .enableKeyboardOnFocus(false)
          }

          Row() {
            Text('  Eth Config mode: ')
              .fontSize(20)
              .margin({ top: 10 })
              .margin({ bottom: 10 })

            TextInput({ placeholder: '0' })
              .type(InputType.Number)
              .onChange((value: string) => {
                this.ethConfig.mode = Number(value);
              })
              .margin({ top: 10 })
              .margin({ bottom: 10 })
              .width('60%')
          }

          Row() {
            Text('  Eth Config ipAddr: ')
              .fontSize(20)
              .margin({ top: 10 })
              .margin({ bottom: 10 })

            TextInput({ placeholder: '192.168.x.x' })
              .onChange((value: string) => {
                this.ethConfig.ipAddr = value;
              })
              .margin({ top: 10 })
              .margin({ bottom: 10 })
              .width('60%')
          }

          Row() {
            Text('  Eth Config route: ')
              .fontSize(20)
              .margin({ top: 10 })
              .margin({ bottom: 10 })

            TextInput({ placeholder: '192.168.x.x' })
              .onChange((value: string) => {
                this.ethConfig.route = value;
              })
              .margin({ top: 10 })
              .margin({ bottom: 10 })
              .width('60%')
          }

          Row() {
            Text('  Eth Config gateway: ')
              .fontSize(20)
              .margin({ top: 10 })
              .margin({ bottom: 10 })

            TextInput({ placeholder: '192.168.x.x' })
              .onChange((value: string) => {
                this.ethConfig.gateway = value;
              })
              .margin({ top: 10 })
              .margin({ bottom: 10 })
              .width('60%')
          }

          Row() {
            Text('  Eth Config netMask: ')
              .fontSize(20)
              .margin({ top: 10 })
              .margin({ bottom: 10 })

            TextInput({ placeholder: '255.255.255.0' })
              .onChange((value: string) => {
                this.ethConfig.netMask = value;
              })
              .margin({ top: 10 })
              .margin({ bottom: 10 })
              .width('60%')
          }

          Row() {
            Text('  Eth Config dnsServers: ')
              .fontSize(20)
              .margin({ top: 10 })
              .margin({ bottom: 10 })

            TextInput({ placeholder: '8.8.8.8' })
              .onChange((value: string) => {
                this.ethConfig.dnsServers = value;
              })
              .margin({ top: 10 })
              .margin({ bottom: 10 })
              .width('60%')
          }

          Row() {
            Text('  WebScoket IpAddr: ')
              .fontSize(20)
              .margin({ top: 10 })
              .margin({ bottom: 10 })

            TextInput({ placeholder: 'ws://192.168.x.x:8080' })
              .onChange((value: string) => {
                this.wsIpAddr = value;
              })
              .margin({ top: 10 })
              .margin({ bottom: 10 })
              .width('60%')
          }

          Row() {
            Button("一键配置")
              .fontSize(30)
              .onClick(() => {
                this.ethConfigurator.setEthPort(defaultEthPort);
                this.ethConfigurator.setEthConfig(defaultEthConfig);
                this.ethConfigurator.setEthConfigPromise();
                this.wsConnector.setWsIpAddress(defaultWsIpAddress);

                this.display = '一键配置已完成';
              })
              .margin({ top: 10 })
              .margin({ bottom: 10 })

            Button("手动配置")
              .fontSize(30)
              .onClick(() => {
                this.ethConfigurator.setEthPort(this.ethPort);
                this.ethConfigurator.setEthConfig(this.ethConfig);
                this.ethConfigurator.setEthConfigPromise();
                this.wsConnector.setWsIpAddress(this.wsIpAddr);

                this.display = '手动配置已完成';
              })
              .margin({ top: 10 })
              .margin({ bottom: 10 })

            Button("IP校验")
              .fontSize(30)
              .onClick(() => {
                let result: ethernet.InterfaceConfiguration = this.ethConfigurator.getEthConfig();
                // TODO 此处有bug，点击两次界面才正常显示，与界面刷新有关
                this.display = 'IP: ' + result.ipAddr;
              })
              .margin({ top: 10 })
              .margin({ bottom: 10 })
          }

          Row() {
            Button("WS连接")
              .fontSize(30)
              .onClick(() => {
                this.wsConnector.connect();

                this.display = 'websocket已连接';
              })
              .margin({ top: 10 })
              .margin({ bottom: 10 })

            Button("WS发送")
              .fontSize(30)
              .onClick(() => {
                let data: string = 'hello, websocket server';
                this.wsConnector.send(data);

                let response: string = this.wsConnector.getResponse();
                
                // TODO 此处有bug，点击两次界面才正常显示，与界面刷新有关
                this.display = response;
              })
              .margin({ top: 10 })
              .margin({ bottom: 10 })

            Button("WS关闭")
              .fontSize(30)
              .onClick(() => {
                this.wsConnector.close();

                this.display = 'websocket连接已关闭';
              })
              .margin({ top: 10 })
              .margin({ bottom: 10 })
          }

          Text(this.display)
            .fontSize(30)


        } // Column()
        .width('100%')
      } //Scroll()
    } // Row()

    .height('100%')
  } //build()
} // Index