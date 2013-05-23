describe("fixtures", function(){
  it("can access fixture files", function(){
    var fixture = jasmineFixtures["foo"];
    expect(fixture).toEqual('<div id="foo" class="fixture"></div>');
  });

  it("can access fixture files in subfolders", function(){
    var fixture = jasmineFixtures["foo/bar"];
    expect(fixture).toEqual('<div id="bar"></div>');
  });
});
