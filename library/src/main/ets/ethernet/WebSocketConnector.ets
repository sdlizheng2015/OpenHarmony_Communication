import ethernet from '@ohos.net.ethernet';
import webSocket from '@ohos.net.webSocket';
import { BusinessError } from '@ohos.base';
import { Logger } from 'entry/src/main/ets/common/Logger';

export class WebSocketConnector {
  private logger: Logger = new Logger('myWebSocket');
  private ws = webSocket.createWebSocket();
  private wsIpAddress = '';
  private response: string = '';

  constructor() {
    this.logger.info("class WebSocketConnector constructor");

    this.ws.on('message', (err: BusinessError, value: string | ArrayBuffer) => {
      this.response = String(value);
      this.logger.info("response: " + value);
    })
  } //constructor()

  setWsIpAddress(ws_ip_address: string) {
    this.wsIpAddress = ws_ip_address;
  } //setWsIpAddress()

  connect() {
    this.ws.connect(this.wsIpAddress, (err: BusinessError, value: boolean) => {
      if (!err) {
        this.logger.info("Connected successfully");
      } else {
        this.logger.error("Connection failed. Err:" + JSON.stringify(err));
      }
    });
  } //connect()

  send(data: string) {
    this.ws.send(data, (err: BusinessError, value: boolean) => {
      if (!err) {
        this.logger.info("Message sent successfully");
      } else {
        this.logger.error("Failed to send the message. Err:" + JSON.stringify(err));
      }
    })
  } //send()

  close() {
    this.ws.close((err: BusinessError, value: boolean) => {
      if (!err) {
        this.logger.info("Connection closed successfully");
      } else {
        this.logger.error("Failed to close the connection. Err: " + JSON.stringify(err));
      }
    })
  } //close()

  getResponse(): string {
    return this.response;
  } //getResponse()
} // class WebSocketConnector