package utils;

import haxe.MainLoop;
#if cs
import unityengine.Debug;
#end

class CustomTrace {
	public static function start() {
		// trace("

		//                           _oo8oo_
		//                          o8888888o
		//                          88" . "88
		//                          (| -_- |)
		//                         0/\  =  /0
		//                        ___/'==='\___
		//                      .' \\|     |// '.
		//                     / \\|||  :  |||// \
		//                    / _||||| -:- |||||_ \
		//                   |   | \\\  -  /// |   |
		//                   | \_|  ''\---/''  |_/ |
		//                   \  .-\__  '-'  __/-.  /
		//                 ___'. .'  /--.--\  '. .'___
		//              ."" '<  '.___\_<|>_/___.'  >' "".
		//             | | :  `- \`.:`\ _ /`:.`/ -`  : | |
		//             \  \ `-.   \_ __\ /__ _/   .-` /  /
		//         =====`-.____`.___ \_____/ ___.`____.-`=====
		//                           `=---=`

		//        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		//            佛祖保佑      永不宕机     永无bug

		// ");
	}

	static var print:Bool = true;

	public static function close(_close:Bool) {
		print = _close;
	}

	public static function init() {
		#if cs
		var oldTrace = Debug.Log;
		haxe.Log.trace = function(v:Dynamic, ?pos:haxe.PosInfos) {
			oldTrace("[" + Date.now().toString() + "] " + Std.string(v) + Std.string(pos));
		};
		#else
		var oldTrace = haxe.Log.trace;
		haxe.Log.trace = function(v:Dynamic, ?pos:haxe.PosInfos) {
			if (print)
				oldTrace("[" + DateTools.format(Date.now(), "%Y-%m-%d_%H:%M:%S") + "] " + Std.string(v), pos);
		};
		#end
	}
}
