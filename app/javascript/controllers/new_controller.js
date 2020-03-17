
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ ]

  connect() {
    console.log("Hello from the new controller!")
  }

  addLetter () {
    var letter = event.target.dataset.value;
    console.log(letter);
  }
}
