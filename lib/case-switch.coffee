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

    atom.commands.add 'atom-workspace', "case-switch:snake-to-camel-case", => @snakeToCamelCase()
    atom.commands.add 'atom-workspace', "case-switch:snake-to-hyphen-case", => @snakeToHyphenCase()

    atom.commands.add 'atom-workspace', "case-switch:hyphen-to-snake-case", => @hyphenToSnakeCase()
    atom.commands.add 'atom-workspace', "case-switch:hyphen-to-camel-case", => @hyphenToCamelCase()

    atom.commands.add 'atom-workspace', "case-switch:camel-to-hyphen-case", => @camelToHyphenCase()
    atom.commands.add 'atom-workspace', "case-switch:camel-to-snake-case", => @camelToSnakeCase()

  toggle: ->
    @getSelector().toggleSelection()

  convertToCamelCase: ->
    @getSelector().convertToCamel()

  convertToSnakeCase: ->
    @getSelector().convertToSnake()

  convertToHyphenCase: ->
    @getSelector().convertToHyphen()

  snakeToCamelCase: ->
    @getSelector().snakeToCamel()

  snakeToHyphenCase: ->
    @getSelector().snakeToHyphen()

  hyphenToSnakeCase: ->
    @getSelector().hyphenToSnake()

  hyphenToCamelCase: ->
    @getSelector().hyphenToCamel()

  camelToHyphenCase: ->
    @getSelector().camelToHyphen()

  camelToSnakeCase: ->
    @getSelector().camelToSnake()

  getSelector: ->
    selector = new Selector
