
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "guess" ]

  connect() {
  }

  addLetter () {
    const inputField = this.guessTarget;
    var letter = event.target.dataset.value;
    ( inputField.value.length < 9 ) ? inputField.value += letter : alert("Max 9 letters please!!");
  }
}
