package;

using tink.CoreApi;
// using Person;
import Assert;
class TestAnnex {
	public static function main() {
		// var johnDoe = new Person("John Doe");
		// johnDoe.about.get(ObservationProtocol); // gives us the same ...
		// johnDoe.about.get(ObservationProtocol); // ... protocol every time
		// johnDoe.on("died", function(_) trace("oh no!"));
		// johnDoe.fire(new openfl.events.Event("died")); // traces "oh no!"
		

			var counter = 0;
		function make(fail:Bool)
			return Future.async(function(cb) {
				var id = counter++;
				trace('counter =$counter');
				cb(if (fail) Failure(new Error('error')) else Success(id));
			}, true);

		counter = 0;
		var p = Promise.inParallel([for (i in 0...10) make(i>5)], true);
		Assert.assert(0== counter);
      trace("ready?");
		p.handle(function(o) {
			
			Assert.assert(!o.isSuccess());
			//trace(o.sure());

		});

		trace(counter);
		
		
	}
}
