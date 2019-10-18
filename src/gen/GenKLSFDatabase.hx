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

typedef Scroe = {
	var id:Int;
	var roomID:Int;
	var round:Int;
	var cards:Array<Int>;

	var earnMoney:Int;
	var loseMoney:Int;
	var fk:Int;
	var time:Date;
	var key:Int;
}

typedef Result_Sql = {
	var id:Int;
	var n1:Int;
	var n2:Int;
	var n3:Int;
	var n4:Int;
}

@await
class GenKLSFDatabase {
	public static function computeAllChoices(data:Ref<Array<Int>>, n:Int, outLen:Int, startIndex:Int, m:Int, arr:Array<Int>, arrIndex:Int,
			result:Ref<Array<Array<Int>>>) {
		if (m == 0) {
			// trace("finish" + arr);

			result.value.push(arr.copy());

			return;
		}

		var endIndex = n - m;
		// for(int i=startIndex; i<=endIndex; i++)

		var i = startIndex;

		while (i <= endIndex) {
			arr[arrIndex] = data.value[i];
			computeAllChoices(data, n, outLen, i + 1, m - 1, arr, arrIndex + 1, result);

			i++;
		}
	}

	public static function regenRandom(cndb:sys.db.Connection) {
		return tink.core.Future.async(function(cb) {
			var arr = [];
			var currentIndex = 0;
			var threadCount = 0;
			var results = "";

			var len = 116280;

			var sq = 90;

			var from = Std.int(len / sq);
			for (k in 0...sq) {
				var map:Map<Int, Array<Array<Int>>> = [];
				var cnx = Sqlite.open('./klsf6_$k.db');
				arr.push(cnx);
				cnx.request("PRAGMA synchronous = OFF");
				cnx.request("PRAGMA locking_mode=EXCLUSIVE"); // 不需要多个
				cnx.request("PRAGMA journal_mode=WAL");

				cnx.request("
                CREATE TABLE IF NOT EXISTS fa_result (
                    id integer NOT NULL PRIMARY KEY AUTOINCREMENT,
                    n1 integer  NOT NULL DEFAULT 0,
                    n2 integer  NOT NULL DEFAULT 0,
                    n3 integer NOT NULL DEFAULT 0,
                    n4 integer NOT NULL DEFAULT 0,
					
					n5 integer NOT NULL DEFAULT 0,
					n6 integer NOT NULL DEFAULT 0,
					n7 integer NOT NULL DEFAULT 0,
				    n8 integer NOT NULL DEFAULT 0,
					sum integer NOT NULL DEFAULT 0,
					
					result integer NOT NULL DEFAULT 0
					
                   
                )
                ");

				var q = 'select * from fa_game order by RANDOM()';

				var rs = cndb.request(q);

				trace(rs.length);

				var q2 = 'select * from fa_game order by RANDOM()';

				var rs2 = cndb.request(q2);
				trace(rs2.length);
				MainLoop.addThread(function() {
					trace('多线程正式开始 线程=$k');
					var arr1 = rs.results().array();
					var arr2 = rs2.results().array();

					trace(arr1.length);

					trace(arr2.length);

					cnx.request("begin;");

					var numbers = from;

					// for (m in 0...6) {

					for (i in k * numbers...(k + 1) * numbers) {
						for (j in k * numbers...(k + 1) * numbers) {
							var e:Result_Sql = arr1[i];
							var f:Result_Sql = arr2[j];

							// var sum = e.n1 + e.n2 + e.n3 + e.n4 + f.n1 + f.n2 + f.n3 + f.n4;
							// var arr = [e.n1, e.n2, e.n3, e.n4, f.n1, f.n2, f.n3, f.n4];
							currentIndex++;
							// if(currentIndex>10000000){
							// 	break;
							// }
							// var q = "INSERT INTO fa_result (n1,n2,n3,n4,n5,n6,n7,n8,sum) VALUES ("+e.n1+","+e.n2+","+e.n3+","+e.n4+","+f.n1+","+f.n2+","+f.n3+","+f.n4+","+sum+")";
							var q = 'INSERT INTO fa_result (n1,n2,n3,n4,n5,n6,n7,n8,sum) VALUES(${e.n1},${e.n2},${e.n3},${e.n4},${f.n1},${f.n2},${f.n3},${f.n4},${e.n1 + e.n2 + e.n3 + e.n4 + f.n1 + f.n2 + f.n3 + f.n4})';

							cnx.request(q);

							// map.set(currentIndex,[[e.n1 , e.n2, e.n3 , e.n4],[f.n1 , f.n2, f.n3 , f.n4]]);

							// if (currentIndex % 10000 == 0) {
							// 	trace('当前线程 $k  currentIndex=$currentIndex  ${(k+1)*numbers}');
							// }
							//	trace("what?2019");
						}
					}
					threadCount++;
					trace('current index=$currentIndex  threadCount=$threadCount 当前线程 $k  currentIndex=$currentIndex  ${(k + 1) * numbers}');

					if (threadCount == 6) {
						cb(arr);
					}

					cnx.request("commit;");
				});
			}
			trace(currentIndex);
		});
	}

	public static function main3() {
		CustomTrace.init();
		GenKLSF.gen();
	}

	@async
	public static function main() {
		CustomTrace.init();

		var cndb = Sqlite.open("./klsfx4.db");

		// 这里才是最终。

		var cnxs:Array<sys.db.Connection> = @await regenRandom(cndb);

		var q = "select * from fa_result where  n1=1 and n2=2 and n3=3 and n4=4 and n5=5 and n6=6 and n7=7 and n8=8";

		for (cnx in cnxs) {
			var rs = cnx.request(q);

			for (e in rs) {
				trace(e);
			}
			trace("now");
		}
	}

	public static function main4sddf() {
		CustomTrace.init();
		trace("开始读取");
		var cnx = Sqlite.open("./Data.db");

		// 这里才是最终。

		cnx.request("PRAGMA synchronous = OFF");
		cnx.request("PRAGMA locking_mode=EXCLUSIVE"); // 不需要多个
		cnx.request("PRAGMA journal_mode=WAL");
		cnx.request(" PRAGMA cache_size=5000");

		var q = "select * from SalesOrder where  Number='000000019019'";

		trace("ready?");
		var rs = cnx.request(q);
		trace(rs.length);
		trace("ok");
		trace("now");
	}
}
