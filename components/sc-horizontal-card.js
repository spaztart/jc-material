/**
 * Safety Companion Horizontal Card
 * Structured card layout that surfaces issues, statuses, and system prompts
 * Contains issue title, timestamp, status chip, and details link
 * Uses Material Web components and RGA design tokens
 */

export class ScHorizontalCard extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
  }

  connectedCallback() {
    this.render();
  }

  static get observedAttributes() {
    return ['state', 'header', 'subhead', 'link', 'description', 'status', 'chip-state', 'chip-label'];
  }

  attributeChangedCallback() {
    this.render();
  }

  get state() {
    return this.getAttribute('state') || 'outlined';
  }

  get header() {
    return this.getAttribute('header') || 'Header';
  }

  get subhead() {
    return this.getAttribute('subhead') || 'Subhead';
  }

  get link() {
    return this.getAttribute('link') || 'Link';
  }

  get description() {
    return this.getAttribute('description') || 'description';
  }

  get status() {
    return this.getAttribute('status') || 'On';
  }

  get chipState() {
    return this.getAttribute('chip-state') || 'Safe';
  }

  get chipLabel() {
    return this.getAttribute('chip-label') || 'Safe';
  }

  render() {
    const state = this.state;
    const header = this.header;
    const subhead = this.subhead;
    const link = this.link;
    const description = this.description;
    const status = this.status;
    const chipState = this.chipState;
    const chipLabel = this.chipLabel;

    this.shadowRoot.innerHTML = `
      <style>
        @import url('https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200');

        :host {
          display: block;
          width: 360px;
        }

        .card {
          display: flex;
          flex-direction: column;
          padding: 14px;
          border-radius: 12px;
          background-color: var(--md-sys-color-surface);
          cursor: pointer;
          transition: all 0.2s ease;
        }

        .card.outlined {
          border: 1px solid var(--md-sys-color-outline-variant);
        }

        .card.elevated {
          box-shadow: 0px 1px 2px 0px rgba(0,0,0,0.3), 0px 1px 3px 0px rgba(0,0,0,0.15);
        }

        .card.focused {
          background-color: rgba(28, 27, 28, 0.1);
          border: 1px solid var(--md-sys-color-outline-variant);
        }

        .card:hover {
          background-color: var(--md-sys-color-surface-container-highest);
        }

        .card-actions {
          display: flex;
          align-items: center;
          padding-bottom: 10px;
          width: 100%;
        }

        .icon-container {
          display: flex;
          align-items: center;
          justify-content: center;
          padding-right: 10px;
        }

        .material-symbols-outlined {
          font-family: 'Material Symbols Outlined';
          font-weight: normal;
          font-style: normal;
          font-size: 24px;
          line-height: 1;
          color: var(--md-sys-color-primary);
        }

        .chip-container {
          flex: 1;
          display: flex;
          align-items: center;
        }

        .status-container {
          display: flex;
          align-items: center;
          justify-content: center;
          padding: 0 16px;
        }

        .status-text {
          font-family: 'Poppins', sans-serif;
          font-size: 14px;
          font-weight: 600;
          line-height: 20px;
          letter-spacing: 0.1px;
          color: var(--md-sys-color-on-surface);
          text-align: right;
        }

        .card-content {
          display: flex;
          flex-direction: column;
          gap: 4px;
          width: 100%;
        }

        .header-text {
          font-family: 'Poppins', sans-serif;
          font-size: 16px;
          font-weight: 500;
          line-height: 24px;
          letter-spacing: 0.15px;
          color: var(--md-sys-color-on-surface);
        }

        .subhead-text {
          font-family: 'Poppins', sans-serif;
          font-size: 14px;
          font-weight: 400;
          line-height: 20px;
          letter-spacing: 0.25px;
          color: var(--md-sys-color-on-surface);
        }

        .link-text {
          font-family: 'Poppins', sans-serif;
          font-size: 14px;
          font-weight: 500;
          line-height: 20px;
          letter-spacing: 0.1px;
          color: var(--md-sys-color-primary);
        }

        .description-text {
          font-family: 'Poppins', sans-serif;
          font-size: 12px;
          font-weight: 400;
          line-height: 16px;
          letter-spacing: 0.4px;
          color: var(--md-sys-color-on-surface-variant);
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
        }
      </style>

      <div class="card ${state}">
        <div class="card-actions">
          <div class="icon-container">
            <span class="material-symbols-outlined">mood</span>
          </div>
          <div class="chip-container">
            <sc-chip state="${chipState}" label="${chipLabel}" show-trailing-icon="false"></sc-chip>
          </div>
          <div class="status-container">
            <span class="status-text">${status}</span>
          </div>
          <span class="material-symbols-outlined">chevron_right</span>
        </div>
        <div class="card-content">
          <div class="header-text">${header}</div>
          <div class="subhead-text">${subhead}</div>
          <div class="link-text">${link}</div>
          <div class="description-text">${description}</div>
        </div>
      </div>
    `;

    this.attachEventListeners();
  }

  attachEventListeners() {
    const card = this.shadowRoot.querySelector('.card');
    card?.addEventListener('click', () => {
      this.dispatchEvent(new CustomEvent('card-click', { bubbles: true, composed: true }));
    });
  }
}

customElements.define('sc-horizontal-card', ScHorizontalCard);
