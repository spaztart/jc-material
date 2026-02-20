/**
 * Safety Companion Button List
 * Row or group of compact action buttons displayed at the end of a prompt
 * Suggests next steps the user can take, similar to ChatGPT's suggested action chips
 * Uses Material Web components and RGA design tokens
 */

export class ScButtonList extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
  }

  connectedCallback() {
    this.render();
  }

  static get observedAttributes() {
    return ['border', 'link-text', 'show-icon', 'show-text', 'show-trailing-icon'];
  }

  attributeChangedCallback() {
    this.render();
  }

  get border() {
    return this.getAttribute('border') || 'default';
  }

  get linkText() {
    return this.getAttribute('link-text') || 'Link text';
  }

  get showIcon() {
    return this.getAttribute('show-icon') !== 'false';
  }

  get showText() {
    return this.getAttribute('show-text') !== 'false';
  }

  get showTrailingIcon() {
    return this.getAttribute('show-trailing-icon') !== 'false';
  }

  render() {
    const border = this.border;
    const linkText = this.linkText;
    const showIcon = this.showIcon;
    const showText = this.showText;
    const showTrailingIcon = this.showTrailingIcon;
    const hasBorder = border === 'border';

    this.shadowRoot.innerHTML = `
      <style>
        @import url('https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200');

        :host {
          display: inline-block;
        }

        .button-container {
          display: flex;
          align-items: center;
          justify-content: center;
          height: 42px;
          padding: 0 10px;
          cursor: pointer;
          transition: all 0.2s ease;
        }

        .button-container.default {
          border-radius: 5px 5px 5px 5px;
        }

        .button-container.border {
          border: 1px solid var(--md-sys-color-primary);
          border-radius: 12px;
        }

        .button-container:hover {
          background-color: var(--md-sys-color-surface-container);
        }

        .button-container:active {
          transform: scale(0.98);
        }

        .button-content {
          display: flex;
          align-items: center;
          justify-content: center;
          gap: 10px;
          overflow: hidden;
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
          color: var(--md-sys-color-primary);
          flex-shrink: 0;
        }

        .icon-leading {
          transform: rotate(180deg);
        }

        .button-text {
          font-family: var(--md-sys-typescale-label-large-font);
          font-size: var(--md-sys-typescale-label-large-size);
          font-weight: var(--md-sys-typescale-label-large-weight);
          line-height: var(--md-sys-typescale-label-large-line-height);
          letter-spacing: var(--md-sys-typescale-label-large-tracking);
          color: var(--md-sys-color-primary);
          white-space: nowrap;
          flex-shrink: 0;
        }
      </style>

      <div class="button-container ${hasBorder ? 'border' : 'default'}">
        <div class="button-content">
          ${showIcon ? '<span class="material-symbols-outlined icon-leading">reply</span>' : ''}
          ${showText ? `<span class="button-text">${linkText}</span>` : ''}
          ${showTrailingIcon ? '<span class="material-symbols-outlined">open_in_new</span>' : ''}
        </div>
      </div>
    `;

    this.attachEventListeners();
  }

  attachEventListeners() {
    const button = this.shadowRoot.querySelector('.button-container');
    button?.addEventListener('click', () => {
      this.dispatchEvent(new CustomEvent('click', { bubbles: true, composed: true }));
    });
  }
}

customElements.define('sc-button-list', ScButtonList);
