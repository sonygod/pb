package gen;

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

		computeAllChoices(data, data.value.length, 4, 0, 4, [], 0, result);

		trace("result=" + result.value.length);

		var cnx = Sqlite.open("./klsfx4.db");

		cnx.request("PRAGMA synchronous = OFF");
		cnx.request("PRAGMA locking_mode=EXCLUSIVE"); // 不需要多个

		cnx.request("
                CREATE TABLE IF NOT EXISTS fa_game (
                    id integer NOT NULL PRIMARY KEY AUTOINCREMENT,
                    n1 integer  NOT NULL DEFAULT 0,
                    n2 integer  NOT NULL DEFAULT 0,
                    n3 integer NOT NULL DEFAULT 0,
                    n4 integer NOT NULL DEFAULT 0
					
                   
                )
                ");

		trace("ready?");
		cnx.request("begin;");

		var i = 0;
		var pArray = [];
		while (i < result.value.length) {
			new Permutation(result.value[i], function(arr) {
				i++;

				for (e in arr) {
					var q = 'INSERT INTO fa_game (n1,n2,n3,n4) VALUES(${e[0]},${e[1]},${e[2]},${e[3]})';

					// trace(q);
					var rs = cnx.request(q);
				}

				//   trace(rs.length);//here cpp will crash.
			});
		}

		cnx.request("commit;");
	}
}
