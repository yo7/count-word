module.exports =
class CountWordView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('count-word')

    allTextTitle = document.createElement('p')
    allTextTitle.textContent = "ALL TEXT"
    allTextTitle.classList.add('count-message', 'count-title')
    @element.appendChild(allTextTitle)

    allTextResultElm = document.createElement('p')
    allTextResultElm.classList.add('count-message')
    @element.appendChild(allTextResultElm)



  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element

  setCount: (wordsCount, charsCount, lineCount)->
    allTextResult = "Words : #{wordsCount}　Characters : #{charsCount}　Lines : #{lineCount}"
    @element.children[1].textContent = allTextResult
