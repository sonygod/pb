import gen.GenKLSFJSON;
import haxe.Json;
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
	public static function main() {
		CustomTrace.init();

		var b = Bytes.alloc(10);

		for (i in 0...10) {
			b.set(i, i);
		}
		var a = Bytes.alloc(100);

		a.blit(0, b, 0, b.length);

		//  GenKLSFJSON.main();
		var item = [1, 2, 3, 4, 5,6,7,8,9,10];
		var result:Ref<Array<Array<Int>>> = [];
		var now=Date.now().getTime();
		trace("now");
		new Permutation(item, function(d) {
			trace("Json.stringify(d)"+(Date.now().getTime()-now));
			//Json.stringify(result.value);
		}, result);

		//	File.saveBytes('./testbytes.data', b);
	}

	public static function convert(data:String, format:Ref<String>) {
		var sp = data.split(',');
		for (i in 0...sp.length) {
			var es = sp[i].split(':');

			if (es[1] == null || es[1] == "null") {
				if (es[0].substr(0, 1) == "{") {
					format.value += "{";
				}
			} else {
				if (i != sp.length - 1) {
					format.value += es[0] + ":" + es[1] + ",";
				} else {
					format.value += es[0] + ":" + es[1];
				}
			}
		}
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
