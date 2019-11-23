import sys.FileSystem;
import gen.GenPK10;
import haxe.io.Bytes;

class PK10Gen {
	public static function main() {
		if (!FileSystem.exists('./pk10.data')) {
			trace("准备开始创建。");
			gen();
		} else {
			read();
		}
	}

	@:keep
	public static function gen() {
		var d = Date.now().getTime();
		GenPK10.gen("./pk10.data");
		var bytes = GenPK10.read("./pk10.data");
		GenPK10.genType(bytes, "./pk10v.data");
		trace("生成数据需要时间=" + (Date.now().getTime() - d));
	}

	@:keep
	public static function read() {
		var max = 10;
		var max2 = 12;
		var key = GenPK10.read("./pk10.data");
		var value = GenPK10.read("./pk10v.data");

		var len:Int = cast key.length / max;

		var keyB = Bytes.alloc(max);//初始化 这里记录每个子数组 ，例如[1,2,3,4,5,6,7,8,9,10]
		var valueB = Bytes.alloc(max2);;//初始化 这里记录每子字数组 ，例如[A0,A0,A0,A0,A0,03,05,FF,FF,00,05,FF]//记录龙虎牛牛等。

		trace("开始计算遍历时间");
		var d = Date.now().getTime();

		for (i in 0...len) {
			var from = i * max;
			var to = (i + 1) * max;

			var from2 = i * max2;
			var to2 = (i + 1) * max2;

			keyB.blit(0, key, from, max);//从data文件里面拷贝到 子数组填满

			for (k in 0...max) {
				keyB.get(k)&1;  //遍历子数组  例如[1,2,3,4,5,6,7,8,9,10] ，求双用 &1==0  不要用%2==0;
			}

			valueB.blit(0, value, 0, max2);

			for (v in 0...max2) {
				valueB.get(v)&1; //遍历子数组  获取牛牛等。
			}
		}

		var d2 = Date.now().getTime();

		trace("遍历时间" + (d2 - d));
	}
}
