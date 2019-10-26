package games.gdklsf;

import KLSF.BallScoreType;
import sys.db.Sqlite;
import sys.thread.Mutex;
import haxe.MainLoop;
import tink.CoreApi;

class GenResult {
	static var m1:Mutex;
	static var cnr:sys.db.Connection;

	public static function genDatabase() {
		m1 = new Mutex();
		//----------------------------------------------------开始创建
		cnr = Sqlite.open(":memory:");

		cnr.request("PRAGMA synchronous = OFF");
		cnr.request("PRAGMA locking_mode=EXCLUSIVE"); // 不需要多个
		// cnx.request("PRAGMA journal_mode=WAL");
		cnr.request("PRAGMA synchronous = OFF");
		cnr.request("PRAGMA locking_mode=EXCLUSIVE"); // 不需要多个
		cnr.request("PRAGMA journal_mode=WAL");

		var createTableArr = 'DROP TABLE IF EXISTS "Elements";
			CREATE TABLE "Elements" (
			"i" int NOT NULL,
			PRIMARY KEY ("i")
			);

			-- ----------------------------
			-- Records of "Elements"
			-- ----------------------------
			------------------------------------------
			INSERT INTO "Elements" VALUES (1);
			INSERT INTO "Elements" VALUES (2);
			INSERT INTO "Elements" VALUES (3);
			INSERT INTO "Elements" VALUES (4);
			INSERT INTO "Elements" VALUES (5);
			INSERT INTO "Elements" VALUES (6);
			------------------------------------------
			INSERT INTO "Elements" VALUES (11);
			INSERT INTO "Elements" VALUES (12);
			INSERT INTO "Elements" VALUES (13);
			INSERT INTO "Elements" VALUES (14);
			INSERT INTO "Elements" VALUES (15);
			INSERT INTO "Elements" VALUES (16);
			INSERT INTO "Elements" VALUES (17);
			INSERT INTO "Elements" VALUES (18);
			INSERT INTO "Elements" VALUES (19);
			------------------------------------------
			INSERT INTO "Elements" VALUES (20);
			INSERT INTO "Elements" VALUES (21);
			INSERT INTO "Elements" VALUES (22);
			INSERT INTO "Elements" VALUES (23);
			INSERT INTO "Elements" VALUES (24);
			INSERT INTO "Elements" VALUES (25);
			INSERT INTO "Elements" VALUES (26);
			INSERT INTO "Elements" VALUES (27);
			INSERT INTO "Elements" VALUES (28);
			INSERT INTO "Elements" VALUES (29);
			------------------------------------------
			INSERT INTO "Elements" VALUES (30);
			INSERT INTO "Elements" VALUES (31);
			INSERT INTO "Elements" VALUES (32);
			INSERT INTO "Elements" VALUES (33);
			INSERT INTO "Elements" VALUES (34);
			INSERT INTO "Elements" VALUES (35);
			INSERT INTO "Elements" VALUES (36);
			INSERT INTO "Elements" VALUES (37);
			INSERT INTO "Elements" VALUES (38);
			INSERT INTO "Elements" VALUES (39);
			-----------------------------------------
			INSERT INTO "Elements" VALUES (40);
			INSERT INTO "Elements" VALUES (41);
			INSERT INTO "Elements" VALUES (42);
			INSERT INTO "Elements" VALUES (43);
			INSERT INTO "Elements" VALUES (44);
			INSERT INTO "Elements" VALUES (45);
			INSERT INTO "Elements" VALUES (46);
			INSERT INTO "Elements" VALUES (47);
			INSERT INTO "Elements" VALUES (48);
			INSERT INTO "Elements" VALUES (49);
			------------------------------------------
			INSERT INTO "Elements" VALUES (50);
			INSERT INTO "Elements" VALUES (51);
			INSERT INTO "Elements" VALUES (52);
			INSERT INTO "Elements" VALUES (53);
			INSERT INTO "Elements" VALUES (54);
			INSERT INTO "Elements" VALUES (55);
			INSERT INTO "Elements" VALUES (56);
			INSERT INTO "Elements" VALUES (57);
			INSERT INTO "Elements" VALUES (58);
			------------------------------------------
			INSERT INTO "Elements" VALUES (61);
			INSERT INTO "Elements" VALUES (62);
			INSERT INTO "Elements" VALUES (63);
			INSERT INTO "Elements" VALUES (64);
			INSERT INTO "Elements" VALUES (65);
			INSERT INTO "Elements" VALUES (66);
			INSERT INTO "Elements" VALUES (67);
			INSERT INTO "Elements" VALUES (68);
			-----------------------------------------
			INSERT INTO "Elements" VALUES (71);
			INSERT INTO "Elements" VALUES (72);
			INSERT INTO "Elements" VALUES (73);
			INSERT INTO "Elements" VALUES (74);
			INSERT INTO "Elements" VALUES (75);
			INSERT INTO "Elements" VALUES (76);
			INSERT INTO "Elements" VALUES (77);
			INSERT INTO "Elements" VALUES (78);
			------------------------------------------
			INSERT INTO "Elements" VALUES (81);
			INSERT INTO "Elements" VALUES (82);
			INSERT INTO "Elements" VALUES (83);
			INSERT INTO "Elements" VALUES (84);
			INSERT INTO "Elements" VALUES (85);
			INSERT INTO "Elements" VALUES (86);
			INSERT INTO "Elements" VALUES (87);
			INSERT INTO "Elements" VALUES (88);
			---------------------------------------------
			';

		var arr = createTableArr.split(';');

		for (q in arr) {
			var rs = cnr.request(q);
			var len = rs.length;
		}
		var q = "select * from Elements ";

		var rs = cnr.request(q);
		var l = rs.length;

		trace("初始化数据库完毕");
	}

