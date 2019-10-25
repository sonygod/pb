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

			var arr3 = [];
			for (e in arr2) {
				// trace("----------------------------------------------------------------");
				// trace(e);

				arr3.push(e[0]);
			}

			trace(arr3);

			var persent4:Float = 0;

			var earnTotal:Float = 0;

			for (e in arr3) {
				persent4 += e.persent;
				earnTotal += e.total;
			}
			var p1 = persent4 / arr3.length;
			var p2 = 1 - p1;

			trace('总赔百分比 $p1  平台赚百分比 $p2 投注总额 $earnTotal 赚 ${earnTotal * p2}');

			trace("开始生成号码");

			var where = '\nwhere\n';

			for (i in 0...arr3.length - 1) {
				var item = arr3[i];

				where += item.n1 == 1 ? '\n n${i + 1}Big=1 and ' : ' n${i + 1}Big=0 and ';
				where += item.n2 == 1 ? ' n${i + 1}Double=1 and ' : ' n${i + 1}Double=0 and ';
				where += item.n3 == 1 ? ' n${i + 1}TailBig=1 and ' : ' n${i + 1}TailBig=0 and ';
				//where += item.n4 == 1 ? ' n${i + 1}CompatDouble=1 and ' : ' n${i + 1}CompatDouble=0 and \n';

				
				if (item.n5 != null &&i<4) {
					where += item.n4 == 1 ? 'n${i + 1}Long=1 and ' : 'n${i + 1}Long=0 and';
				}
			}

			var str=where;

			where=str.substring(0,str.length-5);

           GenResult.gen(where,function (a,b){

                   var len=b.length;

				   trace(len);
trace("得到结果是");
				   for(r in b){
					   trace(r);
				   }

		   });
			
		});
	}
}
