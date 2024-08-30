import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "box", "input", "results" ]

  toggleSearch(event) {
    event.preventDefault()
    this.boxTarget.classList.toggle("hidden")
    if (!this.boxTarget.classList.contains("hidden")) {
      this.inputTarget.focus()
    }
  }

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      const query = this.inputTarget.value
      if (query.length >= 2) {
        this.performSearch(query)
      } else {
        this.resultsTarget.innerHTML = ""
      }
    }, 300)
  }

  async performSearch(query) {
    const response = await fetch(`${this.element.dataset.searchPath}?query=${encodeURIComponent(query)}`, {
      headers: {
        "Accept": "text/vnd.turbo-stream.html"
      }
    })
    if (response.ok) {
      const html = await response.text()
      this.resultsTarget.innerHTML = html
    }
  }
}