import openfl.events.EventDispatcher;

using tink.CoreApi;

class Dispatcher extends openfl.events.EventDispatcher {
	public function new<A>(target:A)
		super();
}

class PersonEvents {
	static public function on(target:Person, event:String, handler:Dynamic)
		target.about.get(Dispatcher).addEventListener(event, handler);

	static public function fire(target:Person, event:openfl.events.Event)
		target.about.get(Dispatcher).dispatchEvent(event);

	static public function off(target:Person, event:String, handler:Dynamic)
		target.about.get(Dispatcher).removeEventListener(event, handler);
}

class Person {
	public var name(default, null):String;
	public var about(default, null):Annex<Person>;

	public function new(name) {
		this.name = name;
		this.about = new Annex(this);
	}
}

class ObservationProtocol {
	public function new(person:Person) {}
}
