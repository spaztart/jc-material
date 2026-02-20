/**
 * Safety Companion Chip
 * Compact, at-a-glance status indicator
 * Used within cards to communicate high-level states
 * Uses Material Web components and RGA design tokens
 */

export class ScChip extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
  }

  connectedCallback() {
    this.render();
  }

  static get observedAttributes() {
    return ['state', 'label', 'show-icon', 'show-trailing-icon'];
  }

  attributeChangedCallback() {
    this.render();
  }

  get state() {
    return this.getAttribute('state') || 'Safe';
  }

  get label() {
    return this.getAttribute('label') || this.state;
  }

  get showIcon() {
    return this.getAttribute('show-icon') !== 'false';
  }

  get showTrailingIcon() {
    return this.getAttribute('show-trailing-icon') !== 'false';
  }

  getStateConfig(state) {
    const configs = {
      'Safe': {
        bgColor: 'var(--md-sys-color-positive)',
        textColor: 'var(--md-sys-color-on-positive)',
        icon: 'check_circle',
        iconSize: '24px'
      },
      'In progress': {
        bgColor: 'var(--md-sys-color-tertiary-container)',
        textColor: 'var(--md-sys-color-on-secondary-fixed)',
        icon: 'schedule',
        iconSize: '24px'
      },
      'Resolved': {
        bgColor: 'var(--md-sys-color-positive-container)',
        textColor: 'var(--md-sys-color-on-positive-container)',
        icon: 'verified',
        iconSize: '24px'
      },
      'Recommended': {
        bgColor: 'var(--md-sys-color-warning-container)',
        textColor: 'var(--md-sys-color-on-warning-container)',
        icon: 'info',
        iconSize: '24px'
      },
      'Critical': {
        bgColor: 'var(--md-sys-color-error)',
        textColor: 'var(--md-sys-color-on-error)',
        icon: 'warning',
        iconSize: '24px'
      },
      'Dismissed': {
        bgColor: 'var(--md-sys-color-surface-container-high)',
        textColor: 'var(--md-sys-color-outline)',
        icon: 'arrow_forward',
        iconSize: '16px'
      },
      'Completed': {
        bgColor: 'var(--md-sys-color-positive-container)',
        textColor: 'var(--md-sys-color-on-positive-container)',
        icon: 'check_circle',
        iconSize: '24px'
      }
    };

    return configs[state] || configs['Safe'];
  }

  render() {
    const state = this.state;
    const label = this.label;
    const showIcon = this.showIcon;
    const showTrailingIcon = this.showTrailingIcon;
    const config = this.getStateConfig(state);

    this.shadowRoot.innerHTML = `
      <style>
        @import url('https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200');

        :host {
          display: inline-block;
        }

        .chip {
          display: inline-flex;
          align-items: center;
          justify-content: center;
          gap: 4px;
          padding: 4px 8px;
          border-radius: ${state === 'Dismissed' ? '8px' : '7px'};
          background-color: ${config.bgColor};
          height: ${state === 'Dismissed' ? '28px' : 'auto'};
          cursor: default;
        }

        .chip-icon {
          font-family: 'Material Symbols Outlined';
          font-weight: normal;
          font-style: normal;
          font-size: ${config.iconSize};
          line-height: 1;
          letter-spacing: normal;
          text-transform: none;
          display: inline-block;
          white-space: nowrap;
          word-wrap: normal;
          direction: ltr;
          -webkit-font-smoothing: antialiased;
          color: ${config.textColor};
          flex-shrink: 0;
        }

        .chip-label {
          font-family: var(--md-sys-typescale-label-large-font);
          font-size: var(--md-sys-typescale-label-large-size);
          font-weight: var(--md-sys-typescale-label-large-weight);
          line-height: var(--md-sys-typescale-label-large-line-height);
          letter-spacing: var(--md-sys-typescale-label-large-tracking);
          color: ${config.textColor};
          white-space: nowrap;
          flex-shrink: 0;
        }

        .chip-trailing-icon {
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
          color: ${config.textColor};
          flex-shrink: 0;
          cursor: pointer;
        }

        .chip-trailing-icon:hover {
          opacity: 0.8;
        }
      </style>

      <div class="chip">
        ${showIcon ? `<span class="chip-icon">${config.icon}</span>` : ''}
        <span class="chip-label">${label}</span>
        ${showTrailingIcon ? '<span class="chip-trailing-icon">close</span>' : ''}
      </div>
    `;

    if (showTrailingIcon) {
      const trailingIcon = this.shadowRoot.querySelector('.chip-trailing-icon');
      trailingIcon?.addEventListener('click', (e) => {
        e.stopPropagation();
        this.dispatchEvent(new CustomEvent('close', { bubbles: true, composed: true }));
      });
    }
  }
}

customElements.define('sc-chip', ScChip);
