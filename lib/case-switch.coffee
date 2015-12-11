CaseSwitchView = require './case-switch-view'
Selector = require './selector'
{CompositeDisposable} = require 'atom'

module.exports = CaseSwitch =
  caseSwitchView: null
  modalPanel: null
  subscriptions: null

  activate: ->
    atom.commands.add 'atom-workspace', "case-switch:toggle", => @toggle()
    atom.commands.add 'atom-workspace', "case-switch:convert-to-camel-case", => @convertToCamelCase()
    atom.commands.add 'atom-workspace', "case-switch:convert-to-snake-case", => @convertToSnakeCase()
    atom.commands.add 'atom-workspace', "case-switch:convert-to-hyphen-case", => @convertToHyphenCase()

  toggle: ->
    @getSelector().toggleSelection()

  convertToCamelCase: ->
    @getSelector().convertToCamel()

  convertToSnakeCase: ->
    @getSelector().convertToSnake()

  convertToHyphenCase: ->
    @getSelector().convertToHyphen()

  getSelector: ->
    selector = new Selector