	public static function gen(where:String, callBack:sys.db.Connection->sys.db.ResultSet->Void) {
		var createPerMutationQ = '
        select n1,n2,n3,n4,n5,n6,n7,n8 from(
		SELECT
	*,
-----------------------------
	n1 > n8 AS n1Long,
	n2 > n7 AS n2Long,
	n3 > n6 AS n3Long,
	n4 > n5 AS n4Long,
---------------------------
-------------------------------
	n1 >= 11 AS n1Big,
	1 - n1 % 2 AS n1Double,
	n2 >= 11 AS n2Big,
	1 - n2 % 2 AS n2Double,
	n3 >= 11 AS n3Big,
	1 - n3 % 2 AS n3Double,
	n4 >= 11 AS n4Big,
	1 - n4 % 2 AS n4Double,
	n5 >= 11 AS n5Big,
	1 - n5 % 2 AS n5Double,
	n6 >= 11 AS n6Big,
	1 - n6 % 2 AS n6Double,
	n7 >= 11 AS n7Big,
	1 - n7 % 2 AS n7Double,
	n8 >= 11 AS n8Big,
	1 - n8 % 2 AS n8Double,
	n8 % 2 AS n8Single,
--------------大小 单双--------------------
------------------------------------------------------------------------------------------------
	CAST ( SUBSTR( CAST ( n1 AS text ), LENGTH( CAST ( n1 AS text ))) AS int ) >= 5 AS n1TailBig,
	CAST ( SUBSTR( CAST ( n2 AS text ), LENGTH( CAST ( n2 AS text ))) AS int ) >= 5 AS n2TailBig,
	CAST ( SUBSTR( CAST ( n3 AS text ), LENGTH( CAST ( n3 AS text ))) AS int ) >= 5 AS n3TailBig,
	CAST ( SUBSTR( CAST ( n4 AS text ), LENGTH( CAST ( n4 AS text ))) AS int ) >= 5 AS n4TailBig,
	CAST ( SUBSTR( CAST ( n5 AS text ), LENGTH( CAST ( n5 AS text ))) AS int ) >= 5 AS n5TailBig,
	CAST ( SUBSTR( CAST ( n6 AS text ), LENGTH( CAST ( n6 AS text ))) AS int ) >= 5 AS n6TailBig,
	CAST ( SUBSTR( CAST ( n7 AS text ), LENGTH( CAST ( n7 AS text ))) AS int ) >= 5 AS n7TailBig,
	CAST ( SUBSTR( CAST ( n8 AS text ), LENGTH( CAST ( n8 AS text ))) AS int ) >= 5 AS n8TailBig,
--------------------------------------------------------------------------------------------------------
	(
	CAST ( SUBSTR( n1, 0, LENGTH( n1 )) AS int ) + CAST ( SUBSTR( n1, LENGTH( n1 )) AS int )) % 2 = 0 AS n1CompatDouble,
	(
	CAST ( SUBSTR( n2, 0, LENGTH( n2 )) AS int ) + CAST ( SUBSTR( n2, LENGTH( n2 )) AS int )) % 2 = 0 AS n2CompatDouble,
	(
	CAST ( SUBSTR( n3, 0, LENGTH( n3 )) AS int ) + CAST ( SUBSTR( n3, LENGTH( n3 )) AS int )) % 2 = 0 AS n3CompatDouble,
	(
	CAST ( SUBSTR( n4, 0, LENGTH( n4 )) AS int ) + CAST ( SUBSTR( n4, LENGTH( n4 )) AS int )) % 2 = 0 AS n4CompatDouble,
	(
	CAST ( SUBSTR( n5, 0, LENGTH( n5 )) AS int ) + CAST ( SUBSTR( n5, LENGTH( n5 )) AS int )) % 2 = 0 AS n5CompatDouble,
	(
	CAST ( SUBSTR( n6, 0, LENGTH( n6 )) AS int ) + CAST ( SUBSTR( n6, LENGTH( n6 )) AS int )) % 2 = 0 AS n6CompatDouble,
	(
	CAST ( SUBSTR( n7, 0, LENGTH( n7 )) AS int ) + CAST ( SUBSTR( n7, LENGTH( n7 )) AS int )) % 2 = 0 AS n7CompatDouble,
	(
	CAST ( SUBSTR( n1, 0, LENGTH( n8 )) AS int ) + CAST ( SUBSTR( n8, LENGTH( n8 )) AS int )) % 2 = 0 AS n8CompatDouble 
FROM
	(
SELECT

	*,
	1 - sum % 2 AS sumDouble,
	
	sum > 84 AS sumBig,
	
	CAST ( SUBSTR( sumText, LENGTH( sumText )) AS int ) >= 5 AS sumTailBig 
FROM
	(
SELECT
	* 
FROM
	(
SELECT
	E1.i AS n1,
	E2.i AS n2,
	E3.i AS n3,
	E4.i AS n4,
	E5.i AS n5,
	E6.i AS n6,
	E7.i AS n7,
	E8.i AS n8,
	(
	E1.i + E2.i + + E3.i + + E4.i + + E5.i + + E6.i + + E7.i + E8.i 
	) AS sum,
	CAST (
	(
	E1.i + E2.i + + E3.i + + E4.i + + E5.i + + E6.i + + E7.i + E8.i 
	) AS text 
	) AS sumText 
FROM
	Elements AS E1,
	Elements AS E2,
	Elements AS E3,
	Elements AS E4,
	Elements AS E5,
	Elements AS E6,
	Elements AS E7,
	Elements AS E8 
WHERE
	E2.i NOT IN ( E1.i ) 
	AND E3.i NOT IN ( E1.i, E2.i ) 
	AND E4.i NOT IN ( E1.i, E2.i, E3.i ) 
	AND E5.i NOT IN ( E1.i, E2.i, E3.i, E4.i ) 
	AND E6.i NOT IN ( E1.i, E2.i, E3.i, E4.i, E5.i ) 
	AND E7.i NOT IN ( E1.i, E2.i, E3.i, E4.i, E5.i, E6.i ) 
	AND E8.i NOT IN (
	E1.i,
	E2.i,
	E3.i,
	E4.i,
	E5.i,
	E6.i,
	E7.i 
	) 
	) 
	) 
	) 
    )
    '

			+ where
			+ "\n limit 1";

		// trace(createPerMutationQ);
		var rs = cnr.request(createPerMutationQ);

		var len = rs.length;

		callBack(cnr, rs);

		return;
		MainLoop.addThread(function() {
			if (m1.tryAcquire()) {
				var rs = cnr.request(createPerMutationQ);

				var len = rs.length;

				callBack(cnr, rs);
			}
		});
	}

