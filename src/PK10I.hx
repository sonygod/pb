import haxe.Json;
using tink.CoreApi;
typedef WinorLost = {
	var ori:Float;

	var win:Float;
	var lost:Float;
	var result:Float;
	var index:Int;
}

typedef Result = {
	var result:Array<WinorLost>;
	var platformWin:Float;
	var zhuangResult:Float;
	var allBiling:Float;
}

typedef IndexE = {
	var index:Int;
	var value:Float;
}

@:expose
class PK10I {

	
	static public function main(_arr:Array<Float>, _robot:Array<Float>, zhuangIndex:Int, choushui:Float, zhuangBiling:Float):Void {
		var wl = [];
		var result:Result = {
			platformWin: 0,
			zhuangResult: 0,
			result: wl,
			allBiling: 0
		};

		var _all:Array<Float> = [];

		for (i in 0..._arr.length) {
			_all[i] = _arr[i] + _robot[i];
		}
		trace(_arr);
		// trace(robot);

		function print(arr:Array<IndexE>, name:String) {
			var labels = [];
			for (i in 0...arr.length) {
				labels.push({n: "闲", v: arr[i]});
			}

			trace('$name -' + Json.stringify(labels));
			return labels;
		}

		trace('庄下单  $zhuangBiling');
		var persent = Random.int(1, 10);
		var allBiling = _arr[zhuangIndex] + zhuangBiling;
		trace('平台一共收到 $allBiling 闲和 =${_arr[zhuangIndex]} 庄下单  $zhuangBiling ');

		var arr:Array<IndexE> = [];
		var robot:Array<IndexE> = [];
		var all:Array<IndexE> = [];
		for (i in 0..._arr.length) {
			arr.push({index: i, value: _arr[i]});
			robot.push({index: i, value: _robot[i]});
			all.push({index: i, value: _all[i]});
		}

		// trace('平台剩余 $remain');
		function sortR(a:IndexE, b:IndexE) {
			return return a.value > b.value ? -1 : 1;
		}
		function sortIndex(a:IndexE, b:IndexE) {
			return return a.index > b.index ? 1 : -1;
		}

		trace(all);

		var persent:Float = zhuangBiling / all[zhuangIndex].value; // 庄头百分比。

		trace('百分比= ${persent * 100}%');

		trace('真人闲和=${arr[zhuangIndex]}  机器人闲和 =${robot[zhuangIndex]} 总和${all[zhuangIndex]}');

		var platformWin:Float = 0; // 平台总计赢。

		var results = [];
		var resultsArray=[];

		var keyArray = [0, 1, 2, 3, 4, 5];
		var tZhuang = keyArray[zhuangIndex];

		function cloneArray(target:Array<IndexE>):Array<IndexE> {
			var a:Array<IndexE> = [];

			for (e in target) {
				a.push({index: e.index, value: e.value});
			}

			return a;
		}
           var r:Ref<Array<Array<Int>>> = [];

		var p = new Permutation(keyArray, function(allArr) {
			trace(arr.length);
           //  var allArr=[[1,2,0,3,4,5]];
			for (e in allArr) {
				var _arr2 = cloneArray(arr);
				var _all2 = cloneArray(all);
				var _robot2 = cloneArray(robot);

            var arr2=[];
			var all2=[];
			var robot2=[];

			for(i in 0..._arr2.length){

				arr2[i]=_arr2[e[i]];
				robot2[i]=_robot2[e[i]];
				all2[i]=_all2[e[i]];
			}

				
				platformWin = 0;
				var currentZhuangIndex = e.indexOf(tZhuang);
				var zhuangBilingClone = zhuangBiling;
				for (curerntIndex in 0...e.length) {
					// 分2种情况。
					var letZhuangWin = false; // 让庄赢吗？

					var item1 = arr2[curerntIndex].value; // 要赔付
					var item2 = all2[curerntIndex].value * persent; // 实际百分比赔付；

					var extra = item1 - item2;

					trace('平台赔付 $extra');

					var extra2 = item2;

					trace('平台赚 $extra2');

					if (currentZhuangIndex > curerntIndex) {
						// 闲吃庄
						letZhuangWin = false;

						zhuangBilingClone -= item2;

						if(item2<item1){
							extra=item2-item1;
						}

						platformWin += extra;

						wl.push({
							ori: arr2[curerntIndex].value,
							win: item1,
							lost: 0,
							result: arr2[curerntIndex].value + item1,
							index: arr2[curerntIndex].index
						});
						arr2[curerntIndex].value += item1;
						trace('闲 ${arr2[curerntIndex].index + 1}  赢了  =$item2  现在是 ${arr2[curerntIndex]}  平台赢差价=$extra   平台总赢 $platformWin 庄 输了 ');
					} else if (currentZhuangIndex < curerntIndex) {
						// 庄吃闲

						letZhuangWin = true;

						var willWin:Float = item2 * (1 - choushui); // 赢钱
						var choushuiWin = item2 * choushui; // 平台抽水。
						var remainChoushui = item1 - item2;

						if (remainChoushui < 0) {
							trace("有问题？");
						}

						zhuangBilingClone += willWin;

						platformWin += remainChoushui + choushuiWin;

						wl.push({
							ori: arr2[curerntIndex].value,
							win: 0,
							lost: arr2[curerntIndex].value,
							result: 0,
							index: arr2[curerntIndex].index
						});
						Assert.assert(willWin + choushuiWin + remainChoushui + robot2[curerntIndex].value == all2[curerntIndex].value);
						arr2[curerntIndex].value = 0;

						trace('庄赢了 =$willWin   现在是 $zhuangBilingClone  平台抽水2%= $choushuiWin  平台总赢 $platformWin 闲 ${arr2[curerntIndex].index + 1}输了');
					} else {
						// 庄庄不对比
					}
					if (zhuangBilingClone < 0) {
						platformWin -= zhuangBilingClone;
					}
				}

				if (results.indexOf(platformWin) == -1) {
					results.push(platformWin);
					resultsArray.push(e);
				}
			}

			results.sort(function(a, b) {
				return a > b ? 1 : -1;
			});
			trace(results);
			trace(resultsArray);
		},r);
	}

