import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    this.attachTemplateTags()
    this.hideElements()
  }

  attachTemplateTags() {
    const templateTags = document.querySelectorAll("template.when-javascript-enabled")
    templateTags.forEach((templateTag) => {
      const clonedNode = templateTag.content.cloneNode(true);
      templateTag.parentElement.appendChild(clonedNode);
    })
  }

  hideElements() {
    const elementsToHide = document.querySelectorAll(".hide-when-javascript-enabled")
    elementsToHide.forEach((elementToHide) => {
      elementToHide.classList.add("hidden")
    })
  }
}
