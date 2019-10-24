package games.gdklsf;

import sys.db.Sqlite;
import sys.thread.Mutex;
import haxe.MainLoop;

/**
 * 生成中奖概率列表清单的全排列
 */
class GenAward {
	public static function gen(callBack:sys.db.Connection->sys.db.ResultSet->Void) {
		var a:Float = 0;

		var cnx = Sqlite.open(":memory:");

		cnx.request("PRAGMA synchronous = OFF");
		cnx.request("PRAGMA locking_mode=EXCLUSIVE"); // 不需要多个
		// cnx.request("PRAGMA journal_mode=WAL");
		cnx.request("PRAGMA synchronous = OFF");
		cnx.request("PRAGMA locking_mode=EXCLUSIVE"); // 不需要多个
		cnx.request("PRAGMA journal_mode=WAL");

		var createTableQ = 'create table Elements
			(
				i int not null primary key
			);
			insert into Elements
			values (0),(1);
			';
		var _arrray = createTableQ.split(';');

		for (q in _arrray) {
			var rs = cnx.request(q);

			var l = rs.length;
		}
		var total = 6;
		var a = 'select \n';

		var b = '';

		for (i in 1...total + 1) {
			b += 'E${i}.i as n${i}' + (i < total ? "," : "");
		}

		var c = ' \n from ';

		for (i in 1...total + 1) {
			c += 'Elements as E$i ' + (i < total ? "," : "");
		}

		var createPerMutationQ = a + b + c; // 这个计算出开奖玩法的概率数据。

		// trace(createPerMutationQ);
		var m1 = new Mutex();
		MainLoop.addThread(function() {
			trace("start");

			if (m1.tryAcquire()) {
				var rs = cnx.request(createPerMutationQ);
				var l = rs.length;
				// trace("len=" + l);

				// var arr = [];

				// for (r in rs) {
				// 	arr.push(r.n1 + r.n2 + r.n3 + r.n4 + r.n5 + r.n6 + r.n7 + r.n8 + r.n9 + r.n10 + r.n11 + r.n12 + r.n13 + r.n14 + r.n15);
				// }
				// trace("now!");

                callBack(cnx,rs);//回传。
			}
		});
	}
}
