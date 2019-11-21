package;

import haxe.io.Bytes;
using tink.CoreApi;

class Permutation {
	private var result = [];

	private var total:Int = 1;

	private var callBack:Array<Array<Int>>->Void;

	public function new(arr:Array<UInt>, callBack:Array<Array<UInt>>->Void, result:Ref<Array<Array<Int>>>) {
		var i = arr.length;
		var total = 1;
		while (i > 0) {
			total *= i;
			i--;
		}

		heapPermutation(arr, arr.length, total, callBack, result);
	}

	public static function gen(arr:Array<UInt>, callBack:Array<Array<UInt>>->Void, result:Ref<Array<Array<Int>>>) {
		var i = arr.length;
		var total = 1;
		while (i > 0) {
			total *= i;
			i--;
		}

		heapPermutation(arr, arr.length, total, callBack, result);
	}

	// https://blog.csdn.net/shaoxiaohu1/article/details/50684782


	static function copyBytes(b:Bytes){

		var a=Bytes.alloc(b.length);
		a.blit(0,b,0,b.length);

		return a;
	}

	private static function heapPermutation(a:Array<UInt>, size:UInt, total:Int, callBack:Array<Array<Int>>->Void, result:Ref<Array<Array<Int>>>) {
		if (size == 1) {
			// trace(a);
			result.value.push(a.copy());
			if (result.value.length == total) {
				callBack(result);
			}
		}

		for (i in 0...size) {
			heapPermutation(a, size - 1, total, callBack, result);

			// if (size % 2 == 1) {
			if (size & 1 == 1) {
				var temp = a[0];
				a[0] = a[size - 1];
				a[size - 1] = temp;
			} else {
				var temp = a[i];
				a[i] = a[size - 1];
				a[size - 1] = temp;
			}
		}
	}

	/**
	 * 这里求出每个递归。
	 * @param data
	 * @param n
	 * @param outLen
	 * @param startIndex
	 * @param m
	 * @param arr
	 * @param arrIndex
	 * @param result
	 */
	public static function computeAllChoices(data:Ref<Array<Int>>, n:Int, outLen:Int, startIndex:Int, m:Int, arr:Array<Int>, arrIndex:Int,
			result:Ref<Array<Array<Int>>>) {
		if (m == 0) {
			trace("finish" + arr);

			result.value.push(arr);

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
}
