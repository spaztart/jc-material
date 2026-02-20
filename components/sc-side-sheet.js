/**
 * Safety Companion Side Sheet
 * Sliding sidebar navigation that adapts to both mobile and desktop layouts
 * Contains navigation menu items, CTAs, and supporting actions
 * Uses Material Web components and RGA design tokens
 */

export class ScSideSheet extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
  }

  connectedCallback() {
    this.render();
  }

  static get observedAttributes() {
    return ['title', 'show-back', 'show-close', 'show-logo', 'show-actions', 'show-footer'];
  }

  attributeChangedCallback() {
    this.render();
  }

  get title() {
    return this.getAttribute('title') || 'Title';
  }

  get showBack() {
    return this.getAttribute('show-back') !== 'false';
  }

  get showClose() {
    return this.getAttribute('show-close') !== 'false';
  }

  get showLogo() {
    return this.getAttribute('show-logo') !== 'false';
  }

  get showActions() {
    return this.getAttribute('show-actions') !== 'false';
  }

  get showFooter() {
    return this.getAttribute('show-footer') !== 'false';
  }

  render() {
    const title = this.title;
    const showBack = this.showBack;
    const showClose = this.showClose;
    const showLogo = this.showLogo;
    const showActions = this.showActions;
    const showFooter = this.showFooter;

    this.shadowRoot.innerHTML = `
      <style>
        @import url('https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200');

        :host {
          display: block;
          max-width: 400px;
        }

        .side-sheet {
          display: flex;
          flex-direction: column;
          background-color: var(--md-sys-color-surface-container);
          border-radius: 16px;
          padding: 0 20px;
          height: 100%;
          min-height: 600px;
        }

        .header {
          display: flex;
          align-items: center;
          padding: 12px 10px 16px;
          gap: 10px;
        }

        .icon-button {
          width: 48px;
          height: 48px;
          display: flex;
          align-items: center;
          justify-content: center;
          cursor: pointer;
          background: none;
          border: none;
          padding: 0;
          border-radius: 100px;
          transition: background-color 0.2s ease;
        }

        .icon-button:hover {
          background-color: var(--md-sys-color-surface-container-high);
        }

        .material-symbols-outlined {
          font-family: 'Material Symbols Outlined';
          font-weight: normal;
          font-style: normal;
          font-size: 24px;
          line-height: 1;
          color: var(--md-sys-color-on-surface);
        }

        .logo-title-container {
          display: flex;
          flex: 1;
          align-items: center;
          gap: 10px;
          padding: 10px;
        }

        .logo {
          height: 16px;
          width: auto;
        }

        .title {
          font-family: var(--md-sys-typescale-title-medium-font);
          font-size: var(--md-sys-typescale-title-medium-size);
          font-weight: var(--md-sys-typescale-title-medium-weight);
          line-height: var(--md-sys-typescale-title-medium-line-height);
          letter-spacing: var(--md-sys-typescale-title-medium-tracking);
          color: var(--md-sys-color-on-surface);
        }

        .content {
          flex: 1;
          overflow-y: auto;
          padding: 16px 0;
        }

        .menu-item {
          display: flex;
          align-items: center;
          justify-content: space-between;
          padding: 16px;
          cursor: pointer;
          border-radius: 8px;
          transition: background-color 0.2s ease;
        }

        .menu-item:hover {
          background-color: var(--md-sys-color-surface-container-high);
        }

        .menu-item-content {
          display: flex;
          align-items: center;
          gap: 12px;
        }

        .menu-item-text {
          font-family: var(--md-sys-typescale-label-large-font);
          font-size: var(--md-sys-typescale-label-large-size);
          font-weight: var(--md-sys-typescale-label-large-weight);
          line-height: var(--md-sys-typescale-label-large-line-height);
          letter-spacing: var(--md-sys-typescale-label-large-tracking);
          color: var(--md-sys-color-on-surface-variant);
        }

        .divider {
          height: 1px;
          background-color: var(--md-sys-color-outline-variant);
          margin: 16px 0;
        }

        .actions {
          display: flex;
          gap: 12px;
          padding: 16px 0;
        }

        .button {
          padding: 10px 24px;
          border-radius: 100px;
          font-family: var(--md-sys-typescale-label-large-font);
          font-size: var(--md-sys-typescale-label-large-size);
          font-weight: var(--md-sys-typescale-label-large-weight);
          cursor: pointer;
          border: none;
          transition: all 0.2s ease;
        }

        .button-filled {
          background-color: var(--md-sys-color-primary);
          color: var(--md-sys-color-on-primary);
        }

        .button-outlined {
          background-color: transparent;
          color: var(--md-sys-color-primary);
          border: 1px solid var(--md-sys-color-outline-variant);
        }

        .button:hover {
          opacity: 0.9;
        }

        .footer {
          padding: 16px 0;
        }

        .footer-item {
          display: flex;
          align-items: center;
          justify-content: space-between;
          padding: 12px 16px;
          cursor: pointer;
          border-radius: 8px;
          transition: background-color 0.2s ease;
        }

        .footer-item:hover {
          background-color: var(--md-sys-color-surface-container-high);
        }

        .footer-content {
          display: flex;
          align-items: center;
          gap: 12px;
        }

        .footer-icons {
          display: flex;
          gap: 8px;
        }
      </style>

      <div class="side-sheet">
        <div class="header">
          ${showBack ? `
            <button class="icon-button" aria-label="Back">
              <span class="material-symbols-outlined">arrow_back</span>
            </button>
          ` : ''}
          <div class="logo-title-container">
            ${showLogo ? `
              <img class="logo" src="../assets/mcafee-logo.svg" alt="McAfee" />
            ` : ''}
            <span class="title">${title}</span>
          </div>
          ${showClose ? `
            <button class="icon-button" aria-label="Close">
              <span class="material-symbols-outlined">close</span>
            </button>
          ` : ''}
        </div>

        <div class="content">
          <slot name="menu-items">
            ${Array.from({length: 10}, (_, i) => `
              <div class="menu-item" data-index="${i}">
                <div class="menu-item-content">
                  <span class="material-symbols-outlined">arrow_forward</span>
                  <span class="menu-item-text">Menu item</span>
                </div>
                <span class="material-symbols-outlined">arrow_forward</span>
              </div>
            `).join('')}
          </slot>
        </div>

        ${showActions ? `
          <div class="divider"></div>
          <div class="actions">
            <button class="button button-filled">Save</button>
            <button class="button button-outlined">Cancel</button>
          </div>
        ` : ''}

        ${showFooter ? `
          <div class="divider"></div>
          <div class="footer">
            <div class="footer-item">
              <div class="footer-content">
                <span class="material-symbols-outlined">logout</span>
                <span class="menu-item-text">Sign out</span>
              </div>
              <div class="footer-icons">
                <span class="material-symbols-outlined">open_in_new</span>
                <span class="material-symbols-outlined">logout</span>
              </div>
            </div>
          </div>
        ` : ''}
      </div>
    `;

    this.attachEventListeners();
  }

  attachEventListeners() {
    const backButton = this.shadowRoot.querySelector('[aria-label="Back"]');
    const closeButton = this.shadowRoot.querySelector('[aria-label="Close"]');
    const menuItems = this.shadowRoot.querySelectorAll('.menu-item');
    const saveButton = this.shadowRoot.querySelector('.button-filled');
    const cancelButton = this.shadowRoot.querySelector('.button-outlined');
    const footerItem = this.shadowRoot.querySelector('.footer-item');

    backButton?.addEventListener('click', () => {
      this.dispatchEvent(new CustomEvent('back', { bubbles: true, composed: true }));
    });

    closeButton?.addEventListener('click', () => {
      this.dispatchEvent(new CustomEvent('close', { bubbles: true, composed: true }));
    });

    menuItems.forEach(item => {
      item.addEventListener('click', () => {
        const index = item.dataset.index;
        this.dispatchEvent(new CustomEvent('menu-click', {
          bubbles: true,
          composed: true,
          detail: { index: parseInt(index) }
        }));
      });
    });

    saveButton?.addEventListener('click', () => {
      this.dispatchEvent(new CustomEvent('save', { bubbles: true, composed: true }));
    });

    cancelButton?.addEventListener('click', () => {
      this.dispatchEvent(new CustomEvent('cancel', { bubbles: true, composed: true }));
    });

    footerItem?.addEventListener('click', () => {
      this.dispatchEvent(new CustomEvent('signout', { bubbles: true, composed: true }));
    });
  }
}

customElements.define('sc-side-sheet', ScSideSheet);
