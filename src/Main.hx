import haxe.Timer;

using tink.CoreApi;

@await
class Main {
	@async static function main() {
		trace("test tink await");
		var x = @await waitForIt();
		trace("can't trace this?" + x);
		@await loop();
		trace("what can I do except  wating!");

		var a = @await asyncExpressionReturn();
		trace("still waiting");
		trace(a);
	}

	@async static function loop() {
		for (i in 0...5) {
			// will continue after someAsycCall is done
			@await waitForIt();
		}
		return 'done';
	}

	static function waitForIt() {
		return Future.async(function(cb) {
			Timer.delay(function() {
				trace("are you waiting for me?");
				cb("fuck!");
			}, 1000);
		});
	}

	@async static function asyncExpressionReturn() {
		var a = {
			var b = @await waitForIt();
			b;
		};
		return a;
	}
}
