package;

import Random;

@:enum
abstract CardTypeNIUNIU(Int) from Int to Int {

	var CT_POINT0 = 0; // 错误类型
	var CT_POINT1 = 1; // 点数类型
	var CT_POINT2 = 2; // 点数类型
	var CT_POINT3 = 3; // 点数类型
	var CT_POINT4 = 4; // 点数类型
	var CT_POINT5 = 5; // 点数类型
	var CT_POINT6 = 6; // 点数类型
	var CT_POINT7 = 7; // 点数类型
	var CT_POINT8 = 8; // 点数类型
	var CT_POINT9 = 9; // 点数类型
	var duizi = 10;
    var CT_POINT00 = 11; // 错误类型

	@:op(A < B) static function lt(a:CardTypeNIUNIU, b:CardTypeNIUNIU):Bool;

	@:op(A <= B) static function lte(a:CardTypeNIUNIU, b:CardTypeNIUNIU):Bool;

	@:op(A > B) static function gt(a:CardTypeNIUNIU, b:CardTypeNIUNIU):Bool;

	@:op(A >= B) static function gte(a:CardTypeNIUNIU, b:CardTypeNIUNIU):Bool;

	@:op(A == B) static function eq(a:CardTypeNIUNIU, b:CardTypeNIUNIU):Bool;

	@:op(A != B) static function ne(a:CardTypeNIUNIU, b:CardTypeNIUNIU):Bool;

	@:op(A + B) static function add(a:CardTypeNIUNIU, b:CardTypeNIUNIU):UInt;
}

class SSC {
	static function getType(target:Array<Int>):CardTypeNIUNIU {
		var r = target[0] + target[1];
		if (target[0] == target[1]) {
			if (target[0] != 0) {
				return duizi;
			}
			return CT_POINT00;
		} else {
			if (r == 10) {
				return CT_POINT0;
			}
			
            return r>10?r%10:r;
		}
	}

	public static function main() {
		var randomArray:Array<Int> =[0,0,9,9,8];// [for (i in 0...5) Random.int(0, 9)];

		trace(' 待对比的数列= $randomArray');

		var _compareArray:Array<Array<Int>> = [];

		for (i in 0...5) {
			var j = i + 1;
			if (i == 4) {
				j = 0;
			}

			var arr = [randomArray[i], randomArray[j]];

			arr.sort(function(a, b) {
				if (a == 0) {
					a = 10;
				}
				if (b == 0) {
					b = 10;
				}
				return a > b ? -1 : 1;
			});

			_compareArray.push(arr);
		}

		trace('生成对比数列 $_compareArray');

		var zhuangIndex = Random.int(0, 5);

        zhuangIndex=zhuangIndex>4?4:zhuangIndex;

		trace('庄家位置 $zhuangIndex');

		var compareArray = _compareArray.slice(0);
		var temp = compareArray[0];
		var zhuangT = compareArray[zhuangIndex];
		compareArray[0] = zhuangT;
		compareArray[zhuangIndex] = temp;
		// 庄排第一。
		var zhuangType = getType(zhuangT);
		var result = [];
		for (i in 1...compareArray.length) {
			var xianType = getType(compareArray[i]);

			if (zhuangType > xianType) {
				result.push(1);
			} else if (zhuangType < xianType) {
				result.push(-1);
			} else {
				if (zhuangT[0] > compareArray[i][0]) {
					result.push(1);
				} else if (zhuangT[0] < compareArray[i][0]) {
					result.push(-1);
				} else {
					result.push(0);
				}
			}

			if (zhuangType == CT_POINT00 && xianType != duizi) {
				result[result.length - 1] = -1;
			}
			if (xianType == CT_POINT00 && zhuangType != duizi) {
				result[result.length - 1] = 1;
			}
		}

		trace(' 生成对比数列= $compareArray');
		trace('结果 $result');

		trace("对比结束");
	}
}
