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
class TestSqlite {
	@async
	public static function main() {
		CustomTrace.init();

		var total = 90;
		var arr = [];
		trace("准备打开数据库");
		for (i in 0...total) {
			var cnx = Sqlite.open('./database/klsf/klsf6_$i.db');
			arr.push(cnx);
			// 这里才是最终。

			cnx.request("PRAGMA synchronous = OFF");
			cnx.request("PRAGMA locking_mode=EXCLUSIVE"); // 不需要多个
			cnx.request("PRAGMA journal_mode=WAL");
		}

		trace("准备查询");
		// cnx.request(" PRAGMA cache_size=5000");

		//	trace('ready search =$i ');

		for (i in 0...arr.length) {
			MainLoop.addThread(function() {
				var cnx = arr[i];
				var q = 'SELECT * FROM "fa_result" where sum>80 limit 10';

				var rs = cnx.request(q);

				var len = rs.length;

				if (len > 0) {
					trace('有数据 长度=$len 在数据库 klsf6_$i.db \n');
				}
			});
		};

		trace("查询结束！");
	}
}
