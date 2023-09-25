import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['modal'];

  connect() {

  }

  open() {
    this.modalTarget.classList.remove('hidden');
    this.modalTarget.setAttribute('aria-modal', 'true');
    this.modalTarget.setAttribute('role', 'dialog');
    this.modalTarget.removeAttribute('aria-hidden');

    this.createBackdrop();
    this.setupModalCloseEventListeners();
  }

  close() {
    this.modalTarget.classList.add('hidden');
    this.modalTarget.setAttribute('aria-hidden', 'true');
    this.modalTarget.removeAttribute('aria-modal');
    this.modalTarget.removeAttribute('role');

    this.destroyBackdrop();
    this.removeModalCloseEventListeners();
  }

  createBackdrop() {
    const backdropEl = document.createElement('div');
    backdropEl.setAttribute('modal-backdrop', '');
    backdropEl.classList.add('bg-gray-900', 'bg-opacity-50', 'dark:bg-opacity-80', 'fixed', 'inset-0', 'z-30');
    document.querySelector('body').append(backdropEl);
  }

  destroyBackdrop() {
    document.querySelector('[modal-backdrop]').remove();
  }

  setupModalCloseEventListeners() {
    this.modalTarget.addEventListener('click', this.clickOutsideHandler.bind(this));
    this.modalTarget.addEventListener('keydown', this.keydownHandler.bind(this));
  }

  removeModalCloseEventListeners() {
    this.modalTarget.removeEventListener('click', this.clickOutsideHandler.bind(this));
    this.modalTarget.removeEventListener('keydown', this.keydownHandler.bind(this));
  }

  clickOutsideHandler(event) {
    if (event.target === this.modalTarget) {
      this.close();
    }
  }

  keydownHandler(event) {
    if (event.key === 'Escape') {
      this.close();
    }
  }
}
