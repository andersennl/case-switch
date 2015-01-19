CaseSwitchView = require './case-switch-view'
Selector = require './selector'
{CompositeDisposable} = require 'atom'

module.exports = CaseSwitch =
  caseSwitchView: null
  modalPanel: null
  subscriptions: null

  activate: ->
    atom.commands.add 'atom-workspace', "case-switch:toggle", => @toggle()
    atom.commands.add 'atom-workspace', "case-switch:snake-to-camel-case", => @snakeToCamelCase()
    atom.commands.add 'atom-workspace', "case-switch:minus-to-snake-case", => @minusToSnakeCase()

  toggle: ->
    @getSelector().toggleSelection()

  snakeToCamelCase: ->
    @getSelector().snakeToCamel()

  minusToSnakeCase: ->
    @getSelector().minusToSnake()

  getSelector: ->
    selector = new Selector
