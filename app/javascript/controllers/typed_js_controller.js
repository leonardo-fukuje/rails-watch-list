// app/javascript/controllers/typed_js_controller.js
import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Don't forget to import the NPM package
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["My movies list", "With comments about them"],
      typeSpeed: 150,
      loop: true
    });
  }
}
