import router from '@ohos.router'
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { UdpConnector, IpConfig } from 'library/src/main/ets/ethernet/UdpConnector'
import { lifting } from 'entry/src/main/ets/proto_js/lifting_service.js'
import { steering_mode } from 'entry/src/main/ets/proto_js/steering_mode_service.js'

@Entry
@Component
struct Index {
  @State message: string = 'UDP通信测试';
  @State display: string = '请配置eth0';
  @State udp_connector: UdpConnector = new UdpConnector();
  @State ipAddr: string = '';
  @State route: string = '';
  @State gateway: string = '';
  @State netMask: string = '';
  @State dnsServers: string = '';
  @State Port: number = 0;
  @State targetIpAddr: string = '';
  @State targetPort: number = 0;

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Row() {
          Text('  ipAddr: ')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })

          TextInput({ placeholder: 'input ipAddr: 192.168.x.x' }).margin({ top: 20 })
            .onSubmit((EnterKeyType) => {
              console.info(EnterKeyType + '输入法回车键的类型值')
            })
            .onChange((value: string) => {
              this.ipAddr = value;
              console.info(value);
            }).margin({ bottom: 10 })
        }

        Row() {
          Text('  route: ')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })

          TextInput({ placeholder: 'input route: 192.168.x.x' }).margin({ top: 20 })
            .onSubmit((EnterKeyType) => {
              console.info(EnterKeyType + '输入法回车键的类型值')
            })
            .onChange((value: string) => {
              this.route = value;
              console.info(value);
            }).margin({ bottom: 10 })
        }

        Row() {
          Text('  gateway: ')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })

          TextInput({ placeholder: 'input gateway: 192.168.x.x' }).margin({ top: 20 })
            .onSubmit((EnterKeyType) => {
              console.info(EnterKeyType + '输入法回车键的类型值')
            })
            .onChange((value: string) => {
              this.gateway = value;
              console.info(value);
            }).margin({ bottom: 10 })
        }

        Row() {
          Text('  netMask: ')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })

          TextInput({ placeholder: 'input netMask: 255.255.255.0' }).margin({ top: 20 })
            .onSubmit((EnterKeyType) => {
              console.info(EnterKeyType + '输入法回车键的类型值')
            })
            .onChange((value: string) => {
              this.netMask = value;
              console.info(value);
            }).margin({ bottom: 10 })
        }

        Row() {
          Text('  dnsServers: ')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })

          TextInput({ placeholder: 'input dnsServers: 8.8.8.8' }).margin({ top: 20 })
            .onSubmit((EnterKeyType) => {
              console.info(EnterKeyType + '输入法回车键的类型值')
            })
            .onChange((value: string) => {
              this.dnsServers = value;
              console.info(value);
            }).margin({ bottom: 10 })
        }

        Row() {
          Text('  Port: ')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })

          TextInput({ placeholder: 'input Port: 8080' })
            .margin({ top: 20 })
            .onSubmit((EnterKeyType) => {
              console.info(EnterKeyType + '输入法回车键的类型值')
            })
            .type(InputType.Number)
            .onChange((value: string) => {
              this.Port = Number(value);
              console.info(value);
            })
            .margin({ bottom: 10 })
        }

        Row() {
          Text('  targetIpAddr: ')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })

          TextInput({ placeholder: 'input targetIpAddr: 192.168.x.x' }).margin({ top: 20 })
            .onSubmit((EnterKeyType) => {
              console.info(EnterKeyType + '输入法回车键的类型值')
            })
            .onChange((value: string) => {
              this.targetIpAddr = value;
              console.info(value);
            }).margin({ bottom: 10 })
        }

        Row() {
          Text('  targetPort: ')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })

          TextInput({ placeholder: 'input targetPort: 9090' })
            .margin({ top: 20 })
            .onSubmit((EnterKeyType) => {
              console.info(EnterKeyType + '输入法回车键的类型值')
            })
            .type(InputType.Number)
            .onChange((value: string) => {
              this.targetPort = Number(value);
              console.info(value);
            })
            .margin({ bottom: 10 })
        }

        Button("确认配置")
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            // let ip: IpConfig = {
            //   ipAddr: this.ipAddr,
            //   route: this.route,
            //   gateway: this.gateway,
            //   netMask: this.netMask,
            //   dnsServers: this.dnsServers
            // }

            let ip: IpConfig = {
              ipAddr: '192.168.1.166',
              route: '192.168.1.1',
              gateway: '192.168.1.1',
              netMask: '255.255.255.0',
              dnsServers: '8.8.8.8'
            }

            this.udp_connector.eth0_config(ip);
            let current_ip_addr: string = this.udp_connector.getIpAddr();
            this.display = '当前IP： ' + String(current_ip_addr);
          })
          .margin({ bottom: 20 })

        Row() {
          Button("绑定")
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              // this.udp_connector.bind(this.ipAddr, this.Port);
              this.udp_connector.bind('192.168.1.166', 1234);

              this.display = "绑定至本机eth0";
            })
            .margin({ bottom: 20 })

          Button("关闭")
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              this.udp_connector.close();
              this.display = "关闭socket连接";
            })
            .margin({ bottom: 20 })
        }

        Row() {
          Text('单车')
            .fontSize(30)
            .margin({ bottom: 20 })

          Button("前轮")
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let msg = steering_mode.SteeringModeResponse.create({
                steeringMode: "module",
                steeringModeId: 10 });

              let debug_string = steering_mode.SteeringModeResponse.verify(msg);
              hilog.debug(0x0001, 'testUDP', '%{public}s', debug_string);


              let encode_msg: Uint8Array = steering_mode.SteeringModeResponse.encode(msg).finish();

              let arrayBuffer: ArrayBuffer = this.udp_connector.unit8ArrayToBuffer(encode_msg);

              this.udp_connector.send('192.168.1.15', 4321, arrayBuffer);
              // this.udp_connector.send('192.168.1.15', 4321, String(arrayBuffer));

              // this.udp_connector.send(this.targetIpAddr, this.targetPort, arrayBuffer);
            })
            .margin({ bottom: 20 })

          Button("四轮")
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let msg = steering_mode.SteeringModeResponse.create({
                steeringMode: 'module and all steering',
                steeringModeId: 1 })

              // this.arrayBuffer= steering_mode.SteeringModeResponse.encode(msg).finish();
              // this.udp_connector.send(this.targetIpAddr, this.targetPort, String(this.arrayBuffer));
            })
            .margin({ bottom: 20 })

          Button("斜行")
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let msg = steering_mode.SteeringModeResponse.create({
                steeringMode: 'module and diagonal steering',
                steeringModeId: 3 })

              // this.arrayBuffer= steering_mode.SteeringModeResponse.encode(msg).finish();
              // this.udp_connector.send(this.targetIpAddr, this.targetPort, String(this.arrayBuffer));
            })
            .margin({ bottom: 20 })
        }

        Row() {
          Text('六轴')
            .fontSize(30)
            .margin({ bottom: 20 })

          Button("前桥")
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let msg = steering_mode.SteeringModeResponse.create({
                steeringMode: 'vehicle and front steering',
                steeringModeId: 60 })

              // this.arrayBuffer= steering_mode.SteeringModeResponse.encode(msg).finish();
              // this.udp_connector.send(this.targetIpAddr, this.targetPort, String(this.arrayBuffer));
            })
            .margin({ bottom: 20 })

          Button("前后桥")
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let msg = steering_mode.SteeringModeResponse.create({
                steeringMode: 'vehicle and front & back steering',
                steeringModeId: 61 })
              //
              // this.arrayBuffer= steering_mode.SteeringModeResponse.encode(msg).finish();
              // this.udp_connector.send(this.targetIpAddr, this.targetPort, String(this.arrayBuffer));
            })
            .margin({ bottom: 20 })

          Button("斜行")
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let msg = steering_mode.SteeringModeResponse.create({
                steeringMode: 'vehicle and diagonal steering',
                steeringModeId: 62 })

              // this.arrayBuffer= steering_mode.SteeringModeResponse.encode(msg).finish();
              // this.udp_connector.send(this.targetIpAddr, this.targetPort, String(this.arrayBuffer));
            })
            .margin({ bottom: 20 })
        }


        Text(this.display)
          .fontSize(30)
      }
      .width('100%')
    }

    .height('100%')
  }
}