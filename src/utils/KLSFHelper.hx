package utils;

import haxe.io.Bytes;

class KLSFHelper {
	/**
	 * 任选2,不按顺序。
	 * @param data
	 * @param target
	 * @param continuous  是否按顺序。
	 */
	public function renXuanGroup(data:Bytes, target:Bytes, continuous:Bool) {
		// var arr = [];
		var total = target.length;
		var continusBytes = Bytes.alloc(total);

		var len = data.length;
		var len2 = target.length;
		var march = 0;
		for (i in 0...len) {
			var v = data.get(i);

			for (j in 0...target.length) {
				if (v == target.get(i)) {
					march++;
					continusBytes.set(continusBytes.length, i);
				}
			}
		}
		if (!continuous) {
			return march == total;
		}

		if (march == total) {
			for (i in 0...continusBytes.length) {
				if (!((i + 1) > continusBytes.length)) {
					if (continusBytes.get(i) + 1 != continusBytes.get(i + 1)) {
						return false;
					}
				}
			}
			return true;
		}

		return false;
	}
}
