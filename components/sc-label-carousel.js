/**
 * Safety Companion Label Carousel
 * Horizontal scrollable container of filter chips
 * Filter chips use tags or descriptive words to filter content
 * Uses Material Web components and RGA design tokens
 */

export class ScLabelCarousel extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
    this.selectedChips = new Set();
  }

  connectedCallback() {
    this.render();
  }

  static get observedAttributes() {
    return ['labels'];
  }

  attributeChangedCallback() {
    this.render();
  }

  get labels() {
    const labelsAttr = this.getAttribute('labels');
    if (labelsAttr) {
      try {
        return JSON.parse(labelsAttr);
      } catch {
        return labelsAttr.split(',').map(l => l.trim());
      }
    }
    return ['Label', 'Label', 'Label', 'Label', 'Label', 'Label', 'Label', 'Label'];
  }

  toggleChip(index) {
    if (this.selectedChips.has(index)) {
      this.selectedChips.delete(index);
    } else {
      this.selectedChips.add(index);
    }
    this.render();
    this.dispatchEvent(new CustomEvent('selection-change', {
      bubbles: true,
      composed: true,
      detail: {
        selected: Array.from(this.selectedChips),
        labels: this.labels.filter((_, i) => this.selectedChips.has(i))
      }
    }));
  }

  render() {
    const labels = this.labels;

    this.shadowRoot.innerHTML = `
      <style>
        :host {
          display: block;
          width: 100%;
        }

        .carousel {
          display: flex;
          gap: 12px;
          padding: 16px 24px;
          overflow-x: auto;
          overflow-y: hidden;
          height: 64px;
          align-items: center;
          scrollbar-width: none;
          -ms-overflow-style: none;
        }

        .carousel::-webkit-scrollbar {
          display: none;
        }

        .filter-chip {
          display: inline-flex;
          align-items: center;
          justify-content: center;
          height: 32px;
          padding: 6px 16px;
          border-radius: 12px;
          cursor: pointer;
          flex-shrink: 0;
          transition: all 0.2s ease;
          user-select: none;
        }

        .filter-chip.deselected {
          background-color: transparent;
          border: 1px solid var(--md-sys-color-outline-variant);
          color: var(--md-sys-color-on-surface-variant);
        }

        .filter-chip.selected {
          background-color: var(--md-sys-color-tertiary-container);
          border: none;
          color: var(--md-sys-color-on-tertiary-container);
        }

        .filter-chip:hover {
          opacity: 0.9;
        }

        .filter-chip:active {
          transform: scale(0.98);
        }

        .chip-label {
          font-family: var(--md-sys-typescale-label-large-font);
          font-size: var(--md-sys-typescale-label-large-size);
          font-weight: var(--md-sys-typescale-label-large-weight);
          line-height: var(--md-sys-typescale-label-large-line-height);
          letter-spacing: var(--md-sys-typescale-label-large-tracking);
          white-space: nowrap;
        }
      </style>

      <div class="carousel">
        ${labels.map((label, index) => `
          <div 
            class="filter-chip ${this.selectedChips.has(index) ? 'selected' : 'deselected'}"
            data-index="${index}"
          >
            <span class="chip-label">${label}</span>
          </div>
        `).join('')}
      </div>
    `;

    this.attachEventListeners();
  }

  attachEventListeners() {
    const chips = this.shadowRoot.querySelectorAll('.filter-chip');
    chips.forEach(chip => {
      chip.addEventListener('click', () => {
        const index = parseInt(chip.dataset.index);
        this.toggleChip(index);
      });
    });
  }
}

customElements.define('sc-label-carousel', ScLabelCarousel);
