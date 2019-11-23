package gen;

import haxe.io.Bytes;
import haxe.ds.Map;
import haxe.MainLoop;
import gen.GenKLSF;
import sys.io.File;
import haxe.Json;
import sys.db.Sqlite;

using tink.CoreApi;
using Lambda;

/**
 * 生成json.
 */
class GenKLSFJSONBytes {
	public static function main() {
		var data:Ref<Array<Int>> = [for (i in 1...21) i];

		var result8:tink.core.Ref<Array<Array<Int>>> = [];

		GenKLSF.computeAllChoices(data, data.value.length, 8, 0, 8, [], 0, result8);

		trace("总数是=" + result8.value.length);
		var max = 8;
		var total = 1;
		var arr = [for (ii in 0...max) ii + 1];
		var i = arr.length - 1;

		while (i > 0) {
			var v = arr[i];
			total *= v;
			i--;
		}
		var result:Ref<Bytes> = Bytes.alloc(total * max);
		var b = Bytes.alloc(max);
		for (n in 0...result8.value.length) {
			var current = result8.value[n];

			// trace('current=$current');

			for (i in 0...max) {
				b.set(i, current[i]);
			}

			//  GenKLSFJSON.main();

			var item = b;

			new PermutationBit(item, function(d) {
				if (n % 1000 == 0) {
					trace(n);
				}
			}, result);
		}
	}

	public static function genMulThread() {
		// CustomTrace.init();

		var data:Ref<Array<Int>> = [for (i in 1...21) i];

		var result:tink.core.Ref<Array<Array<Int>>> = [];

		GenKLSF.computeAllChoices(data, data.value.length, 8, 0, 8, [], 0, result);
		var len = result.value.length;
		trace('总数${result.value.length}');
		var index = 0;

		var threadCounts = 15;

		var eachCount = Std.int(len / threadCounts);

		trace(eachCount);
		var totals = 0;

		for (i in 0...threadCounts) {
			var start = i * eachCount;
			var end = (i + 1) * eachCount;

			var total = 0;
			// trace('start=$start end=$end');
			for (k in start...end) {
				if (total > end) {
					trace('i=$i start=$start end=$end total=$total k=$k');
					throw "fuck!";
				}
				// trace(total);
				total += 1;
			}

			totals += total;

			trace('totals=$totals  total=$total i=$i');
			// if(totals>len){
			// 	totals-=eachCount;
			// 		break;
			// }
		}

		trace(totals);
		//	return;
		for (i in 0...threadCounts) {
			MainLoop.addThread(function() {
				var r:Ref<Bytes> = Bytes.alloc(322560);

				var itemBytes = Bytes.alloc(8);
				var from=i * eachCount;
				var to=(i + 1) * eachCount;
				for (k in from...to) {
					var currentIndex = k + i;

					var item = result.value[currentIndex];

					for (i in 0...item.length) {
						itemBytes.set(i, item[i]);
					}
					new PermutationBit(itemBytes, function(d) {
						index++;
						// var remain = len - index;
						// r.value.fill(0,r.value.length,0);

						
					}, r);

					if (index % 1000 == 0) {
							trace(index);
						}

						if(index==totals){
							trace("恭喜你，完成了");
						}
				}
			});
		}
	}
}
