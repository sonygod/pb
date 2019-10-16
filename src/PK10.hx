import haxe.Json;



typedef WinorLost = {
	var ori:Float;

	var win:Float;
	var lost:Float;
	var result:Float;
}

typedef Result = {
	var result:Array<WinorLost>;
	var platformWin:Float;
	var zhuangResult:Float;
	var allBiling:Float;

}

@:expose
class PK10 {
	static public function main(arr:Array<Float>,robot:Array<Float>,zhuangIndex:Int ,choushui:Float,zhuangBiling:Float):Result {
		var wl = [];
		var result:Result = {
			platformWin: 0,
			zhuangResult: 0,
			result: wl,
			allBiling: 0
		};
	//	var choushui:Float = 2 / 100;
	//	var arr:Array<Float> = [for (i in 0...6) 100 * Random.int(1, 10)];
	//	var zhuangIndex = Random.int(0, 6);
		arr[zhuangIndex] = 0;
	//	var robot:Array<Float> = [for (i in 0...6) 100 * Random.int(1, 10)];

		robot[zhuangIndex] = 0;

		function add(ar:Array<Float>) {
			var sum:Float = 0;
			var i = 0;
			while (i < ar.length) {
				sum += ar[i];

				i++;
			}
			return sum;
		}

		arr[zhuangIndex] = add(arr);
		robot[zhuangIndex] = add(robot);

		var all:Array<Float> = [];

		for (i in 0...arr.length) {
			all[i] = arr[i] + robot[i];
		}
		trace(arr);
		// trace(robot);

		function print(arr:Array<Float>, name:String) {
			var labels = [];
			for (i in 0...arr.length) {
				labels.push({n: "闲", v: arr[i], i: i + 1});
			}

			trace('$name -' + Json.stringify(labels));
			return labels;
		}

		//	print(arr, "真人");
		//	print(robot, "机器人");
		//	print(all, "总和");

	//	var zhuangBiling:Float = Random.int(100, Std.int(all[zhuangIndex]));
		trace('庄下单  $zhuangBiling');
		var persent = Random.int(1, 10);
		var allBiling = arr[zhuangIndex] + zhuangBiling;
		trace('平台一共收到 $allBiling 闲和 =${arr[zhuangIndex]} 庄下单  $zhuangBiling ');

		// trace('平台剩余 $remain');

		// arr.sort(function(a, b) {
		// 	return a > b ? -1 : 1;
		// });

		// trace(arr);
		// all.sort(function(a, b) {
		// 	return a > b ? -1 : 1;
		// });
		// robot.sort(function(a, b) {
		// 	return a > b ? -1 : 1;
		// });

		trace(all);

		var persent:Float = zhuangBiling / all[zhuangIndex]; // 庄头百分比。

		trace('百分比= ${persent * 100}%');

		var arr2 = arr.slice(1);
		var all2 = all.slice(1);
		var robot2 = robot.slice(1);
		print(arr2, "真人");
		print(robot2, "机器人");
		print(all2, "总和");

		trace('真人闲和=${arr[zhuangIndex]}  机器人闲和 =${robot[zhuangIndex]} 总和${all[zhuangIndex]}');

		var platformWin:Float = 0; // 平台总计赢。
		for (i in 0...arr2.length) {
			// 分2种情况。

			var item1 = arr2[i]; // 要赔付
			var item2 = all2[i] * persent; // 实际百分比赔付；

			var index = i + 1;

			var letZhuangWin = false; // 让庄赢吗？
			var extra = Math.abs(item2 - item1);
			if (item1 > item2) {
				letZhuangWin = true;

				var willWin:Float = item2 * (1 - choushui); // 赢钱
				var choushuiWin = item2 * choushui; // 平台抽水。
				var remainChoushui = item1 - item2;

				zhuangBiling += willWin;

				platformWin += remainChoushui + choushuiWin;

				wl.push({
					ori: arr2[i],
					win: 0,
					lost: arr2[i],
					result: 0
				});
               Assert.assert(willWin+choushuiWin+remainChoushui +robot2[i]==all2[i]);
			   arr2[i] = 0;
               
				trace('庄赢了 =$willWin   现在是 $zhuangBiling  平台抽水2%= $choushuiWin  平台总赢 $platformWin 闲 $index 输了');
			} else {
				letZhuangWin = false; // 闲赢。

				if (zhuangBiling > item2) {
					zhuangBiling -= item2;

					platformWin += extra;

					wl.push({
						ori: arr2[i],
						win: item1,
						lost: 0,
						result: arr2[i] + item1
					});
					arr2[i] += item1;
					trace('闲 $index 赢了  =$item2  现在是 ${arr2[i]}  平台赢差价=$extra   平台总赢 $platformWin 庄 输了 ');
				} else {
					trace("不够分了怎么办？");
					letZhuangWin = true;

					var willWin:Float = item2 * (1 - choushui); // 赢钱
					var choushuiWin = item2 * choushui; // 平台抽水。
					var remainChoushui = item1 - item2;
					zhuangBiling += willWin;

					platformWin += remainChoushui + choushuiWin;
					wl.push({
						ori: arr2[i],
						win: 0,
						lost: arr2[i],
						result: 0
					});
					arr2[i] = 0;
				}
			}
		}

		trace("闲最后的计算=" + arr2);

		trace("平台总收入=" + platformWin);

		trace("庄最后=" + zhuangBiling);

		Assert.assert(Math.abs(add(arr2) + platformWin + zhuangBiling - allBiling) < 1);

		result.platformWin = platformWin;
		result.zhuangResult = zhuangBiling;
		result.allBiling = allBiling;
        

		return result;
	}
}
