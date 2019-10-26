/**
	* 广东快乐十分规则说明
	每期广东快乐十分开奖球数共八粒。每粒球除了总和玩法，其它都有单独的投注页面。广东快乐十分每天开42期，每期间隔20分钟。北京时间（GMT+8）每天白天从上午09：00开到晚上23：00。
	1.两面：指单、双；大、小、尾大、尾小。
	单、双：号码为双数叫双，如8、16；号码为单数叫单，如19、5。
	大、小：开出之号码大于或等于11为大，小于或等于10为小。
	尾大、尾小：开出之尾数大于或等于5为尾大，小于或等于4为尾小。
	每一个号码为一投注组合，假如投注号码为开奖号码并在所投的球位置，视为中奖，其余情形视为不中奖。
	2.中发白
	中：开出之号码为01、02、03、04、05、06、07
	发：开出之号码为08、09、10、11、12、13、14
	白：开出之号码为15、16、17、18、19、20
	3.方位
	东：开出之号码为01、05、09、13、17
	南：开出之号码为02、06、10、14、18
	西：开出之号码为03、07、11、15、19
	北：开出之号码为04、08、12、16、20
	13.龙虎以第一球的中奖号码和第八球的中奖号码做为对奖号码。
	龙：开出之号码第一球的中奖号码大于第八球的中奖号码。如 第一球开出14 第八球开出09；第一球开出17 第八球开出08；第一球开出05 第八球开出01...中奖为龙。
	虎：开出之号码第一球的中奖号码小于第八球的中奖号码。如 第一球开出14 第八球开出16；第一球开出13 第八球开出18；第一球开出05 第八球开出08...中奖为虎。
	14.正码
	从01至20中任意选择1个号码进行投注， 投注号码与开奖号码中任意1个位置的号码相符，即中奖。
	4.总和单双：所有8个开奖号码的数字总和值是单数为总和单，如数字总和值是31、51；所有8个开奖号码的数字总和值是双数为总和双，如数字总和是42、80；假如投注组合符合中奖结果，视为中奖，其余情形视为不中奖。
	5.总和大小：所有8个开奖号码的数字总和值85到132为总大；所有8个开奖号码的数字总和值36到83为总分小；所有8个开奖号码的数字总和值为84打和；如开奖号码为01、20、02、08、17、09、11，数字总和是68，则总分小。假如投注组合符合中奖结果，视为中奖，其余情形视为不中奖，打和不计算结果。
	6.总尾大小：所有8个开奖号码的数字总和数值的个位数大于或等于5为总尾大，小于或等于4为总尾小；假如投注组合符合中奖结果，视为中奖，其余情形视为不中奖。
	7.选二任选：指从01至20中任意选择2个号码对开奖号码中任意2个位置的投注。 投注号码与开奖号码中任意2个位置的号码相符，即中奖。
	8.选二连组：指从01至20中任意选择2个号码对开奖号码中按开奖顺序出现的2个连续位置的投注。 投注号码与开奖号码中按开奖顺序出现的2个连续位置的号码相符（顺序不限），即中奖。
	9.选三任选：指从01至20中任意选择3个号码对开奖号码中任意3个位置的投注。 投注号码与开奖号码中任意3个位置的号码相符，即中奖。
	10.选三前组：指从01至20中任意选择3个号码对开奖号码中按开奖顺序出现的前3个连续位置的投注。 投注号码与开奖号码中按开奖顺序出现的前3个位置的号码相符（顺序不限），即中奖。
	11.选四任选：指从01至20中任意选择4个号码，对开奖号码中任意4个位置的投注。 投注号码与开奖号码中任意4个位置的号码相符，即中奖。
	12.选五任选：指从01至20中任意选择5个号码，对开奖号码中任意5个位置的投注。 投注号码与开奖号码中任意5个位置的号码相符，即中奖。
 */

import tink.macro.DirectType;
import haxe.ds.Map;

using Lambda;

// 赔率
class AwardBothSidePersent {
	public var big:Float = 1.996;
	public var small:Float = 1.996;
	public var single:Float = 1.996;
	public var double:Float = 1.996;
	public var dragen:Float = 1.996;
	public var tiger:Float = 1.996;
	public var tailBig:Float = 1.996;
	public var tailSmall:Float = 1.996;
	public var heshudan:Float = 1.996;
	public var heshusuang:Float = 1.996;
}

class AwardSingel {
	public var persent:Float = 19.96;
}

class SpecialPersent {}

