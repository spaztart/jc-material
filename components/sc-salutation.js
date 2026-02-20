/**
 * Safety Companion Salutation
 * Dedicated text element used for greetings or welcome messaging
 * Appears only on the homepage or welcome screen
 * Uses Material Web components and RGA design tokens
 */

export class ScSalutation extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
  }

  connectedCallback() {
    this.render();
  }

  static get observedAttributes() {
    return ['greeting', 'name'];
  }

  attributeChangedCallback() {
    this.render();
  }

  get greeting() {
    return this.getAttribute('greeting') || 'Good afternoon';
  }

  get name() {
    return this.getAttribute('name') || 'Evangelina Schwarzenegger';
  }

  render() {
    const greeting = this.greeting;
    const name = this.name;

    this.shadowRoot.innerHTML = `
      <style>
        :host {
          display: block;
        }

        .salutation-container {
          position: relative;
          width: 100%;
          min-height: 60px;
        }

        .salutation-text {
          font-family: 'Poppins', sans-serif;
          font-size: 22px;
          font-weight: 400;
          line-height: 28px;
          letter-spacing: -0.5px;
          color: var(--md-sys-color-on-surface);
          margin: 0;
        }

        .salutation-name {
          font-weight: 500;
          display: block;
        }
      </style>

      <div class="salutation-container">
        <p class="salutation-text">
          ${greeting},
          <span class="salutation-name">${name}</span>
        </p>
      </div>
    `;
  }
}

customElements.define('sc-salutation', ScSalutation);
