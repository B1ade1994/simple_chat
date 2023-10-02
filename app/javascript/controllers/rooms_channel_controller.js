import { Controller } from "@hotwired/stimulus"
import consumer from '../channels/consumer';

// Connects to data-controller="rooms-channel"
export default class extends Controller {
  connect() {
    this.channel = consumer.subscriptions.create('RoomsChannel', {
      connected: this.cableConnected.bind(this),
      disconnected: this.cableDisconnected.bind(this),
      received: this.cableReceived.bind(this),
    });
  }

  disconnect() {
    this.channel.unsubscribe();
  }

  cableConnected() {
    // Called when the subscription is ready for use on the server
  }

  cableDisconnected() {
    // Called when the subscription has been terminated by the server
  }

  cableReceived(data) {
    // Called when there's incoming data on the websocket for this channel
    // this.messagesTarget.innerHTML += data.message;
    this.element.innerHTML += data;
  }
}
