import gen.GenKLSFBytes;

class CustomTrace {
	public static function init() {
		var oldTrace = haxe.Log.trace;
		haxe.Log.trace = function(v:Dynamic, ?pos:haxe.PosInfos) {
			oldTrace("[" + Date.now().toString() + "] " + Std.string(v), pos);
		};
	}
}

class KLSFGEN {
	public static function main() {
		CustomTrace.init();
		GenKLSFBytes.genMulThread();
	}
}
