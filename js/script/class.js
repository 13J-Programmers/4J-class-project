(function() {
  var Module;

  this.game = this.game || {};

  this.game.Module = Module = (function() {
    function Module() {
      console.log('hello, world from script/class.coffee');
    }

    return Module;

  })();

}).call(this);
