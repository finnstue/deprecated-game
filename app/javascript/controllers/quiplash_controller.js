// app/javascript/controllers/quiplash_controller.js

import { Controller } from "stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  connect() {
    // Subscribe to the Quiplash channel
    this.channel = consumer.subscriptions.create({ channel: "Quiplash" }, {
      received: (data) => {
        console.log("Received data: ", data);
        if (data.game_started) {
          // Redirect to the play view or update the UI as needed
          window.location.href = `/games/${data.game_id}/play`
        }
      }
    })
  }
}