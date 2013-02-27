var jsApiReporter;
(function() {
  var jasmineEnv = jasmine.getEnv();

  jsApiReporter = new jasmine.JsApiReporter();
  var htmlReporter = new jasmine.HtmlReporter();

  jasmineEnv.addReporter(jsApiReporter);
  jasmineEnv.addReporter(htmlReporter);

  if (jasmine.ConsoleReporter) {
    jasmineEnv.addReporter(new jasmine.ConsoleReporter());
  }

  jasmineEnv.specFilter = function(spec) {
    return htmlReporter.specFilter(spec);
  };

  var currentWindowOnload = window.onload;

  window.onload = function() {
    if (currentWindowOnload) {
      currentWindowOnload();
    }
    execJasmine();
  };

  function execJasmine() {
    jasmineEnv.execute();
  }

})();
