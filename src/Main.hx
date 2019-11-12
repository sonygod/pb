import haxe.Json;

using Array;
using Lambda;

@:expose
class Main {
	static function main() {
		var arr:Array<Float> = [5, 1, 1, 1, 1, 1]; // 闂叉姇娉ㄩ搴?
		var robot:Array<Float> = [5, 1, 1, 1, 1, 1]; // 链哄櫒浜烘姇娉ㄩ搴?

		var zhuangjiaIndex = 0;

		var zhuangjiaBiling = 1;

		var choushui = 2 / 100;

	

		PK10I.main(arr, robot, zhuangjiaIndex, choushui, zhuangjiaBiling);

		// SSC.main();

		//	AES_Test.test();
	}
}
