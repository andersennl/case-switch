CaseSwitchView = require './case-switch-view'
Selector = require './selector'
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
