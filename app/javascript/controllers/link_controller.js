import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="link"
export default class extends Controller {
  initialize() {
    this.element.dataset.action = 'click->link#visit';
  }

  visit(event) {
    const url = event.currentTarget.dataset.link;

    window.location.href = url;
  }
}
