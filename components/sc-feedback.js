/**
 * Safety Companion Feedback
 * Provides lightweight, inline post-interaction feedback
 * Functions like ChatGPT's "Was this helpful?" module
 * Uses Material Web components and RGA design tokens
 */

export class ScFeedback extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
    this.state = 'default'; // default, positive, negative
  }

  connectedCallback() {
    this.render();
  }

  static get observedAttributes() {
    return ['text', 'state'];
  }

  attributeChangedCallback() {
    this.render();
  }

  get text() {
    return this.getAttribute('text') || 'Was this helpful?';
  }

  setState(newState) {
    this.state = newState;
    this.render();
    this.dispatchEvent(new CustomEvent('feedback-change', {
      bubbles: true,
      composed: true,
      detail: { state: newState }
    }));
  }

  render() {
    const text = this.text;
    const state = this.state;

    this.shadowRoot.innerHTML = `
      <style>
        @import url('https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200');

        :host {
          display: block;
        }

        .feedback-container {
          display: flex;
          align-items: center;
          justify-content: flex-end;
          gap: 12px;
        }

        .feedback-text {
          font-family: var(--md-sys-typescale-body-medium-font);
          font-size: var(--md-sys-typescale-body-medium-size);
          font-weight: var(--md-sys-typescale-body-medium-weight);
          line-height: var(--md-sys-typescale-body-medium-line-height);
          letter-spacing: var(--md-sys-typescale-body-medium-tracking);
          color: var(--md-sys-color-outline);
        }

        .feedback-button {
          width: 20px;
          height: 20px;
          display: flex;
          align-items: center;
          justify-content: center;
          cursor: pointer;
          background: none;
          border: none;
          padding: 0;
          transition: transform 0.2s ease;
        }

        .feedback-button:hover {
          transform: scale(1.1);
        }

        .feedback-button:active {
          transform: scale(0.95);
        }

        .material-symbols-outlined {
          font-family: 'Material Symbols Outlined';
          font-weight: normal;
          font-style: normal;
          font-size: 20px;
          line-height: 1;
          letter-spacing: normal;
          text-transform: none;
          display: inline-block;
          white-space: nowrap;
          word-wrap: normal;
          direction: ltr;
          -webkit-font-smoothing: antialiased;
          color: var(--md-sys-color-outline);
        }

        .material-symbols-outlined.filled {
          font-variation-settings: 'FILL' 1;
          color: var(--md-sys-color-primary);
        }

        .thumbs-down {
          transform: rotate(180deg) scaleY(-1);
        }
      </style>

      <div class="feedback-container">
        <span class="feedback-text">${text}</span>
        <button class="feedback-button" data-action="positive" aria-label="Thumbs up">
          <span class="material-symbols-outlined ${state === 'positive' ? 'filled' : ''}">thumb_up</span>
        </button>
        <button class="feedback-button" data-action="negative" aria-label="Thumbs down">
          <span class="material-symbols-outlined thumbs-down ${state === 'negative' ? 'filled' : ''}">thumb_up</span>
        </button>
      </div>
    `;

    this.attachEventListeners();
  }

  attachEventListeners() {
    const buttons = this.shadowRoot.querySelectorAll('.feedback-button');
    buttons.forEach(button => {
      button.addEventListener('click', () => {
        const action = button.dataset.action;
        if (this.state === action) {
          this.setState('default');
        } else {
          this.setState(action);
        }
      });
    });
  }
}

customElements.define('sc-feedback', ScFeedback);
