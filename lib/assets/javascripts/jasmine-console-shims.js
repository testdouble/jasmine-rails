(function() {
  /**
   * Function.bind Polyfill for ECMAScript 5 Support
   * Kangax's bind with Broofa's arg optimization.
   * http://www.broofa.com/Tools/JSLitmus/tests/PrototypeBind.html
   *
   * Copied from https://gist.github.com/rxgx/1597825
   */
  if (typeof Function.prototype.bind !== "function") {
    Function.prototype.bind = function() {
      var slice = Array.prototype.slice;
      return function(context) {
        var fn = this,
          args = slice.call(arguments, 1);
        if (args.length) {
          return function() {
            return arguments.length
              ? fn.apply(context, args.concat(slice.call(arguments)))
              : fn.apply(context, args);
          };
        }
        return function() {
          return arguments.length
            ? fn.apply(context, arguments)
            : fn.call(context);
        };
      };
    };
  }
})();

