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

class GDKLSF {
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

	public static function regenRandom(cndb:sys.db.Connection):sys.db.Connection {
		var cnx = Sqlite.open(":memory:");

		cnx.request("PRAGMA synchronous = OFF");
		cnx.request("PRAGMA locking_mode=EXCLUSIVE"); // 不需要多个
		// cnx.request("PRAGMA journal_mode=WAL");
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
		var arr1 = rs.results().array();
		var arr2 = rs2.results().array();

		trace(arr1.length);

		trace(arr2.length);
		cnx.request("begin;");
		for (i in 0...arr1.length) {
			var e:Result_Sql = arr1[i];
			var f:Result_Sql = arr2[i];

			var arr = [e.n1, e.n2, e.n3, e.n4, f.n1, f.n2, f.n3, f.n4];

			var q = 'INSERT INTO fa_result (n1,n2,n3,n4,n5,n6,n7,n8,sum) VALUES(${e.n1},${e.n2},${e.n3},${e.n4},${f.n1},${f.n2},${f.n3},${f.n4},${e.n1 + e.n2 + e.n3 + e.n4 + f.n1 + f.n2 + f.n3 + f.n4})';

			cnx.request(q);
			//	trace("what?2019");
		}
		cnx.request("commit;");
		// var q = 'select count(*) from fa_result';
		// var rs = cnx.request(q);

		/**
			* for (e in rs) {
				trace(Reflect.field(e, "count(*)"));
			}
		 */

		var q = "select * from fa_result";

		var rs = cnx.request(q);

		return cnx;
	}

	public static function main() {
		CustomTrace.init();

		var cndb = Sqlite.open("./klsfx4.db");

		

		var cnx = regenRandom(cndb);

		var q = "select * from fa_result where  sum=84 and sum&1=0 and n8%10<5";

		var rs = cnx.request(q);

		for (e in rs) {
			trace(e);
		}
		trace("now");
	}
}
