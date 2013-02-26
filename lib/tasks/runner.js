var errorHandler = function(msg, trace) {
  var msgStack = ['ERROR: ' + msg];
  if (trace) {
    msgStack.push('TRACE:');
    trace.forEach(function(t) {
      msgStack.push(' -> ' + t.file + ': ' + t.line + (t.function ? ' (in function "' + t.function + '")' : ''));
    });
  }
  console.error(msgStack.join('\n'));
  phantom.exit(1);
};
phantom.onError = errorHandler;

var system = require('system');
var args = system.args;

if (args.length !== 2) {
  console.log("Need a url as the argument");
  phantom.exit(1);
}

var page = new WebPage();

// watch log messages for jasmine completion
page.onConsoleMessage = function(msg) {
  console.log(msg);
  if (msg === "ConsoleReporter finished") {
    var exitCode = page.evaluate(function() {
      var status = window.consoleReporter.status;
      var exitCode = (status === 'success' ? 0 : 1);
      return exitCode;
    });
    phantom.exit(exitCode);
  }
};

// log javascript errors
page.onError = errorHandler;

// setup console env
page.onInitialized = function() {
  return page.evaluate(function() {
    return window.onload = function() {
      window.consoleReporter = new jasmine.ConsoleReporter();
      jasmine.getEnv().addReporter(window.consoleReporter);
    };
  });
};

var address = args[1];
console.log('Running: ' + address);
page.open(address, function(status) {
  if (status !== "success") {
    console.log("can't load the address!");
    return phantom.exit(1);
  }
});
