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
    console.log 'CountWord was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
