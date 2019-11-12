import haxe.io.Bytes;
import sys.io.File;
import haxe.MainLoop;

using tink.CoreApi;
using Lambda;

import Random;

class CustomTrace {
	public static function init() {
		var oldTrace = haxe.Log.trace;
		haxe.Log.trace = function(v:Dynamic, ?pos:haxe.PosInfos) {
			oldTrace("[" + Date.now().toString() + "] " + Std.string(v), pos);
		};
	}
}

@await
class TestSqlite {
	@async public static function main() {
		CustomTrace.init();

		trace("start now ");
		var n1 = Date.now().getTime();
		var b = Bytes.alloc(1024 * 1024 * 1015);
		var result = @await test2(b);

		var n2 = Date.now().getTime();

		trace(n2 - n1);

		//	File.saveBytes('./testbytes.data', b);
	}

	public static function test2(b:Bytes) {
		return Future.async(function(callBack) {
			var index = 0;
			var total = 16;
			var sum = 16000;

			var base = Std.int(sum / total);

			trace('sum=$sum total=$total base=$base');

			var k:Float = 0;
			for (i in 0...total) {
				MainLoop.addThread(function() {
					var start = i * base;
					var end = (i + 1) * base;
					trace(' start=$start  end=$end');
					while (start < end) {
						// b.set(start, Random.int(1, 10));
						start++;
						k++;
					}

					index++;

					if (index == total) {
						trace(k);
						callBack(true);
					}
				});
			}
		});
	}
}
