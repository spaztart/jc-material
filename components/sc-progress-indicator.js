/**
 * Safety Companion Progress Indicator
 * Loading animation used to show active processing
 * Behaves similarly to ChatGPT typing/loading indicator
 * Uses Material Web components and RGA design tokens
 */

export class ScProgressIndicator extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
  }

  connectedCallback() {
    this.render();
  }

  static get observedAttributes() {
    return ['loading-text', 'show-loading-bubbles', 'show-loading-text', 'show-logo'];
  }

  attributeChangedCallback() {
    this.render();
  }

  get loadingText() {
    return this.getAttribute('loading-text') || 'On it! Just a moment...';
  }

  get showLoadingBubbles() {
    return this.getAttribute('show-loading-bubbles') !== 'false';
  }

  get showLoadingText() {
    return this.getAttribute('show-loading-text') !== 'false';
  }

  get showLogo() {
    return this.getAttribute('show-logo') !== 'false';
  }

  render() {
    const loadingText = this.loadingText;
    const showLoadingBubbles = this.showLoadingBubbles;
    const showLoadingText = this.showLoadingText;
    const showLogo = this.showLogo;

    this.shadowRoot.innerHTML = `
      <style>
        :host {
          display: block;
        }

        .progress-container {
          display: flex;
          align-items: flex-start;
          gap: 16px;
          min-width: 240px;
          padding-right: 10px;
        }

        .loading-circle {
          position: relative;
          width: 24px;
          height: 24px;
          flex-shrink: 0;
        }

        .circle-track {
          position: absolute;
          width: 24px;
          height: 24px;
          border-radius: 50%;
          border: 3px solid var(--md-sys-color-surface-variant);
        }

        .circle-progress {
          position: absolute;
          width: 24px;
          height: 24px;
          border-radius: 50%;
          border: 3px solid transparent;
          border-top-color: var(--md-sys-color-mcafee);
          border-left-color: var(--md-sys-color-mcafee);
          border-right-color: var(--md-sys-color-mcafee);
          animation: spin 1s linear infinite;
          border-style: solid;
        }

        @keyframes spin {
          0% {
            transform: rotate(0deg);
          }
          100% {
            transform: rotate(360deg);
          }
        }

        .logo-icon {
          position: absolute;
          top: 60%;
          left: 62%;
          transform: translate(-50%, -50%);
          width: 14px;
          height: 14px;
          display: block;
        }

        .loading-content {
          display: flex;
          flex-direction: column;
          gap: 4px;
          flex: 1;
          min-width: 0;
          justify-content: center;
        }

        .thinking-bubbles {
          display: flex;
          gap: 4px;
          align-items: center;
        }

        .bubble {
          width: 6px;
          height: 6px;
          border-radius: 50%;
          background-color: var(--md-sys-color-mcafee);
          animation: bubble-pulse 1.4s ease-in-out infinite;
        }

        .bubble:nth-child(1) {
          animation-delay: 0s;
        }

        .bubble:nth-child(2) {
          animation-delay: 0.2s;
        }

        .bubble:nth-child(3) {
          animation-delay: 0.4s;
        }

        @keyframes bubble-pulse {
          0%, 60%, 100% {
            opacity: 0.3;
            transform: scale(0.8);
          }
          30% {
            opacity: 1;
            transform: scale(1);
          }
        }

        .loading-text {
          font-family: var(--md-sys-typescale-body-medium-font);
          font-size: var(--md-sys-typescale-body-medium-size);
          font-weight: var(--md-sys-typescale-body-medium-weight);
          line-height: var(--md-sys-typescale-body-medium-line-height);
          letter-spacing: var(--md-sys-typescale-body-medium-tracking);
          color: var(--md-sys-color-on-surface-variant);
          white-space: pre-wrap;
        }
      </style>

      <div class="progress-container">
        <div class="loading-circle">
          <div class="circle-track"></div>
          <div class="circle-progress"></div>
          ${showLogo ? `
            <img class="logo-icon" src="../assets/m-icon.svg" alt="McAfee" />
          ` : ''}
        </div>
        <div class="loading-content">
          ${showLoadingBubbles ? `
            <div class="thinking-bubbles">
              <div class="bubble"></div>
              <div class="bubble"></div>
              <div class="bubble"></div>
            </div>
          ` : ''}
          ${showLoadingText ? `
            <div class="loading-text">${loadingText}</div>
          ` : ''}
        </div>
      </div>
    `;
  }
}

customElements.define('sc-progress-indicator', ScProgressIndicator);
