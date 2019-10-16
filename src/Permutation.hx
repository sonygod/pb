package;

using tink.CoreApi;

class Permutation {
	private var result = [];

	private var total:Int;
	private var callBack:Array<Array<Int>>->Void;

	public function new(arr:Array<UInt>, callBack:Array<Array<UInt>>->Void) {
		var i = arr.length;
		var total = 1;

		while (i > 0) {
			total *= i;
			i--;
		}

		//trace("total ="+total);
		this.total = total;
		this.callBack = callBack;

		heapPermutation(arr, arr.length);
	}

	// https://blog.csdn.net/shaoxiaohu1/article/details/50684782

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

	private function heapPermutation(a:Array<UInt>, size:UInt) {
		if (size == 1) {
			// trace(a);
			result.push(a.slice(0));
			if (result.length == total) {
				callBack(result);
			}
		}

		for (i in 0...size) {
			heapPermutation(a, size - 1);

			//if (size % 2 == 1) {
				if(size&1==1){
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
}