	static public function main3(_arr:Array<Float>, _robot:Array<Float>, zhuangIndex:Int, choushui:Float, zhuangBiling:Float):Result {
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
		_arr[zhuangIndex] = 0;
		//	var robot:Array<Float> = [for (i in 0...6) 100 * Random.int(1, 10)];

		_robot[zhuangIndex] = 0;

		function add(ar:Array<Float>) {
			var sum:Float = 0;
			var i = 0;
			while (i < ar.length) {
				sum += ar[i];

				i++;
			}
			return sum;
		}
		function add2(ar:Array<IndexE>) {
			var sum:Float = 0;
			var i = 0;
			while (i < ar.length) {
				sum += ar[i].value;

				i++;
			}
			return sum;
		}

		_arr[zhuangIndex] = add(_arr);
		_robot[zhuangIndex] = add(_robot);

		var _all:Array<Float> = [];

		for (i in 0..._arr.length) {
			_all[i] = _arr[i] + _robot[i];
		}
		trace(_arr);
		// trace(robot);

		function print(arr:Array<IndexE>, name:String) {
			var labels = [];
			for (i in 0...arr.length) {
				labels.push({n: "闲", v: arr[i]});
			}

			trace('$name -' + Json.stringify(labels));
			return labels;
		}

		trace('庄下单  $zhuangBiling');
		var persent = Random.int(1, 10);
		var allBiling = _arr[zhuangIndex] + zhuangBiling;
		trace('平台一共收到 $allBiling 闲和 =${_arr[zhuangIndex]} 庄下单  $zhuangBiling ');

		var arr:Array<IndexE> = [];
		var robot:Array<IndexE> = [];
		var all:Array<IndexE> = [];
		for (i in 0..._arr.length) {
			arr.push({index: i, value: _arr[i]});
			robot.push({index: i, value: _robot[i]});
			all.push({index: i, value: _all[i]});
		}

		// trace('平台剩余 $remain');
		function sortR(a:IndexE, b:IndexE) {
			return return a.value > b.value ? -1 : 1;
		}
		function sortIndex(a:IndexE, b:IndexE) {
			return return a.index > b.index ? 1 : -1;
		}

		trace(all);

		var persent:Float = zhuangBiling / all[zhuangIndex].value; // 庄头百分比。

		trace('百分比= ${persent * 100}%');

		arr.sort(sortR);
		all.sort(sortR);
		robot.sort(sortR);
		arr.shift();
		all.shift();
		robot.shift();

		arr.sort(sortIndex);
		all.sort(sortIndex);
		robot.sort(sortIndex);

		var arr2 = arr.slice(0);
		var all2 = all.slice(0);
		var robot2 = robot.slice(0);
		print(arr2, "真人");
		print(robot2, "机器人");
		print(all2, "总和");

		trace('真人闲和=${arr[zhuangIndex]}  机器人闲和 =${robot[zhuangIndex]} 总和${all[zhuangIndex]}');

		var platformWin:Float = 0; // 平台总计赢。

		for (curerntIndex in 0...arr2.length) {
			// 分2种情况。

			var item1 = arr2[curerntIndex].value; // 要赔付
			var item2 = all2[curerntIndex].value * persent; // 实际百分比赔付；

			var index = curerntIndex + 1;

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
					ori: arr2[curerntIndex].value,
					win: 0,
					lost: arr2[curerntIndex].value,
					result: 0,
					index: arr2[curerntIndex].index
				});
				Assert.assert(willWin + choushuiWin + remainChoushui + robot2[curerntIndex].value == all2[curerntIndex].value);
				arr2[curerntIndex].value = 0;

