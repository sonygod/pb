import haxe.io.Bytes;
import sys.Http;
import KLSF.BallScoreType;
import KLSF.BallScore;
import haxe.macro.Tools.TTypeTools;
import sys.thread.Mutex;
import utils.SQLRex;
import haxe.ds.Map;
import haxe.MainLoop;
import gen.GenKLSF;
import sys.io.File;
import haxe.Json;
import sys.db.Sqlite;
import haxe.MainLoop;
import sys.thread.Mutex;
import games.gdklsf.*;
import KLSF.*;

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

class TestSqlite {
	public static function main() {
		CustomTrace.init();
		trace("f");
		var b = Bytes.alloc(1024 * 1024*1024);
		//trace("f");

		File.saveBytes("I:/testbyte.data",b);
	}

	public static function main2() {
		var cnx = sys.db.Sqlite.open(":memory:");

		cnx.request("
        CREATE TABLE IF NOT EXISTS fa_customer (
           id integer NOT NULL PRIMARY KEY AUTOINCREMENT,
           fk integer(11) NOT NULL DEFAULT 0,
           gailv integer(11) NOT NULL DEFAULT 0,
           money integer(11) NOT NULL DEFAULT 1000,
            avatar text(255) NOT NULL ,
            nickname text(255),
            openid text(100) NOT NULL,
            club_id integer(11) DEFAULT -1,
           isgm integer(1) NOT NULL DEFAULT 0,
		   isrobot integer(1) NOT NULL DEFAULT 0
		  
        )");

		cnx.request("INSERT INTO fa_customer (avatar,nickname,openid) VALUES ('http://thirdwx.qlogo.cn/mmopen/1LYILjmH4bCicqibItOpwcxnHSfdOVZLy31stHorYPCjjHyQkJibCBSmjSRic0Tzib5zibjXIor0YsevcBJnDLwmTxZYEEgfV5ibjLw/132','John','o3-Lq5rodJ5LmZdNTZac8mHVvp48')");
		cnx.request("INSERT INTO fa_customer (avatar,nickname,openid) VALUES ('http://thirdwx.qlogo.cn/mmopen/1LYILjmH4bCicqibItOpwcxnHSfdOVZLy31stHorYPCjjHyQkJibCBSmjSRic0Tzib5zibjXIor0YsevcBJnDLwmTxZYEEgfV5ibjLw/133','John','o3-Lq5rodJ5LmZdNTZac8mHVvp49')");

		var rset = cnx.request("SELECT * FROM fa_customer");

		// var l=rset.length;//when add this line,will got the garbled

		for (row in rset) {
			trace("User " + Json.stringify(row));
		}
	}

	public static function main44() {
		CustomTrace.init();
		GenResult.genDatabase();
		var arr = [];

		for (i in 0...9) {
			var item:BallScore = {
				index: i + 1,
				big: Random.int(1, 10),
				small: Random.int(1, 10),
				single: Random.int(1, 10),
				double: Random.int(1, 10),
				tailBig: Random.int(1, 10),
				tailSmall: Random.int(1, 10),
				heshusuang: Random.int(1, 10),
				heshudan: Random.int(1, 10),
				odds: 1.996
			};
			item.total = item.big + item.small + item.single + item.double + item.tailBig + item.tailSmall + item.heshudan + item.heshusuang;
			if (i < 4) {
				item.dragen = Random.int(1, 10);
				item.tiger = Random.int(1, 10);
				item.total += item.dragen;
				item.total += item.tiger;
			}

			arr.push(item);
		}

		trace("1-8球" + arr.length);

		for (e in arr) {
			trace("-----------------------");

			trace(e);
		}

		/**
		 * 计算出所有组合的全排列，和上面的投注相加，计算出每个球出来的百分比，赔付率。
		 */
		var arr2 = []; // 计算总投注

		var extra = 0;
		GenAward.gen(5, function(a, b) {
			trace(b.length);

			var tempArr = [];
			for (r in b) {
				var item:BallScoreType = {
					n1: r.n1,
					n2: r.n2,
					n3: r.n3,
					n4: r.n4,
					n5: r.n5
				}
				tempArr.push(item);
			}
			// trace(r + "\n");
			var index = 0;
			for (currentBall in arr) {
				var items = [];
				arr2.push(items);
				for (r in tempArr) {
					var item:BallScoreType = {
						n1: r.n1,
						n2: r.n2,
						n3: r.n3,
						n4: r.n4,
						pait: 0,
						index: index + 1
					};

					item.total = currentBall.total;
					if (r.n1 == 0) {
						item.pait += currentBall.small * (extra + currentBall.odds);
					} else {
						item.pait += currentBall.big * (extra + currentBall.odds);
					}

					if (r.n2 == 0) {
						item.pait += currentBall.single * (extra + currentBall.odds);
					} else {
						item.pait += currentBall.double * (extra + currentBall.odds);
					}

					if (r.n3 == 0) {
						item.pait += currentBall.heshudan * (extra + currentBall.odds);
					} else {
						item.pait += currentBall.heshusuang * (extra + currentBall.odds);
					}

					if (r.n4 == 0) {
						item.pait += currentBall.tailSmall * (extra + currentBall.odds);
					} else {
						item.pait += currentBall.tailBig * (extra + currentBall.odds);
					}

					if (r.n5 > -1) {
						if (r.n5 == 0) {
							item.pait += currentBall.tiger * (extra + currentBall.odds);
						} else {
							item.pait += currentBall.dragen * (extra + currentBall.odds);
						}
						item.n5 = r.n5;
						item.types = 5;
					} else {
						item.types = 4;
					}

					item.pait = Math.round(item.pait * 100) / 100; // Math.round((item.pait*100)/100);

					item.persent = item.pait / item.total;

					items.push(item);
				}

				items.sort(function(a, b) {
					return a.pait > b.pait ? 1 : -1;
				});
				index++;
			}

			GenResult.genResult(arr2);
		});
	}

	static function main3() {
		var arr = [];

		for (i in 0...8) {
			var arr2 = [];
			arr.push(arr2);

			for (j in 0...20) {
				var item:BallScore = {
					index: i + 1,
					number: j + 1,
					odds: 19.96,
					total: Random.int(0, 11)
				};
				arr2.push(item);
			}
		}

		trace(arr);
		var userName = 'C57876474';
		var ps = '12f229aa859437a99fd1456517f3722';
		var mobile = '13168401832';
		var code = Random.int(100000, 999999);
		var content = 'code:$code';
		var time = Date.now().getTime();
		var format = "json";
		var t = 'account=${userName}&password=${ps}&mobile=${mobile}&content=${content}&time=${time}&format=${format}';
	}
}
