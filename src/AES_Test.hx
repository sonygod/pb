package;

import haxe.crypto.Aes;
import haxe.io.Bytes;
import haxe.crypto.mode.*;
import haxe.crypto.padding.*;
import Random;
@:expose
class AES_Test {
	public static function test() {
		var key1 = Random.string(64);
		var iv1 = Random.string(32);
		var content = "123789";
		var eKey = encrypt(content, key1, iv1);

		trace('before=' + eKey);

		var data2 = decrypt(eKey, key1, iv1);

		trace('after=' + data2);
	}

	public static function encrypt(content:String, key:String, iv:String):String {
		var aes:Aes = new Aes();
		var key = Bytes.ofHex(key);
		var text = Bytes.ofString(content);
		var iv:Bytes = Bytes.ofHex(iv);

		aes.init(key, iv);

		// Encrypt
		var data = aes.encrypt(Mode.CTR, text, Padding.NoPadding);

		return data.toHex();
	}

	public static function decrypt(content:String, key:String, iv:String):String {
		var aes:Aes = new Aes();
		var key = Bytes.ofHex(key);

		var iv:Bytes = Bytes.ofHex(iv);

		aes.init(key, iv);

		var to = Bytes.ofHex(content);
		// Encrypt
		var data = aes.decrypt(Mode.CTR, to, Padding.NoPadding);
		trace("Decrypted text: " + data);

		return data.toString();
	}
}
