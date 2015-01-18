CaseSwitchView = require './case-switch-view'
{CompositeDisposable} = require 'atom'

module.exports = CaseSwitch =
  caseSwitchView: null
  modalPanel: null
  subscriptions: null

  activate: ->
    atom.commands.add 'atom-workspace', "case-switch:toggle", => @toggle()

  toggle: ->
    selector = new Selector
    selector.toggleSelection()





class Selector
  @editor = null
  @selection = null

  constructor: ->
    @editor = atom.workspace.getActivePaneItem()

  toggleSelection: ->
    @selection = @getText()
    if @selection.indexOf("-") > -1
      @setText @selection.replace('-', '_')

  getText: ->
    selection = @editor.getLastSelection()
    @lastSelection = selection.getText()

  setText: (string) ->
    selection = @editor.getLastSelection()
    selection.insertText string
