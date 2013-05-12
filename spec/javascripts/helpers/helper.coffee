root = this

root.context = root.describe
root.xcontext = root.xdescribe

beforeEach ->
  @addMatchers
    toLick: ->
      true