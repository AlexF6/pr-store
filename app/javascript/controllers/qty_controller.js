import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "decBtn", "incBtn"];
  static values  = { min: Number, max: Number, step: { type: Number, default: 1 } };

  connect() {
    if (!this.hasMinValue) this.minValue = 1;
    this._sync();
    // prevent scroll wheel from changing the number accidentally
    this._blockWheel = (e) => e.preventDefault();
    this.inputTarget.addEventListener("wheel", this._blockWheel, { passive: false });
  }

  disconnect() {
    this.inputTarget.removeEventListener("wheel", this._blockWheel);
  }

  dec() { this._change(-this.stepValue); }
  inc() { this._change(+this.stepValue); }

  input() {
    this.inputTarget.value = this._clamp(this._current());
    this._sync();
  }

  // ----- helpers -----
  _change(delta) {
    const next = this._clamp(this._current() + delta);
    this.inputTarget.value = next;
    this._sync();
  }

  _current() {
    return parseInt(this.inputTarget.value, 10) || this.minValue || 1;
  }

  _clamp(v) {
    if (isNaN(v)) v = this.minValue || 1;
    if (this.hasMinValue) v = Math.max(v, this.minValue);
    if (this.hasMaxValue) v = Math.min(v, this.maxValue);
    return v;
  }

  _sync() {
    const v = this._current();
    if (this.hasMinValue) this.decBtnTarget.disabled = v <= this.minValue;
    if (this.hasMaxValue) this.incBtnTarget.disabled = v >= this.maxValue;
  }
}
