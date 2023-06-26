import { Controller } from "stimulus";
import Modal from "modal.js"

export default class extends Controller {
  static targets = ["modal"];

  connect() {
    console.log (this.element)
  }

  openModal() {
    this.modalTarget.classList.add("active");
  }

  closeModal() {
    this.modalTarget.classList.remove("active");
  }
  sayHello() {
    this.modalTarget.innerHTML = "HELLO !"
  }
}
