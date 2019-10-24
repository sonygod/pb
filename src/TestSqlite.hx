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
		// var result:Ref<Array<Array<Int>>>=[];

		// var money=[100,200,300,500,600,700];

		// Permutation.gen([1,2,3,4,5,6],function (arr){

		//     trace(arr.length);
		// },result);

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
				trace("len=" + l);

				var arr = [];

				for (r in rs) {
					arr.push(r.n1 + r.n2 + r.n3 + r.n4 + r.n5 + r.n6 + r.n7 + r.n8 + r.n9 + r.n10 + r.n11 + r.n12 + r.n13 + r.n14 + r.n15);
				}
				trace("now!");
			}
		});

		//----------------------------------------------------开始创建
		var cnr = Sqlite.open(":memory:");

		cnr.request("PRAGMA synchronous = OFF");
		cnr.request("PRAGMA locking_mode=EXCLUSIVE"); // 不需要多个
		// cnx.request("PRAGMA journal_mode=WAL");
		cnr.request("PRAGMA synchronous = OFF");
		cnr.request("PRAGMA locking_mode=EXCLUSIVE"); // 不需要多个
		cnr.request("PRAGMA journal_mode=WAL");

		var createTableArr = 'DROP TABLE IF EXISTS "Elements_GDKLSF";
			CREATE TABLE "Elements_GDKLSF" (
			"i" int NOT NULL,
			PRIMARY KEY ("i")
			);

			-- ----------------------------
			-- Records of "Elements_GDKLSF"
			-- ----------------------------
			------------------------------------------
			INSERT INTO "Elements_GDKLSF" VALUES (1);
			INSERT INTO "Elements_GDKLSF" VALUES (2);
			INSERT INTO "Elements_GDKLSF" VALUES (3);
			INSERT INTO "Elements_GDKLSF" VALUES (4);
			INSERT INTO "Elements_GDKLSF" VALUES (5);
			INSERT INTO "Elements_GDKLSF" VALUES (6);
			------------------------------------------
			INSERT INTO "Elements_GDKLSF" VALUES (11);
			INSERT INTO "Elements_GDKLSF" VALUES (12);
			INSERT INTO "Elements_GDKLSF" VALUES (13);
			INSERT INTO "Elements_GDKLSF" VALUES (14);
			INSERT INTO "Elements_GDKLSF" VALUES (15);
			INSERT INTO "Elements_GDKLSF" VALUES (16);
			INSERT INTO "Elements_GDKLSF" VALUES (17);
			INSERT INTO "Elements_GDKLSF" VALUES (18);
			INSERT INTO "Elements_GDKLSF" VALUES (19);
			------------------------------------------
			INSERT INTO "Elements_GDKLSF" VALUES (20);
			INSERT INTO "Elements_GDKLSF" VALUES (21);
			INSERT INTO "Elements_GDKLSF" VALUES (22);
			INSERT INTO "Elements_GDKLSF" VALUES (23);
			INSERT INTO "Elements_GDKLSF" VALUES (24);
			INSERT INTO "Elements_GDKLSF" VALUES (25);
			INSERT INTO "Elements_GDKLSF" VALUES (26);
			INSERT INTO "Elements_GDKLSF" VALUES (27);
			INSERT INTO "Elements_GDKLSF" VALUES (28);
			INSERT INTO "Elements_GDKLSF" VALUES (29);
			------------------------------------------
			INSERT INTO "Elements_GDKLSF" VALUES (30);
			INSERT INTO "Elements_GDKLSF" VALUES (31);
			INSERT INTO "Elements_GDKLSF" VALUES (32);
			INSERT INTO "Elements_GDKLSF" VALUES (33);
			INSERT INTO "Elements_GDKLSF" VALUES (34);
			INSERT INTO "Elements_GDKLSF" VALUES (35);
			INSERT INTO "Elements_GDKLSF" VALUES (36);
			INSERT INTO "Elements_GDKLSF" VALUES (37);
			INSERT INTO "Elements_GDKLSF" VALUES (38);
			INSERT INTO "Elements_GDKLSF" VALUES (39);
			-----------------------------------------
			INSERT INTO "Elements_GDKLSF" VALUES (40);
			INSERT INTO "Elements_GDKLSF" VALUES (41);
			INSERT INTO "Elements_GDKLSF" VALUES (42);
			INSERT INTO "Elements_GDKLSF" VALUES (43);
			INSERT INTO "Elements_GDKLSF" VALUES (44);
			INSERT INTO "Elements_GDKLSF" VALUES (45);
			INSERT INTO "Elements_GDKLSF" VALUES (46);
			INSERT INTO "Elements_GDKLSF" VALUES (47);
			INSERT INTO "Elements_GDKLSF" VALUES (48);
			INSERT INTO "Elements_GDKLSF" VALUES (49);
			------------------------------------------
			INSERT INTO "Elements_GDKLSF" VALUES (50);
			INSERT INTO "Elements_GDKLSF" VALUES (51);
			INSERT INTO "Elements_GDKLSF" VALUES (52);
			INSERT INTO "Elements_GDKLSF" VALUES (53);
			INSERT INTO "Elements_GDKLSF" VALUES (54);
			INSERT INTO "Elements_GDKLSF" VALUES (55);
			INSERT INTO "Elements_GDKLSF" VALUES (56);
			INSERT INTO "Elements_GDKLSF" VALUES (57);
			INSERT INTO "Elements_GDKLSF" VALUES (58);
			------------------------------------------
			INSERT INTO "Elements_GDKLSF" VALUES (61);
			INSERT INTO "Elements_GDKLSF" VALUES (62);
			INSERT INTO "Elements_GDKLSF" VALUES (63);
			INSERT INTO "Elements_GDKLSF" VALUES (64);
			INSERT INTO "Elements_GDKLSF" VALUES (65);
			INSERT INTO "Elements_GDKLSF" VALUES (66);
			INSERT INTO "Elements_GDKLSF" VALUES (67);
			INSERT INTO "Elements_GDKLSF" VALUES (68);
			-----------------------------------------
			INSERT INTO "Elements_GDKLSF" VALUES (71);
			INSERT INTO "Elements_GDKLSF" VALUES (72);
			INSERT INTO "Elements_GDKLSF" VALUES (73);
			INSERT INTO "Elements_GDKLSF" VALUES (74);
			INSERT INTO "Elements_GDKLSF" VALUES (75);
			INSERT INTO "Elements_GDKLSF" VALUES (76);
			INSERT INTO "Elements_GDKLSF" VALUES (77);
			INSERT INTO "Elements_GDKLSF" VALUES (78);
			------------------------------------------
			INSERT INTO "Elements_GDKLSF" VALUES (81);
			INSERT INTO "Elements_GDKLSF" VALUES (82);
			INSERT INTO "Elements_GDKLSF" VALUES (83);
			INSERT INTO "Elements_GDKLSF" VALUES (84);
			INSERT INTO "Elements_GDKLSF" VALUES (85);
			INSERT INTO "Elements_GDKLSF" VALUES (86);
			INSERT INTO "Elements_GDKLSF" VALUES (87);
			INSERT INTO "Elements_GDKLSF" VALUES (88);
			---------------------------------------------
			';

		var arr = createTableArr.split(';');

		for (q in arr) {
			var rs = cnr.request(q);
			var len = rs.length;
		}

		trace("finish");

		var total = 6;
		var a = 'select \n';

		var b = '';
        var sum=', \n(';
		for (i in 1...total + 1) {
			b += 'E${i}.i as n${i}' + (i < total ? "," : "");
          sum+='E${i}.i';
		  if(i<total){
			  
			  sum+="+";
		  }else{
			  sum+=") as sum \n";
		  }
		}
       

	   trace(sum);
        


        
		var c = ' \n from ';

		for (i in 1...total + 1) {
			c += 'Elements_GDKLSF as E$i ' + (i < total ? "," : "");
		}

		var d = '\n where \n';

		for (i in 1...total+1) {
			if (i != 1) {
				if (i != 2) {
					d += "and ";
				}
				d += 'E${i}.i not in (';
				var len = 0;
				for (j in 1...i) {
					if (j != i) {
						d += 'E${j}.i';
						len++;

						if (len == i - 1) {
							d += ")\n";
						} else {
							d += ',';
						}
					}
				}
			}
		}

		var e=" limit 100,200";

		var createPerMutationQ = '
		

		select
    *
