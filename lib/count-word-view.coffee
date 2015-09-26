module.exports =
class CountWordView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('count-word')

    allTextTitle = document.createElement('p')
    allTextTitle.textContent = "--- ALL TEXT ---"
    allTextTitle.classList.add('message')
    @element.appendChild(allTextTitle)

    AllTextResultElm = document.createElement('p')
    @element.appendChild(AllTextResultElm)



  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element

  setCount: (wordsCount, charsCount, lineCount)->
    AllTextResult = "Words : #{wordsCount}　Characters : #{charsCount}　Lines : #{lineCount}"
    @element.children[1].textContent = AllTextResult
