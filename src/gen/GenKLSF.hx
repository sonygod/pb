package gen;

import haxe.MainLoop;
import sys.db.Sqlite;
import Permutation;

using tink.CoreApi;

class GenKLSF {
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

	public static function gen() {
		var data:Ref<Array<Int>> = [for (i in 1...21) i];

		var result:tink.core.Ref<Array<Array<Int>>> = [];

		computeAllChoices(data, data.value.length, 8, 0, 8, [], 0, result);

		for (k in 0...6) {
			MainLoop.addThread(function() {
				var cnx = Sqlite.open('./klsfx8_${k + 1}.db');

				cnx.request("PRAGMA synchronous = OFF");
				cnx.request("PRAGMA locking_mode=EXCLUSIVE"); // 不需要多个
				cnx.request("PRAGMA journal_mode=WAL");
				cnx.request("
                CREATE TABLE IF NOT EXISTS fa_game (
                    id integer NOT NULL PRIMARY KEY AUTOINCREMENT,
                    n1 integer  NOT NULL DEFAULT 0,
                    n2 integer  NOT NULL DEFAULT 0,
                    n3 integer NOT NULL DEFAULT 0,
                    n4 integer NOT NULL DEFAULT 0,
					n5 integer NOT NULL DEFAULT 0,
                    n6 integer NOT NULL DEFAULT 0,
                    n7 integer NOT NULL DEFAULT 0,
                    n8 integer NOT NULL DEFAULT 0
                    
                   
                )
                ");

				trace("ready?");

				trace(result.value.length);
				var currentIndex = 0;
				var wasLocking = false;
				while (currentIndex < result.value.length) {
					var i = 20095 * k;
					var total = 20095 * (k + 1);

					trace('start=$i end=$total \n');
					while (i < total) {
						var result2:Ref<Array<Array<Int>>> = [];
						Permutation.gen(result.value[i], function(arr) {
							i++;
							currentIndex++;
							trace("finish" + i);
							if (arr.length > 0) {
								cnx.request("begin;");

								for (e in arr) {
									var q = 'INSERT INTO fa_game (n1,n2,n3,n4,n5,n6,n7,n8) VALUES(${e[0]},${e[1]},${e[2]},${e[3]},${e[4]},${e[5]},${e[6]},${e[7]})';

									// trace(q);

									var rs = cnx.request(q);
								}
								cnx.request("commit;");
							}
							//   trace(rs.length);//here cpp will crash.
						}, result2);

						trace(currentIndex);
					}
				};
			});
		}
	}
}
