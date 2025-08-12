class LiquidTextUI {
  constructor() {
    this.container = document.getElementById("liquid-textui-container")
    this.currentElement = null
    this.validPositions = ["center", "middle-left", "middle-right", "top-left", "top-center", "top-right"]
  }

  show(text, options = {}) {
    const config = {
      position: "center",
      type: "default",
      duration: 0,
      icon: null,
      permanent: false,
      ...options,
    }

    if (!this.validPositions.includes(config.position)) {
      console.warn(`Invalid position: ${config.position}. Using 'center' instead.`)
      config.position = "center"
    }

    if (this.currentElement) {
      this.hide()
      setTimeout(() => {
        this.showElement(text, config)
      }, 350)
    } else {
      this.showElement(text, config)
    }
  }

  showElement(text, config) {
    const element = this.createElement(text, config)
    this.container.appendChild(element)
    this.currentElement = element

    setTimeout(() => {
      element.classList.add("show")
    }, 50)

    if (config.duration > 0 && !config.permanent) {
      const progressBar = element.querySelector(".liquid-textui-progress")
      if (progressBar) {
        progressBar.style.transitionDuration = `${config.duration - 100}ms`
        progressBar.style.width = "100%"

        setTimeout(() => {
          progressBar.style.width = "0%"
        }, 100)
      }

      setTimeout(() => {
        this.hide()
      }, config.duration + 300)
    }
  }

  hide() {
    if (!this.currentElement) return

    this.currentElement.classList.remove("show")
    this.currentElement.classList.add("hide")

    const elementToRemove = this.currentElement
    this.currentElement = null

    setTimeout(() => {
      if (elementToRemove.parentNode) {
        elementToRemove.parentNode.removeChild(elementToRemove)
      }
    }, 300)
  }

  createElement(text, config) {
    const element = document.createElement("div")
    element.className = `liquid-textui-element liquid-textui-${config.position}`

    if (config.type !== "default") {
      element.classList.add(`liquid-textui-${config.type}`)
    }

    const glassContainer = document.createElement("div")
    glassContainer.className = "liquid-glass"

    const content = document.createElement("div")
    content.className = "liquid-textui-content"

    if (config.icon) {
      const iconElement = document.createElement("i")
      iconElement.className = `liquid-textui-icon ${config.icon}`
      content.appendChild(iconElement)
    }

    const textElement = document.createElement("span")
    textElement.className = "liquid-textui-text"
    textElement.textContent = text
    content.appendChild(textElement)

    glassContainer.appendChild(content)

    if (config.duration > 0 && !config.permanent) {
      const progressBar = document.createElement("div")
      progressBar.className = "liquid-textui-progress"
      glassContainer.appendChild(progressBar)
    }

    element.appendChild(glassContainer)

    return element
  }
}

const liquidTextUI = new LiquidTextUI()

window.addEventListener("message", (event) => {
  const data = event.data

  switch (data.action) {
    case "show":
      liquidTextUI.show(data.text, data.options)
      break
    case "hide":
      liquidTextUI.hide()
      break
  }
})

window.LiquidTextUI = LiquidTextUI
window.liquidTextUI = liquidTextUI
