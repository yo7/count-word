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
    else if atom.workspace.getActiveTextEditor() != undefined
      editor = atom.workspace.getActiveTextEditor()

      text       = editor.getText()
      words      = text.split(/\s+/)
      wordsCount = words.length
      charsCount = words.join('').length
      linesCount = text.split(/\r\n|\r|\n/).length

      selectedText       = editor.getSelectedText()
      selectedWords      = selectedText.split(/\s+/)
      selectedWordsCount = selectedWords.length
      selectedCharsCount = selectedWords.join('').length
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