	public static function genFromWhereArray(whereArray:Array<String>, callBack:Dynamic->Void) {
		var i = 0;
		var loop = true;

		while (i < whereArray.length && loop) {
			gen("where " + whereArray[i], function(a, b) {
				var len = b.length;

				if (len > 0) {
					trace('得到结果是 + $len index=$i  ${whereArray[i]}');
					loop = false;

					var result = {};
					for (r in b) {
						// trace(r);
						result = r;
					}
					if (callBack != null) {
						callBack({sql: whereArray[i], index: i, result: result});
					}
				}

				i++;
			});
		}
	}

	public static function genResult(arr2:Array<Array<BallScoreType>>) {
		var data:Ref<Array<Dynamic>> = [];
		genHitTest(arr2, 0, "", data.value);

		trace('data=\n' + data);

		var data2:Array<Dynamic> = data;

		var p:Float = 0;
		var total:Float = 0;
		var pait:Float = 0;
		for (e in data2) {
			trace(arr2[e.index0][e.index1]);
			p += arr2[e.index0][e.index1].persent;
			total += arr2[e.index0][e.index1].total;
			pait += arr2[e.index0][e.index1].pait;
		}

		trace('概率p=  ${p / data2.length}  总投注=${total}  玩家赢=$pait 中奖号码${data2[data2.length - 1].result}');
	}

