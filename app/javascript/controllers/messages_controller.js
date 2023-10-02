import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="messages"
export default class extends Controller {
  static targets = ['input'];

  initialize() {
    this.element.dataset.action = 'turbo:submit-end->messages#clearInput';
  }

  clearInput() {
    this.inputTarget.value = '';
  }
}
