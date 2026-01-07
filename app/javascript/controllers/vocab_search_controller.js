import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "input",
    "results",
    "seriesList",
    "back",
    "status",
    "keyword"
  ]

  search() {
    const query = this.inputTarget.value.trim().toLowerCase()

    // 🔑 入力は消さない（何もしない）
    if (query === "") {
      this.reset()
      return
    }

    // 検索語表示
    this.statusTarget.hidden = false
    this.keywordTarget.textContent = query

    // 一覧を隠す
    this.seriesListTarget.style.display = "none"
    this.resultsTarget.hidden = false
    this.backTarget.hidden = false

    this.resultsTarget.innerHTML = ""

    const cards = document.querySelectorAll(".word-card")
    let hit = 0

    cards.forEach(card => {
      const en = card.querySelector(".word-english").textContent.toLowerCase()
      const ja = card.querySelector(".word-japanese").textContent.toLowerCase()

      if (en.includes(query) || ja.includes(query)) {
        hit++
        const clone = card.cloneNode(true)

        // 🔶 ハイライト
        this.highlight(clone, query)

        this.resultsTarget.appendChild(clone)
      }
    })

    if (hit === 0) {
      this.resultsTarget.innerHTML =
        `<div class="no-result">該当する単語がありません</div>`
    }
  }

  reset() {
    this.inputTarget.value = ""
    this.resultsTarget.innerHTML = ""
    this.resultsTarget.hidden = true
    this.seriesListTarget.style.display = ""
    this.backTarget.hidden = true
    this.statusTarget.hidden = true
  }

  highlight(card, keyword) {
    card.querySelectorAll(".word-english, .word-japanese").forEach(el => {
      const text = el.textContent
      const regex = new RegExp(`(${keyword})`, "gi")
      el.innerHTML = text.replace(regex, `<span class="highlight">$1</span>`)
    })
  }
}
