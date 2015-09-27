CountWordView = require './count-word-view'
{CompositeDisposable} = require 'atom'

module.exports = CountWord =
  countWordView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @countWordView = new CountWordView(state.countWordViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @countWordView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'count-word:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @countWordView.destroy()

  serialize: ->
    countWordViewState: @countWordView.serialize()

  toggle: ->

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      editor = atom.workspace.getActiveTextEditor()
      text = editor.getText()
      selectedText = editor.getSelectedText()
      words = text.split(/\s+/)
      selectedWords = selectedText.split(/\s+/)
      wordsCount = words.length
      selectedWordsCount = selectedWords.length
      charsCount = words.join('').length
      selectedCharsCount = selectedWords.join('').length
      linesCount = text.split(/\r\n|\r|\n/).length
      selectedLinesCount = selectedText.split(/\r\n|\r|\n/).length

      @countWordView.setCount(
        wordsCount,
        charsCount,
        linesCount,
        selectedWordsCount,
        selectedCharsCount,
        selectedLinesCount
        )

      @modalPanel.show()
