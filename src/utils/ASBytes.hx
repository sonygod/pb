package utils;
import haxe.io.Bytes;
@:expose
abstract ASBytes(Bytes) {
	public function new(s)
		this = s;

	@:arrayAccess function get(k:Int) {
		return this.get(k);
	}

	@:arrayAccess function set(k:Int, v:Int) {
		return this.set(k, v);
	}
	 @:op(a.b) public function length(length:String):Int{

               return this.length;
	 }
       
}