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

  convertToCamel: ->
    for selection in @editor.getSelections()
      if @isHyphenCase(selection)
        @hyphenToCamel(selection)
      if @isSnakeCase(selection)
        @snake_to_camel(selection)

  convertToSnake: ->
    for selection in @editor.getSelections()
      if @isHyphenCase(selection)
        @hyphenToSnake(selection)
      if @isCamelCase(selection)
        @camelToSnake(selection)

  convertToHyphen: ->
    for selection in @editor.getSelections()
      if @isSnakeCase(selection)
        @snakeToHyphen(selection)
      if @isCamelCase(selection)
        @camelToHyphen(selection)

  isHyphenCase: (selection) ->
    selection.getText().indexOf('-') > -1

  isSnakeCase: (selection) ->
    selection.getText().indexOf('_') > -1

  isCamelCase: (selection) ->
    /[A-Z]/.test(selection.getText())

  snakeToCamel: (selection) ->
    string = selection.getText()
    count = @countSnakeOccurance()
    if count > 0
      for i in [1..count]
        index = string.indexOf('_') + 1
        char = string.charAt index
        string = @setCharAt(string, index, char.toUpperCase())
        string = string.replace(/_/, '')
      selection.insertText(string)

  snakeToHyphen: (selection) ->
    text = selection.getText()
    selection.insertText(text.replace /([a-zA-Z0-9])(_)([a-zA-Z0-9])/g, "$1-$3")

  hyphenToSnake: (selection) ->
    text = selection.getText()
    selection.insertText(text.replace /([a-zA-Z0-9])(-)([a-zA-Z0-9])/g, "$1_$3")

  hyphenToCamel: (selection) ->
    string = selection.getText()
    string = string.replace /(?:-)([a-z])/g, (v) ->
      v.toUpperCase()
    selection.insertText(string.replace /-/g, "")

  camelToHyphen: (selection) ->
    string = selection.getText()
    string = string.replace /([a-z0-9])([A-Z])/g, "$1-$2"
    selection.insertText(string.toLowerCase())

  camelToSnake: (selection) ->
    string = selection.getText()
    string = string.replace /([a-z0-9])([A-Z])/g, "$1_$2"
    selection.insertText(string.toLowerCase())

  setCharAt: (str,index,chr) ->
    str.substr(0,index) + chr + str.substr(index+1)

  countSnakeOccurance: (selection) ->
    (selection.getText().match(/_/g) || []).length

  countHyphenOccurance: (selection) ->
    (selection.getText().match(/-/g) || []).length
