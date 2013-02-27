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

// log messages to stdout
page.onConsoleMessage = function(msg) {
  console.log(msg);
};

// listen for jasmine complete event
page.onCallback = function(data) {
  phantom.exit(data.exitCode);
};

// log javascript errors
page.onError = errorHandler;

// setup listeners for jasmine events
page.onInitialized = function() {
  return page.evaluate(function() {
    return window.onload = function() {
      jsApiReporter.exitCode = 0;
      jsApiReporter.reportSpecResults = function(spec) {
        if (spec.results().failedCount > 0) {
          jsApiReporter.exitCode = 1;
        }
      };
      jsApiReporter.reportRunnerResults = function() {
        window.callPhantom({
          exitCode: jsApiReporter.exitCode
        });
      };
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
