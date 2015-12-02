module.exports =
class Selector
  @editor = null

  constructor: ->
    @editor = atom.workspace.getActivePaneItem()

  toggleSelection: ->
    selection = @getText()
    if selection.indexOf('-') > -1
      @hypenToSnake(selection)
    if selection.indexOf('_') > -1
      @snakeToCamel(selection)
    # if has camel case
      # change to - case

  getText: ->
    selection = @editor.getLastSelection()
    selection.getText()

  setText: (string) ->
    string ?= @getText()
    selection = @editor.getLastSelection()
    selection.insertText string

  hypenToSnake: (string) ->
    string ?= @getText()
    @setText string.replace /-./g, "_"

  snakeToCamel: (string) ->
    string ?= @getText()
    count = @countSnakeOccurance(string)
    if count > 0
      for i in [1..count]
        index = string.indexOf('_') + 1
        char = string.charAt index
        string = @setCharAt(string, index, char.toUpperCase())
        string = string.replace(/_/, '')
      @setText string

  setCharAt: (str,index,chr) ->
    str.substr(0,index) + chr + str.substr(index+1)

  countSnakeOccurance: (string) ->
    (@getText().match(/_/g) || []).length
