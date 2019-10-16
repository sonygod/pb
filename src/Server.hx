import haxe.PosInfos;
import tink.core.Either;

using tink.CoreApi;

@:asserts
class Server {
	var signal1:Signal<String>;
	var handlers1:SignalTrigger<String>;
	var signal2:Signal<String>;
	var handlers2:SignalTrigger<String>;

	public function new() {}

	public function setup() {
		signal1 = handlers1 = Signal.trigger();
		signal2 = handlers2 = Signal.trigger();
		return Noise;
	}

	public function testNext() {
		var next = signal1.nextTime();
		var value = null;
		next.handle(function(v) value = v);
		handlers1.trigger('foo');
		trace('foo' == value);
		handlers1.trigger('bar');
		trace('foo' == value);
	}

	static function main() {
	
	}
}
