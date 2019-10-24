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

		var createPerMutationQ = a + b +sum+ c + d+e; // 这个计算出开奖玩法的概率数据。

		trace(createPerMutationQ);

		var rs=cnr.request(createPerMutationQ);

		var len=rs.length;

		trace("\n lenx="+len);
	}
}
