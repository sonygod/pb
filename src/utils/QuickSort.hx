package utils;

import haxe.io.BytesData;
import haxe.io.Bytes;

@:expose
class QuickSort {
	var data:Bytes;
	var arr:ASBytes;

	var thread_num:Int;
	var thread:Int;
	var already:Int;
	var maxNum:Int;

	public function new(data:Bytes) {
		this.data = data;
		arr = new ASBytes(data);

		thread = 10;
		thread_num = cast data.length / (10 * thread);

		already = 0;

		maxNum = cast data.length / 10;
	}

	public function quickSort(begin:Int, end:Int) {
		if (begin < end) {
			var temp = arr[begin];
			var i = begin;
			var j = end;

			while (i < j) {
				while (i < j && arr[j] > temp)
					j--;

				arr[i] = arr[j];

				while (i < j && arr[i] <= temp)
					i++;

				arr[j] = arr[i];
			}

			arr[i] = temp;

			quickSort(begin, i - 1);

			quickSort(i + 1, end);
		} else
			return;
	}

	/**
	 *
	 * @param index
	 */
	public function work(index:Int, callBack:() -> Void) {
		quickSort(cast index * thread_num / 10, cast(index + 1) * thread_num / 10);
		already++;

		if (already == thread) {
			// meger();

			callBack();
		}
	}

	// 这个结果错误。
	public function shellSort() {
		var gap:Int;
		var temp:Int;
		var n = data.length;

		var array = arr;
		gap = cast n / 2;

		while (gap > 0) {
			for (i in gap...n) {
				var j = i - gap;

				while (j >= 0 && array[j] > array[j + gap]) {
					temp = array[j];
					array[j] = array[j + gap];
					array[j + gap] = temp;
				}
			}

			gap = cast gap / 2;
		}
	}

	public function insertSort(first:Int, last:Int) {
		// int temp, i, j;

		var array = arr;
		var temp = 0;
		//  for (i = first + 1; i <= last - 1; i++) {// 默认以第一个数为有序序列，后面的数为要插入的数。
		for (i in first + 1...last) {
			temp = array[i];
			var j = i - 1;
			while (j >= first && array[j] > temp) { // 从后进行搜索如果搜索到的数小于temp则该数后移继续搜索，直到搜索到小于或等于temp的数即可
				array[j + 1] = array[j];
				j--;
			}
			array[j + 1] = temp;
			// 打印每次排序结果
		}
	}

	public function meger() {
		var index:Array<Int> = [];
		var num = arr;

		var tmp_num = new ASBytes(Bytes.alloc(data.length));
		// for (int i = 0; i < thread; ++i)
		for (i in 0...thread) {
			index[i] = i * thread_num;
		}

		// for(long i = 0; i < MAX_NUM; ++i)
		for (i in 0...maxNum) {
			var min_index=0;
			var min_num = 255;
			// for(int j = 0; j < thread; ++j)
			var j:Int = 0;
			while (j < thread) {
				if ((index[j] < (j + 1) * thread_num) && (num[index[j]] < min_num)) {
					min_index = j;
					min_num = num[index[j]];
				}
				++j;
			}
			tmp_num[i] = num[index[min_index]];
			index[min_index]++;
		}

		return tmp_num;
	}

	public function megerSort(first:Int, last:Int) {
		// still not work.

		sortM(first, last);
	}

	private function sortM(L:Int, R:Int) {
		if (L == R) {
			return;
		}
		var mid = L + ((R - L) >> 1);
		sortM(L, mid);
		sortM(mid + 1, R);
		merge(L, mid, R);
	}

	function merge(L:Int, mid:Int, R:Int) {
		// int[] temp = new int[R - L + 1];
		var len = R - L + 1;
		var temp = new ASBytes(Bytes.alloc(R - L + 1));
		var i = 0;
		var p1 = L;
		var p2 = mid + 1;
		// 比较左右两部分的元素，哪个小，把那个元素填入temp中
		while (p1 <= mid && p2 <= R) {
			temp[i++] = arr[p1] < arr[p2] ? arr[p1++] : arr[p2++];
		}
		// 上面的循环退出后，把剩余的元素依次填入到temp中
		// 以下两个while只有一个会执行
		while (p1 <= mid) {
			temp[i++] = arr[p1++];
		}
		while (p2 <= R) {
			temp[i++] = arr[p2++];
		}
		// 把最终的排序的结果复制给原数组
		// for(i = 0; i < temp.length; i++) {
		for (i in 0...len)
			arr[L + i] = temp[i];
	}
}
