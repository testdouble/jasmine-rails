describe 'stylesheets', ->

  beforeEach ->
    @div = affix('.hide')

  it 'should include specified stylesheets', ->
    expect( @div.is(':visible') ).not.toBeTruthy()
