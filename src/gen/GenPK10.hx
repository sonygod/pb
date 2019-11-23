package gen;

import sys.io.File;
import PermutationBit;
import haxe.io.Bytes;

using tink.CoreApi;

@:expose
class GenPK10 {
	public static function main() {}

	public static function gen(path:String) {
		var max = 10;

		var current = [for (i in 0...max) (i + 1)];
		var b = Bytes.alloc(max);

		for (i in 0...max) {
			b.set(i, current[i]);
		}

		var total = 1;
		var arr = [for (ii in 0...max) ii + 1];
		var i = arr.length - 1;

		while (i > 0) {
			var v = arr[i];
			total *= v;
			i--;
		}

		var kkk = Bytes.alloc(total * max);
		var result:Ref<Bytes> = Bytes.alloc(total * max);

		new PermutationBit(b, function(d) {
			File.saveBytes(path, d);
		}, result);
	}

	// 生成龙虎玩法。

	public static function read(path:String) {
		var f = File.read(path, true);

		var bytes = f.readAll();

		var len = bytes.length / 10;

		trace('一共有 $len 组数组');

		return bytes;
	}

	public static function genType(bytes:Bytes,path:String) {
		var max:Int = 10;
		var max2:Int = 12;
		var len:Int = cast bytes.length / max;

		// 号码	龙虎	            冠亚和	牛牛
		// 0xa0,0xb0,0xc0,0xd0	   3   	0x11,0x22,0x33,0x44,0x55

		var before = Bytes.alloc(max);
		var eachB = Bytes.alloc(max2);

		var result = Bytes.alloc(max2 * len);

		for (i in 0...len) {
			var from = i * max;
			var to = (i + 1) * max;
			before.blit(0, bytes, from, max);
			eachB.set(0, before.get(0) > before.get(9) ? 0xa1 : 0xa0); // 第1位龙虎
			eachB.set(1, before.get(1) > before.get(8) ? 0xa1 : 0xa0); // 第2位龙虎
			eachB.set(2, before.get(2) > before.get(7) ? 0xa1 : 0xa0); // 第3位龙虎
			eachB.set(3, before.get(3) > before.get(6) ? 0xa1 : 0xa0); // 第4位龙虎
			eachB.set(4, before.get(3) > before.get(5) ? 0xa1 : 0xa0); // 第5位龙虎
			//---------------------------------------------------------------------
			eachB.set(5, before.get(0) + before.get(1)); // 冠亚和
			//-----------------------------------------------------------------------------
			eachB.set(6, NiuNiu.check_NiuPoint([for (i in 0...5) (before.get(i))])); // 牛牛
			eachB.set(7, NiuNiu.check_NiuPoint([for (i in 1...6) (before.get(i))])); // 牛牛
			eachB.set(8, NiuNiu.check_NiuPoint([for (i in 2...7) (before.get(i))])); // 牛牛

			eachB.set(9, NiuNiu.check_NiuPoint([for (i in 3...8) (before.get(i))])); // 牛牛
			eachB.set(10, NiuNiu.check_NiuPoint([for (i in 4...9) (before.get(i))])); // 牛牛
			eachB.set(11, NiuNiu.check_NiuPoint([for (i in 5...10) (before.get(i))])); // 牛牛
           //------------------------------------------------------------------------------------
            var from2=i*max2;
            var to=(i+1)*max2;

            result.blit(from2,eachB,0,max2);


		}
          File.saveBytes(path,result);
 
	}
}
