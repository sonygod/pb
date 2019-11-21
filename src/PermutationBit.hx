package;

import haxe.io.Bytes;

using tink.CoreApi;

class PermutationBit {
	private var result = [];

	private var total:Int = 1;

	private var callBack:Array<Array<Int>>->Void;

	static var lastIndex:UInt = 0;
	static var len = 0;

	public function new(arr:Bytes, callBack:Bytes->Void, result:Ref<Bytes>) {
		var i = arr.length;
		len = i;
		var total = 1;
		while (i > 0) {
			total *= arr.get(i-1);
			i--;
		}
		//trace(total);
		total*=len;
		heapPermutation(arr, arr.length, total, callBack, result);
	}

	// public static function gen(arr:Array<UInt>, callBack:Array<Array<UInt>>->Void, result:Ref<Array<Array<Int>>>) {
	// 	var i = arr.length;
	// 	var total = 1;
	// 	while (i > 0) {
	// 		total *= i;
	// 		i--;
	// 	}
	// 	heapPermutation(arr, arr.length, total, callBack, result);
	// }
	// https://blog.csdn.net/shaoxiaohu1/article/details/50684782

	static function copyBytes(b:Bytes) {
		var a = Bytes.alloc(b.length);
		a.blit(0, b, 0, b.length);

		return a;
	}

	private function heapPermutation(a:Bytes, size:UInt, total:Int, callBack:Bytes->Void, result:Ref<Bytes>) {
		if (size == 1) {
			// trace(a);
			var b = copyBytes(a);
			result.value.blit(lastIndex, b, 0, b.length); // (copyBytes(b));
			lastIndex += len;
			if (lastIndex ==total) {
				callBack(result);
			}
		}

		for (i in 0...size) {
			var s=size-1;
			
			heapPermutation(a, s, total, callBack, result);

			// if (size % 2 == 1) {
			if (size & 1 == 1) {
				var temp = a.get(0); // a[0];
				// a[0] = a[size - 1];

				a.set(0, a.get(size - 1));
				//	a[size - 1] = temp;
				a.set(size  - 1, temp);
			} else {
				var temp = a.get(i); // a[i];
				// a[i] = a[size - 1];
				//	a[size - 1] = temp;

				a.set(i, a.get(size  - 1));

				a.set(size  - 1, temp);
			}
		}
	}
}
