module.exports =
class Selector
  @editor = null

  constructor: ->
    @editor = atom.workspace.getActivePaneItem()

  toggleSelection: ->
    if @isHyphenCase()
      @hyphenToSnake()
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
    if @isHyphenCase()
      @hyphenToCamel()
    if @isSnakeCase()
      @snakeToCamel()

  convertToSnake: ->
    if @isHyphenCase()
      @hyphenToSnake()
    if @isCamelCase()
      @camelToSnake()

  convertToHyphen: ->
    if @isSnakeCase()
      @snakeToHyphen()
    if @isCamelCase()
      @camelToHyphen()

  isHyphenCase: ->
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

  snakeToHyphen: ->
    @setText @getText().replace /([a-zA-Z0-9])(_)([a-zA-Z0-9])/g, "$1-$3"

  hyphenToSnake: ->
    @setText @getText().replace /([a-zA-Z0-9])(-)([a-zA-Z0-9])/g, "$1_$3"

  hyphenToCamel: ->
    string = @getText()
    string = string.replace /(?:-)([a-z])/g, (v) ->
      v.toUpperCase()
    @setText string.replace /-/g, ""

  camelToHyphen: ->
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