	/**
	 * 这里已经是8个球 各种购买的数据了。
	 * @param arr2
	 */
	static function genHitTest(arr2:Array<Array<BallScoreType>>, index:Int = 0, sql:String = "", data:Ref<Array<Dynamic>>) {
		var arr3 = arr2[index];
		var whereArray = [];
		// for (i in 0...arr3.length - 1) {

		if (index < 8) {
			for (e in arr3) {
				// trace(e);
				var where = sql + " ";
				// var i = e.index - 1;
				var item = e;

				where += item.n1 == 1 ? '\n n${index + 1}Big=1 and ' : ' n${index + 1}Big=0 and';
				where += item.n2 == 1 ? ' n${index + 1}Double=1 and ' : ' n${index + 1}Double=0 and';
				where += item.n3 == 1 ? ' n${index + 1}TailBig=1 and ' : ' n${index + 1}TailBig=0 and';
				where += item.n4 == 1 ? ' n${index + 1}CompatDouble=1 and ' : ' n${index + 1}CompatDouble=0 and';

				if (item.n5 != null && index < 4) {
					where += item.n5 == 1 ? '   n${index + 1}Long=1 and ' : '  n${index + 1}Long=0 and';
				}

				var str = where;

				where = str.substring(0, str.length - 4);
				whereArray.push(where);
				// trace(where);
			}
		} else {
			// 计算sum
			for (e in arr3) {
				// trace(e);
				var where = sql + " ";
				// var i = e.index - 1;
				var item = e;

				where += item.n1 == 1 ? '\n sumBig=1 and ' : ' sumBig=0 and';
				where += item.n2 == 1 ? ' sumDouble=1 and ' : ' sumDouble=0 and';
				where += item.n3 == 1 ? ' sumTailBig=1 and ' : ' sumTailBig=0 and';

				var str = where;

				where = str.substring(0, str.length - 4);
				whereArray.push(where);
			}
		}

		GenResult.genFromWhereArray(whereArray, function(result) {
			data.value.push({index0: index, index1: result.index});
			index++;
			sql = result.sql + " and ";
			if (index < 9) {
				// trace(sql);

				genHitTest(arr2, index, sql, data);
			} else {
				trace("查找完成" + result.sql);

				trace(result.result);
				data.value[data.value.length - 1].result = Std.string(result.result);
			}
		});
	}
}
