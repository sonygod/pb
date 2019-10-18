import haxe.ds.Map;
import haxe.MainLoop;
import gen.GenKLSF;
import sys.io.File;
import haxe.Json;
import sys.db.Sqlite;

using tink.CoreApi;
using Lambda;

class CustomTrace {
	public static function init() {
		var oldTrace = haxe.Log.trace;
		haxe.Log.trace = function(v:Dynamic, ?pos:haxe.PosInfos) {
			oldTrace("[" + Date.now().toString() + "] " + Std.string(v), pos);
		};
	}
}

class TestSqlite {
	public static function main() {
		CustomTrace.init();

		var data:Ref<Array<Int>> = [for (i in 1...21) i];

		var result:tink.core.Ref<Array<Array<Int>>> = [];

		GenKLSF.computeAllChoices(data, data.value.length, 8, 0, 8, [], 0, result);
		var len = result.value.length;
		trace('总数${result.value.length}');
		var index = 0;

		var threadCounts =10;

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
				for (k in i * eachCount...(i + 1) * eachCount) {
					var currentIndex=k+i;
					index++;
					var item = result.value[currentIndex];

					var r:Ref<Array<Array<Int>>> = [];

                 if(!sys.FileSystem.exists('./database/json/klsf_$currentIndex.json')){
					   
				 File.saveContent('./database/json/klsf_$currentIndex.json', Json.stringify(""));
					new Permutation(item, function(d) {
					
				
						File.saveContent('./database/json/klsf_$currentIndex.json', Json.stringify(d));
						var remain = len - index;

					
							trace('当前线程 $i 当前数量${k+i} 索引是=$index klsf_$currentIndex.json');
						
					}, r);
					}else{
						//trace("文件存在，忽略!"+currentIndex);
					}
				}
			});
		}
	}
}
