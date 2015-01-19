module.exports =
class Selector
  @editor = null

  constructor: ->
    @editor = atom.workspace.getActivePaneItem()

  toggleSelection: ->
    selection = @getText()
    if selection.indexOf('-') > -1
      @setText @minusToSnake(selection)
    if selection.indexOf('_') > -1
      @setText @snakeToCamel(selection)

  getText: ->
    selection = @editor.getLastSelection()
    selection.getText()

  setText: (string) ->
    selection = @editor.getLastSelection()
    selection.insertText string

  minusToSnake: (string) ->
    string.replace(/-/g, '_')

  snakeToCamel: (string) ->
    count = @countOccurance(string)
    for i in [1..count]
      index = string.indexOf('_') + 1
      char = string.charAt index
      string = @setCharAt(string, index, char.toUpperCase())
      string = string.replace(/_/, '')
    string

  setCharAt: (str,index,chr) ->
    str.substr(0,index) + chr + str.substr(index+1)

  countOccurance: (string) ->
    (@getText().match(/_/g) || []).length