FROM
    (
        select
            *,
            n1 >= 11 as n1Big,
            n1 < 11 as n1Small,
            1 - n1 % 2 as n1Double,
            n1 % 2 as n1Single,
            n2 >= 11 as n2Big,
            n2 < 11 as n2Small,
            1 - n2 % 2 as n2Double,
            n2 % 2 as n2Single,
            n3 >= 11 as n3Big,
            n3 < 11 as n3Small,
            1 - n3 % 2 as n3Double,
            n3 % 2 as n3Single,
            n4 >= 11 as n4Big,
            n4 < 11 as n4Small,
            1 - n4 % 2 as n4Double,
            n4 % 2 as n4Single,
            n5 >= 11 as n5Big,
            n5 < 11 as n5Small,
            1 - n5 % 2 as n5Double,
            n5 % 2 as n5Single,
            n6 >= 11 as n6Big,
            n6 < 11 as n6Small,
            1 - n6 % 2 as n6Double,
            n6 % 2 as n6Single,
            n7 >= 11 as n7Big,
            n7 < 11 as n7Small,
            1 - n7 % 2 as n7Double,
            n7 % 2 as n7Single,
            n8 >= 11 as n8Big,
            n8 < 11 as n8Small,
            1 - n8 % 2 as n8Double,
            n8 % 2 as n8Single,
            CAST (
                SUBSTR(cast(n1 as text), LENGTH(cast(n1 as text))) AS int
            ) >= 5 AS n1TailBig,
            CAST (
                SUBSTR(cast(n2 as text), LENGTH(cast(n2 as text))) AS int
            ) >= 5 AS n2TailBig,
            CAST (
                SUBSTR(cast(n3 as text), LENGTH(cast(n3 as text))) AS int
            ) >= 5 AS n3TailBig,
            CAST (
                SUBSTR(cast(n4 as text), LENGTH(cast(n4 as text))) AS int
            ) >= 5 AS n4TailBig,
            CAST (
                SUBSTR(cast(n5 as text), LENGTH(cast(n5 as text))) AS int
            ) >= 5 AS n5TailBig,
            CAST (
                SUBSTR(cast(n6 as text), LENGTH(cast(n6 as text))) AS int
            ) >= 5 AS n6TailBig,
            CAST (
                SUBSTR(cast(n7 as text), LENGTH(cast(n7 as text))) AS int
            ) >= 5 AS n7TailBig,
            CAST (
                SUBSTR(cast(n8 as text), LENGTH(cast(n8 as text))) AS int
            ) >= 5 AS n8TailBig,
            CAST (
                SUBSTR(cast(n1 as text), LENGTH(cast(n1 as text))) AS int
            ) < 5 AS n1TailSmall,
            CAST (
                SUBSTR(cast(n2 as text), LENGTH(cast(n2 as text))) AS int
            ) < 5 AS n2TailSmall,
            CAST (
                SUBSTR(cast(n3 as text), LENGTH(cast(n3 as text))) AS int
            ) < 5 AS n3TailSmall,
            CAST (
                SUBSTR(cast(n4 as text), LENGTH(cast(n4 as text))) AS int
            ) < 5 AS n4TailSmall,
            CAST (
                SUBSTR(cast(n5 as text), LENGTH(cast(n5 as text))) AS int
            ) < 5 AS n5TailSmall,
            CAST (
                SUBSTR(cast(n6 as text), LENGTH(cast(n6 as text))) AS int
            ) < 5 AS n6TailSmall,
            CAST (
                SUBSTR(cast(n7 as text), LENGTH(cast(n7 as text))) AS int
            ) < 5 AS n7TailSmall,
            CAST (
                SUBSTR(cast(n8 as text), LENGTH(cast(n8 as text))) AS int
            ) < 5 AS n8TailSmall,
            ------------------------------------------------合数单双
            1 - (
                CAST (
                    SUBSTR(cast(n1 as text), LENGTH(cast(n1 as text)) -1, 1) AS int
                ) + CAST (
                    SUBSTR(cast(n1 as text), LENGTH(cast(n1 as text)), 1) AS int
                )
            ) % 2 = 0 as n1CompatDouble,
            (
                CAST (
                    SUBSTR(cast(n1 as text), LENGTH(cast(n1 as text)) -1, 1) AS int
                ) + CAST (
                    SUBSTR(cast(n1 as text), LENGTH(cast(n1 as text)), 1) AS int
                )
            ) % 2 = 0 as n1compatSingle,
            1 - (
                CAST (
                    SUBSTR(cast(n2 as text), LENGTH(cast(n2 as text)) -1, 1) AS int
                ) + CAST (
                    SUBSTR(cast(n2 as text), LENGTH(cast(n2 as text)), 1) AS int
                )
            ) % 2 = 0 as n2CompatDouble,
            (
                CAST (
                    SUBSTR(cast(n2 as text), LENGTH(cast(n2 as text)) -1, 1) AS int
                ) + CAST (
                    SUBSTR(cast(n2 as text), LENGTH(cast(n2 as text)), 1) AS int
                )
            ) % 2 = 0 as n2compatSingle,
            1 - (
                CAST (
                    SUBSTR(cast(n3 as text), LENGTH(cast(n3 as text)) -1, 1) AS int
                ) + CAST (
                    SUBSTR(cast(n3 as text), LENGTH(cast(n3 as text)), 1) AS int
                )
            ) % 2 = 0 as n3CompatDouble,
            (
                CAST (
                    SUBSTR(cast(n3 as text), LENGTH(cast(n3 as text)) -1, 1) AS int
                ) + CAST (
                    SUBSTR(cast(n3 as text), LENGTH(cast(n3 as text)), 1) AS int
                )
            ) % 2 = 0 as n3compatSingle,
            1 - (
                CAST (
                    SUBSTR(cast(n4 as text), LENGTH(cast(n4 as text)) -1, 1) AS int
                ) + CAST (
                    SUBSTR(cast(n4 as text), LENGTH(cast(n4 as text)), 1) AS int
                )
            ) % 2 = 0 as n4CompatDouble,
            (
                CAST (
                    SUBSTR(cast(n4 as text), LENGTH(cast(n4 as text)) -1, 1) AS int
                ) + CAST (
                    SUBSTR(cast(n4 as text), LENGTH(cast(n4 as text)), 1) AS int
                )
            ) % 2 = 0 as n4compatSingle,
            1 - (
                CAST (
                    SUBSTR(cast(n5 as text), LENGTH(cast(n5 as text)) -1, 1) AS int
                ) + CAST (
                    SUBSTR(cast(n5 as text), LENGTH(cast(n5 as text)), 1) AS int
                )
            ) % 2 = 0 as n5CompatDouble,
            (
                CAST (
                    SUBSTR(cast(n5 as text), LENGTH(cast(n5 as text)) -1, 1) AS int
                ) + CAST (
                    SUBSTR(cast(n5 as text), LENGTH(cast(n5 as text)), 1) AS int
                )
            ) % 2 = 0 as n5compatSingle,
            1 - (
                CAST (
                    SUBSTR(cast(n6 as text), LENGTH(cast(n6 as text)) -1, 1) AS int
                ) + CAST (
                    SUBSTR(cast(n6 as text), LENGTH(cast(n6 as text)), 1) AS int
                )
            ) % 2 = 0 as n6CompatDouble,
            (
                CAST (
                    SUBSTR(cast(n6 as text), LENGTH(cast(n6 as text)) -1, 1) AS int
                ) + CAST (
                    SUBSTR(cast(n6 as text), LENGTH(cast(n6 as text)), 1) AS int
                )
            ) % 2 = 0 as n6compatSingle,
            1 - (
                CAST (
                    SUBSTR(cast(n7 as text), LENGTH(cast(n7 as text)) -1, 1) AS int
                ) + CAST (
                    SUBSTR(cast(n7 as text), LENGTH(cast(n7 as text)), 1) AS int
                )
            ) % 2 = 0 as n7CompatDouble,
            (
                CAST (
                    SUBSTR(cast(n7 as text), LENGTH(cast(n7 as text)) -1, 1) AS int
                ) + CAST (
                    SUBSTR(cast(n7 as text), LENGTH(cast(n7 as text)), 1) AS int
                )
            ) % 2 = 0 as n7compatSingle,
            1 - (
                CAST (
                    SUBSTR(cast(n8 as text), LENGTH(cast(n8 as text)) -1, 1) AS int
                ) + CAST (
                    SUBSTR(cast(n8 as text), LENGTH(cast(n8 as text)), 1) AS int
                )
            ) % 2 = 0 as n8CompatDouble,
            (
                CAST (
                    SUBSTR(cast(n8 as text), LENGTH(cast(n8 as text)) -1, 1) AS int
                ) + CAST (
                    SUBSTR(cast(n8 as text), LENGTH(cast(n8 as text)), 1) AS int
                )
            ) % 2 = 0 as n8compatSingle
        from(
                SELECT
                    --两面总和查找
                    *,
                    1 - sum % 2 AS sumDoble,
                    sum % 2 AS sumSingle,
                    sum > 84 AS sumBig,
                    sum <= 84 AS sumSmall,
                    CAST (SUBSTR(sumText, LENGTH(sumText)) AS int) >= 5 AS sumTailBig
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
                                    Elements_GDKLSF AS E1,
                                    Elements_GDKLSF AS E2,
                                    Elements_GDKLSF AS E3,
                                    Elements_GDKLSF AS E4,
                                    Elements_GDKLSF AS E5,
                                    Elements_GDKLSF AS E6,
                                    Elements_GDKLSF AS E7,
                                    Elements_GDKLSF AS E8
                                WHERE
                                    E2.i NOT IN (E1.i)
                                    AND E3.i NOT IN (E1.i, E2.i)
                                    AND E4.i NOT IN (E1.i, E2.i, E3.i)
                                    AND E5.i NOT IN (E1.i, E2.i, E3.i, E4.i)
                                    AND E6.i NOT IN (E1.i, E2.i, E3.i, E4.i, E5.i)
                                    AND E7.i NOT IN (E1.i, E2.i, E3.i, E4.i, E5.i, E6.i)
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

	limit 10
		';

		trace(createPerMutationQ);

		var rs=cnr.request(createPerMutationQ);

		var len=rs.length;

		trace("\n lenx="+len);
	}
}
