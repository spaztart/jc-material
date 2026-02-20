/**
 * Safety Companion Chat Bubble
 * Standard message container used in conversational flows
 * Supports Send (user) and Reply (assistant) variants
 * Uses Material Web components and RGA design tokens
 */

export class ScChatBubble extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
  }

  connectedCallback() {
    this.render();
  }

  static get observedAttributes() {
    return ['chat', 'message'];
  }

  attributeChangedCallback() {
    this.render();
  }

  get chat() {
    return this.getAttribute('chat') || 'Send';
  }

  get message() {
    return this.getAttribute('message') || 'Text input';
  }

  render() {
    const chat = this.chat;
    const message = this.message;
    const isSend = chat === 'Send';

    this.shadowRoot.innerHTML = `
      <style>
        :host {
          display: block;
          width: 100%;
        }

        .chat-bubble {
          display: inline-block;
          max-width: 80%;
          padding: 12px 16px;
          border-radius: 16px;
          font-family: var(--md-sys-typescale-body-medium-font);
          font-size: var(--md-sys-typescale-body-medium-size);
          font-weight: var(--md-sys-typescale-body-medium-weight);
          line-height: var(--md-sys-typescale-body-medium-line-height);
          letter-spacing: var(--md-sys-typescale-body-medium-tracking);
          word-wrap: break-word;
          overflow-wrap: break-word;
        }

        .chat-container {
          display: flex;
          width: 100%;
          margin-bottom: 8px;
        }

        .chat-container.send {
          justify-content: flex-end;
        }

        .chat-container.reply {
          justify-content: flex-start;
        }

        .chat-bubble.send {
          background-color: var(--md-sys-color-primary);
          color: var(--md-sys-color-on-primary);
        }

        .chat-bubble.reply {
          background-color: var(--md-sys-color-surface-container-highest);
          color: var(--md-sys-color-on-surface);
          border-bottom-left-radius: 4px;
        }
      </style>

      <div class="chat-container ${isSend ? 'send' : 'reply'}">
        <div class="chat-bubble ${isSend ? 'send' : 'reply'}">
          ${message}
        </div>
      </div>
    `;
  }
}

customElements.define('sc-chat-bubble', ScChatBubble);
