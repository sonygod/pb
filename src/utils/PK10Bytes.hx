	package utils;

	import haxe.io.Bytes;

	abstract PK10Bytes(Bytes) from Bytes to Bytes {
		
		public function new(s:Bytes) {
			this = s;
		}

		@:arrayAccess function get(k:Int):PK10Bytes {
			var out = Bytes.alloc(10);
			out.blit(0, this, k * 10, 10);
			return cast out;
		}

		@:arrayAccess function set(k:Int, v:Bytes) {
			return this.blit(k * 10, v, 0, 10);
		}

		@:op(A < B) static function lessThan(a:PK10Bytes, b:PK10Bytes):Bool {
			return a.getSum() < b.getSum();
		}

		@:op(A <= B) static function lessThan2(a:PK10Bytes, b:PK10Bytes):Bool {
			return a.getSum() <= b.getSum();
		}

		@:op(A > B) static function bigThan(a:PK10Bytes, b:PK10Bytes):Bool {
			return a.getSum() > b.getSum();
		}

		@:op(A >= B) static function bigThan2(a:PK10Bytes, b:PK10Bytes):Bool {
			return a.getSum() >= b.getSum();
		}

		@:op(A == B) static function equal(a:PK10Bytes, b:PK10Bytes):Bool {
			return a.getSum() == b.getSum();
		}

		public function getSum():Int {
			var sum = 0;
			for (i in 0...10) {
				sum += this.get(i);
			}

			return sum;
		}
	}