				trace('庄赢了 =$willWin   现在是 $zhuangBiling  平台抽水2%= $choushuiWin  平台总赢 $platformWin 闲 ${arr2[curerntIndex].index + 1}输了');
			} else {
				letZhuangWin = false; // 闲赢。

				if (zhuangBiling > item2) {
					zhuangBiling -= item2;

					platformWin += extra;

					wl.push({
						ori: arr2[curerntIndex].value,
						win: item1,
						lost: 0,
						result: arr2[curerntIndex].value + item1,
						index: arr2[curerntIndex].index
					});
					arr2[curerntIndex].value += item1;
					trace('闲 ${arr2[curerntIndex].index + 1}  赢了  =$item2  现在是 ${arr2[curerntIndex]}  平台赢差价=$extra   平台总赢 $platformWin 庄 输了 ');
				} else {
					trace("不够分了怎么办？");
					letZhuangWin = true;

					var willWin:Float = item2 * (1 - choushui); // 赢钱
					var choushuiWin = item2 * choushui; // 平台抽水。
					var remainChoushui = item1 - item2;
					zhuangBiling += willWin;

					platformWin += remainChoushui + choushuiWin;
					wl.push({
						ori: arr2[curerntIndex].value,
						win: 0,
						lost: arr2[curerntIndex].value,
						result: 0,
						index: arr2[curerntIndex].index
					});
					arr2[curerntIndex].value = 0;
					trace('庄赢了 =$willWin   现在是 $zhuangBiling  平台抽水2%= $choushuiWin  平台总赢 $platformWin 闲 ${arr2[curerntIndex].index + 1}输了');
				}
			}
		}

		trace("闲最后的计算=" + arr2);

		trace("平台总收入=" + platformWin);

		trace("庄最后=" + zhuangBiling);

		Assert.assert(Math.abs(add2(arr2) + platformWin + zhuangBiling - allBiling) < 1);

		result.platformWin = platformWin;
		result.zhuangResult = zhuangBiling;
		result.allBiling = allBiling;

		return result;
	}
}
