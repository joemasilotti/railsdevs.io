import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = [
    "checkbox",
    "dropdown",
    "input",
    "option",
    "pill",
    "pillContainer",
    "pillTemplate"
  ];

  connect() {
    this.populatePillsFromCheckedCheckboxes()
  }

  removePill(event) {
    event.currentTarget.remove()
    this.uncheckCheckbox(event.currentTarget.dataset.specialtyId)
  }

  handleSpecialitySelection(event) {
    event.preventDefault()

    this.addPill(event.currentTarget.dataset.value)
    this.clearInputAndDropdown()
  }

  // utility methods

  get checkedCheckboxes() {
    return this.checkboxTargets.filter((checkbox) => checkbox.checked)
  }

  isPillDisplayed(value) {
    return this.pillTargets.some((pill) => pill.dataset.specialtyId === value)
  }

  checkCheckbox(value) {
    const checkbox = this.checkboxTargets.find((checkbox) => checkbox.value === value)
    checkbox.checked = true
  }

  uncheckCheckbox(value) {
    const checkbox = this.checkboxTargets.find((checkbox) => checkbox.value === value)
    checkbox.checked = false
  }

  clearInputAndDropdown() {
    this.inputTarget.value = "";
    this.dropdownTarget.innerHTML = "";
  }

  addPill(value) {
    if (!this.isPillDisplayed(value)) {
      this.createPill(value)
      this.checkCheckbox(value)
    }
  }

  createPill(value) {
    const template = this.pillTemplateTargets.find((t) => t.dataset.specialtyId === value)
    const content = template.content.cloneNode(true)
    this.pillContainerTarget.appendChild(content)
  }

  populatePillsFromCheckedCheckboxes() {
    console.log(this.checkedCheckboxes)
    this.checkedCheckboxes.forEach((checkedCheckbox) => {
      this.addPill(checkedCheckbox.value)
    })
  }

  optionTargetConnected(element) {
    if (this.isPillDisplayed(element.dataset.value)) {
      element.parentElement.remove()
    }
  }
}
