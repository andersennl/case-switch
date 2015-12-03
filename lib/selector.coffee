module.exports =
class Selector
  @editor = null

  constructor: ->
    @editor = atom.workspace.getActivePaneItem()

  toggleSelection: ->
    if @isHypenCase()
      @hypenToSnake()
    if @isSnakeCase()
      @snakeToCamel()
    if @isCamelCase()
      @camelToHyphen()

  getText: ->
    selection = @editor.getLastSelection()
    selection.getText()

  setText: (string) ->
    string ?= @getText()
    selection = @editor.getLastSelection()
    selection.insertText string

  convertToCamel: ->
    if @isHypenCase()
      @hypenToCamel()
    if @isSnakeCase()
      @snakeToCamel()

  convertToSnake: ->
    if @isHypenCase()
      @hypenToSnake()
    if @isCamelCase()
      @camelToSnake()

  convertToHypen: ->
    if @isSnakeCase()
      @snakeToHypen()
    if @isCamelCase()
      @camelToHypen()

  isHypenCase: ->
    @getText().indexOf('-') > -1

  isSnakeCase: ->
    @getText().indexOf('_') > -1

  isCamelCase: ->
    /[A-Z]/.test(@getText())

  snakeToCamel: ->
    string = @getText()
    count = @countSnakeOccurance()
    if count > 0
      for i in [1..count]
        index = string.indexOf('_') + 1
        char = string.charAt index
        string = @setCharAt(string, index, char.toUpperCase())
        string = string.replace(/_/, '')
      @setText string

  snakeToHypen: ->
    @setText @getText().replace /([a-zA-Z0-9])(_)([a-zA-Z0-9])/g, "$1-$3"

  hypenToSnake: ->
    @setText @getText().replace /([a-zA-Z0-9])(-)([a-zA-Z0-9])/g, "$1_$3"

  hypenToCamel: ->
    string = @getText()
    string = string.replace /(?:-)([a-z])/g, (v) ->
      v.toUpperCase()
    @setText string.replace /-/g, ""

  camelToHypen: ->
    string = @getText()
    string = string.replace /([a-z0-9])([A-Z])/g, "$1-$2"
    @setText string.toLowerCase()

  camelToSnake: ->
    string = @getText()
    string = string.replace /([a-z0-9])([A-Z])/g, "$1_$2"
    @setText string.toLowerCase()

  setCharAt: (str,index,chr) ->
    str.substr(0,index) + chr + str.substr(index+1)

  countSnakeOccurance: ->
    (@getText().match(/_/g) || []).length

  countHyphenOccurance: ->
    (@getText().match(/-/g) || []).length