@:enum
abstract DirType(UInt) from UInt to UInt {
	var east = 0; // 东
	var west = 1; // 西
	var north = 2; // 南
	var south = 3; // 北
	var mid = 4; // 中
	var fa = 5; // 发
	var bai = 6; // 白

	@:op(A < B) static function lt(a:DirType, b:DirType):Bool;

	@:op(A <= B) static function lte(a:DirType, b:DirType):Bool;

	@:op(A > B) static function gt(a:DirType, b:DirType):Bool;

	@:op(A >= B) static function gte(a:DirType, b:DirType):Bool;

	@:op(A == B) static function eq(a:DirType, b:DirType):Bool;

	@:op(A != B) static function ne(a:DirType, b:DirType):Bool;

	@:op(A + B) static function add(a:DirType, b:DirType):UInt;
}

// 每一球
typedef BallScore = {
	@:optional var index:Int; // 序号
	@:optional var number:Int; // 号码
	@:optional var big:Int; // 大
	@:optional var small:Int; // 小
	@:optional var single:Int; // 单
	@:optional var double:Int; // 双
	@:optional var dragen:Int; // 龙
	@:optional var tiger:Int; // 虎
	@:optional var tailBig:Int; // 尾巴大
	@:optional var tailSmall:Int; // 尾巴小
	@:optional var heshudan:Int; // 合数单
	@:optional var heshusuang:Int; // 合数双
	@:optional var dirct:DirType; // 东南西北东发白。
	@:optional var odds:Float; // 赔率
	@:optional var total:Float;//投注总额
	@:optional var pait:Float;//要赔付总额
	@:optional var persent:Float;//赔付百分比
}

typedef BallScoreType = {
	@:optional var index:Int;//位置。
	@:optional var n1:Int; // 序号 大小
	@:optional var n2:Int; // 序号 单双
	@:optional var n3:Int; // 序号  合数
	@:optional var n4:Int; // 序号  尾巴
    @:optional var n5:Int; // 序号  龙虎
	@:optional var persent:Float; // 赔率
	@:optional var total:Float; // 总投注
	@:optional var pait:Float;//要赔付总额
	@:optional var types:Int;//玩法种类数量
}
// 总和
class SumScore {
	public var big:Int;
	public var small:Int;
	public var single:Int;
	public var double:Int;
	public var dragen:Int;
	public var tiger:Int;
	public var tailBig:Int;
	public var tailSmall:Int;
}



/**
 * 两面
 */
class LiangmianType {
	public var sum:SumScore;
	public var balls:Array<BallScore>;
}

/**
 * 单号1-8
 */
class SignType {
	//	var map:Map<Int, Int>
	var all:Array<BallScore>;
}

/**
 * 第一球到第八球
 */
class EachType {
	var all:Array<BallScore>;
}

class LianMa {
	var all:Array<Array<BallScore>>;
}

class ZhenMa {
	var all:Array<BallScore>;
}

class KLSF {
	public static function checkDouble(n:UInt) {
		return n % 2 == 0;
	}

	public static function checkBig(n:UInt) {
		return n > 10;
	}

	public static function checkTailBig(n:UInt) {
		return n > 5;
	}

	// 龙虎
	public static function CheckLong(n1:UInt, n2:UInt) {
		return n1 > n2;
	}

	static function getSum(arr:Array<UInt>) {
		var sum = 0;

		for (e in arr) {
			sum += e;
		}
		return sum;
	}

	public static function checkSumBig(arr:Array<UInt>):Int {
		var sum = getSum(arr);

		if (sum > 84) {
			return 1;
		}

		if (sum < 84) {
			return 0;
		}

		return -1;
	}

	public static function checkSumDouble(arr:Array<UInt>) {
		var sum = getSum(arr);

		return checkDouble(sum);
	}

	// 任x选X
	public static function checkRandomEq(arr1:Array<UInt>, arr2:Array<UInt>):Int {
		var sum = 0;
		for (i in 0...arr1.length) {
			if (arr1[i] == arr2[i]) {
				sum++;
			}
		}
		return sum;
	}

	// 按顺序相同。
	public static function checkEq(arr1:Array<UInt>, arr2:Array<UInt>):Int {
		var sum = 0;
		var isSame = false;
		for (i in 0...arr1.length) {
			if (arr1[i] == arr2[i]) {
				sum++;
				isSame = true;
			} else {
				if (isSame) {
					return sum;
				}
			}
		}
		return sum;
	}
}
