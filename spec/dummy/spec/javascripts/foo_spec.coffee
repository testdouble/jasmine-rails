describe 'foo', ->
  Then -> $('body').length == 1
  Then -> _([1,2,3]).first() == 1