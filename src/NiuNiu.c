using Lambda;

@:expose
class NiuNiu {
	static public function check_NiuPoint(value:Array<UInt>):Int{
		var res = -1;

		var bk = value.slice(0, value.length);
		var seat = [];
		var noseat = [];

		for (i in 0...3) {
			for (j in i + 1...bk.length - 1) {
				if ((bk[i] + bk[j] + bk[j + 1]) % 10 == 0) {
					seat = [i, j, j + 1];
					break;
				}
			}
		}
		if (seat.length == 3) {
			for (i in 0...bk.length) {
				if (seat.indexOf(i) == -1) {
					noseat.push(i);
				}
			}

			var num = (bk[noseat[0]] + bk[noseat[1]]) % 10;

			res=num;
		} else {
			res=-1; // 无牛
		}
		return res;
	}

	static public function test() {
		var arr = [2, 1, 7, 4, 5];
		var x = check_NiuPoint(arr);
		trace(x);
		var arr = [2, 1, 7, 4, 6];
		var x = check_NiuPoint(arr);
		trace(x);
	}

	public static function main() {
		test();
	}
}
