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
    atom.commands.add 'atom-workspace', "case-switch:hypen-to-snake-case", => @hypenToSnakeCase()

  toggle: ->
    @getSelector().toggleSelection()

  snakeToCamelCase: ->
    @getSelector().snakeToCamel()

  hypenToSnakeCase: ->
    @getSelector().hypenToSnake()

  getSelector: ->
    selector = new Selector
