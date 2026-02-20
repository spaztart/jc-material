/**
 * Safety Companion Top Navigation Bar
 * A fixed top navigation component with menu button, logo, and notification button
 * Uses Material Web components and RGA design tokens
 */

export class ScTopNavbar extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
  }

  connectedCallback() {
    this.render();
  }

  static get observedAttributes() {
    return ['show-logo', 'show-notification', 'notification-count'];
  }

  attributeChangedCallback() {
    this.render();
  }

  get showLogo() {
    return this.getAttribute('show-logo') !== 'false';
  }

  get showNotification() {
    return this.getAttribute('show-notification') !== 'false';
  }

  get notificationCount() {
    return this.getAttribute('notification-count') || '';
  }

  render() {
    const showLogo = this.showLogo;
    const showNotification = this.showNotification;
    const notificationCount = this.notificationCount;

    this.shadowRoot.innerHTML = `
      <style>
        @import url('https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200');

        :host {
          display: block;
          width: 100%;
        }

        .navbar {
          display: flex;
          align-items: center;
          justify-content: space-between;
          height: 58px;
          padding: 0 16px;
          background-color: var(--md-sys-color-surface);
          position: relative;
        }

        .menu-button,
        .notify-button {
          background-color: var(--md-sys-color-surface-variant);
          border-radius: 24px;
          width: 48px;
          height: 48px;
          display: flex;
          align-items: center;
          justify-content: center;
          cursor: pointer;
          border: none;
          padding: 0;
          position: relative;
          transition: background-color 0.2s ease;
        }

        .menu-button:hover,
        .notify-button:hover {
          background-color: var(--md-sys-color-surface-variant);
          filter: brightness(0.95);
        }

        .material-symbols-outlined {
          font-family: 'Material Symbols Outlined';
          font-weight: normal;
          font-style: normal;
          font-size: 24px;
          line-height: 1;
          letter-spacing: normal;
          text-transform: none;
          display: inline-block;
          white-space: nowrap;
          word-wrap: normal;
          direction: ltr;
          -webkit-font-smoothing: antialiased;
          color: var(--md-sys-color-on-surface-variant);
        }

        .logo-container {
          display: flex;
          align-items: center;
          justify-content: center;
          height: 48px;
          flex: 1;
          max-width: 200px;
        }

        .logo-container.hidden {
          display: none;
        }

        .logo {
          height: 16px;
          width: auto;
        }

        .badge {
          position: absolute;
          top: 4px;
          right: 4px;
          background-color: var(--md-sys-color-error);
          border-radius: 200px;
          width: 12px;
          height: 12px;
        }

        .spacer {
          flex: 1;
        }
      </style>

      <nav class="navbar">
        <button class="menu-button" aria-label="Open menu">
          <span class="material-symbols-outlined">menu</span>
        </button>

        ${showLogo ? `
          <div class="logo-container">
            <img class="logo" src="../assets/mcafee-logo.svg" alt="McAfee" />
          </div>
        ` : '<div class="spacer"></div>'}

        <button class="notify-button" aria-label="Notifications">
          <span class="material-symbols-outlined">notifications</span>
          ${notificationCount ? '<span class="badge"></span>' : ''}
        </button>
      </nav>
    `;

    this.attachEventListeners();
  }

  attachEventListeners() {
    const menuButton = this.shadowRoot.querySelector('.menu-button');
    const notifyButton = this.shadowRoot.querySelector('.notify-button');

    menuButton?.addEventListener('click', () => {
      this.dispatchEvent(new CustomEvent('menu-click', { bubbles: true, composed: true }));
    });

    notifyButton?.addEventListener('click', () => {
      this.dispatchEvent(new CustomEvent('notification-click', { bubbles: true, composed: true }));
    });
  }
}

customElements.define('sc-top-navbar', ScTopNavbar);
