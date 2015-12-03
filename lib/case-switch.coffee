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
    atom.commands.add 'atom-workspace', "case-switch:convert-to-hypen-case", => @convertToHypenCase()

    atom.commands.add 'atom-workspace', "case-switch:snake-to-camel-case", => @snakeToCamelCase()
    atom.commands.add 'atom-workspace', "case-switch:snake-to-hyphen-case", => @snakeToHyphenCase()

    atom.commands.add 'atom-workspace', "case-switch:hypen-to-snake-case", => @hypenToSnakeCase()
    atom.commands.add 'atom-workspace', "case-switch:hypen-to-camel-case", => @hypenToCamelCase()

    atom.commands.add 'atom-workspace', "case-switch:camel-to-hyphen-case", => @camelToHyphenCase()
    atom.commands.add 'atom-workspace', "case-switch:camel-to-snake-case", => @camelToSnakeCase()

  toggle: ->
    @getSelector().toggleSelection()

  convertToCamelCase: ->
    @getSelector().convertToCamel()

  convertToSnakeCase: ->
    @getSelector().convertToSnake()

  convertToHypenCase: ->
    @getSelector().convertToHypen()

  snakeToCamelCase: ->
    @getSelector().snakeToCamel()

  snakeToHyphenCase: ->
    @getSelector().snakeToHyphen()

  hypenToSnakeCase: ->
    @getSelector().hypenToSnake()

  hypenToCamelCase: ->
    @getSelector().hypenToCamel()

  camelToHyphenCase: ->
    @getSelector().camelToHyphen()

  camelToSnakeCase: ->
    @getSelector().camelToSnake()

  getSelector: ->
    selector = new Selector
