/**
 * Safety Companion Bottom Text Input
 * Primary entry field for sending prompts
 * Functionally identical to ChatGPT bottom input bar
 * Uses Material Web components and RGA design tokens
 */

export class ScBottomTextInput extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
    this.state = 'default'; // default, input, record
  }

  connectedCallback() {
    this.render();
  }

  static get observedAttributes() {
    return ['placeholder', 'value'];
  }

  attributeChangedCallback() {
    this.render();
  }

  get placeholder() {
    return this.getAttribute('placeholder') || 'Input text';
  }

  get value() {
    return this.getAttribute('value') || '';
  }

  setState(newState) {
    this.state = newState;
    this.render();
  }

  render() {
    const placeholder = this.placeholder;
    const value = this.value;
    const state = this.state;

    this.shadowRoot.innerHTML = `
      <style>
        @import url('https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200');

        :host {
          display: block;
          width: 100%;
          max-width: 720px;
        }

        .input-container {
          position: relative;
          display: flex;
          align-items: ${state === 'input' ? 'flex-end' : 'center'};
          gap: 10px;
          padding: ${state === 'default' ? '0px 4px' : '0px 4px'};
          background-color: var(--md-sys-color-surface);
          border: 1px solid var(--md-sys-color-outline-variant);
          border-radius: ${state === 'default' ? '26px' : '16px'};
          height: ${state === 'default' ? '56px' : '129px'};
          box-shadow: ${state === 'default' ? 'none' : '0px 1px 10px 0px rgba(165, 176, 255, 0.2)'};
          transition: all 0.2s ease;
        }

        .icon-button {
          display: flex;
          align-items: center;
          justify-content: center;
          width: 48px;
          height: 48px;
          flex-shrink: 0;
          cursor: pointer;
          background: none;
          border: none;
          border-radius: 100px;
          transition: background-color 0.2s ease;
        }

        .icon-button:hover {
          background-color: var(--md-sys-color-surface-container-highest);
        }

        .material-symbols-outlined {
          font-family: 'Material Symbols Outlined';
          font-weight: normal;
          font-style: normal;
          font-size: 24px;
          line-height: 1;
          color: var(--md-sys-color-on-surface-variant);
        }

        .input-content {
          flex: 1;
          display: flex;
          align-items: ${state === 'input' ? 'flex-end' : 'center'};
          min-width: 0;
          padding-right: 20px;
          padding-bottom: ${state === 'default' ? '0' : '10px'};
        }

        .input-field {
          width: 100%;
          border: none;
          outline: none;
          background: transparent;
          font-family: 'Poppins', sans-serif;
          font-size: 14px;
          font-weight: 400;
          line-height: 20px;
          letter-spacing: 0.25px;
          color: var(--md-sys-color-on-surface);
          resize: none;
          overflow: hidden;
        }

        .input-field::placeholder {
          color: var(--md-sys-color-on-surface-variant);
        }

        .input-field.multiline {
          min-height: 60px;
        }

        .trailing-elements {
          display: flex;
          align-items: ${state === 'default' ? 'center' : 'flex-end'};
          justify-content: flex-end;
          flex-shrink: 0;
        }

        .send-button {
          display: flex;
          align-items: center;
          justify-content: center;
          width: 48px;
          height: 48px;
          flex-shrink: 0;
          cursor: pointer;
          background: none;
          border: none;
          border-radius: 100px;
          transition: all 0.2s ease;
        }

        .send-button:hover {
          background-color: var(--md-sys-color-surface-container-highest);
        }

        .send-button.active .material-symbols-outlined {
          color: var(--md-sys-color-primary);
        }

        .send-button.record .material-symbols-outlined {
          color: var(--md-sys-color-error);
        }
      </style>

      <div class="input-container">
        <button class="icon-button" aria-label="Attach" data-action="attach">
          <span class="material-symbols-outlined">add</span>
        </button>
        
        <div class="input-content">
          <textarea 
            class="input-field ${state === 'input' ? 'multiline' : ''}" 
            placeholder="${placeholder}"
            rows="${state === 'default' ? '1' : '3'}"
            data-input
          >${value}</textarea>
        </div>
        
        <div class="trailing-elements">
          <button class="send-button ${state === 'input' ? 'active' : ''} ${state === 'record' ? 'record' : ''}" 
                  aria-label="${state === 'record' ? 'Record' : 'Send'}" 
                  data-action="${state === 'record' ? 'record' : 'send'}">
            <span class="material-symbols-outlined">
              ${state === 'record' ? 'mic' : 'arrow_upward'}
            </span>
          </button>
        </div>
      </div>
    `;

    this.attachEventListeners();
  }

  attachEventListeners() {
    const attachButton = this.shadowRoot.querySelector('[data-action="attach"]');
    const sendButton = this.shadowRoot.querySelector('[data-action="send"], [data-action="record"]');
    const inputField = this.shadowRoot.querySelector('[data-input]');

    attachButton?.addEventListener('click', () => {
      this.dispatchEvent(new CustomEvent('attach', { bubbles: true, composed: true }));
    });

    sendButton?.addEventListener('click', () => {
      const action = sendButton.dataset.action;
      if (action === 'record') {
        this.dispatchEvent(new CustomEvent('record', { bubbles: true, composed: true }));
      } else {
        const value = inputField.value;
        this.dispatchEvent(new CustomEvent('send', { 
          bubbles: true, 
          composed: true,
          detail: { value }
        }));
      }
    });

    inputField?.addEventListener('input', (e) => {
      const value = e.target.value;
      if (value.length > 0 && this.state === 'default') {
        this.setState('input');
      } else if (value.length === 0 && this.state === 'input') {
        this.setState('default');
      }
      this.dispatchEvent(new CustomEvent('input-change', {
        bubbles: true,
        composed: true,
        detail: { value }
      }));
    });

    inputField?.addEventListener('keydown', (e) => {
      if (e.key === 'Enter' && !e.shiftKey) {
        e.preventDefault();
        const value = inputField.value;
        if (value.trim()) {
          this.dispatchEvent(new CustomEvent('send', {
            bubbles: true,
            composed: true,
            detail: { value }
          }));
          inputField.value = '';
          this.setState('default');
        }
      }
    });
  }
}

customElements.define('sc-bottom-text-input', ScBottomTextInput);
