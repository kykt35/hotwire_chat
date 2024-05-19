import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {
    addEventListener("turbo:before-stream-render", ((event) => {
      if(this.element.getAttribute("id") != event.target.getAttribute("target")) return

      const render = event.detail.render
      event.detail.render = (ele) =>{
        render(ele)
        this.scrollToBottom()
      }
    }))
  }

  connect() {
    this.scrollToBottom()
  }

  scrollToBottom() {
    const scrollHeight = this.element.scrollHeight-this.element.clientHeight
    this.element.scrollTo({ top: scrollHeight , left: 0, behavior: "smooth" })
  }
}
