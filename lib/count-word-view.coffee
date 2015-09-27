module.exports =
class CountWordView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('count-word')

    allTextTitle = document.createElement('p')
    allTextTitle.textContent = "ALL TEXT"
    allTextTitle.classList.add('count-title')
    @element.appendChild(allTextTitle)

    allTextResultElm = document.createElement('p')
    allTextResultElm.classList.add('count-message')
    @element.appendChild(allTextResultElm)

    selectedTextTitle = document.createElement('p')
    selectedTextTitle.textContent = "SELECTED TEXT"
    selectedTextTitle.classList.add('count-title')
    @element.appendChild(selectedTextTitle)

    selectedTextElm = document.createElement('p')
    selectedTextElm.classList.add('count-message')
    @element.appendChild(selectedTextElm)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element

  setCount: (wordsCount, charsCount, linesCount,
            selectedWordsCount, selectedCharsCount, selectedLinesCount) ->

    allTextResult =
      "Characters : #{charsCount}　Words : #{wordsCount}　Lines : #{linesCount}"
    @element.children[1].textContent = allTextResult

    if selectedCharsCount > 0
      @element.children[2].classList.remove('count-hidden')
      @element.children[3].classList.remove('count-hidden')
      selectedTextResult =
        "Characters : #{selectedCharsCount}　Words : #{selectedWordsCount}　Lines : #{selectedLinesCount}"
      @element.children[3].textContent = selectedTextResult
    else
      @element.children[2].classList.add('count-hidden')
      @element.children[3].classList.add('count-hidden')
