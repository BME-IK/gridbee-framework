package gridbee.core.iface;
import gridbee.js.EventTarget;
import gridbee.js.Event;

/**
 * ...
 * @author tbur
 */

interface Event 
{
	public var type : String;
}
 
// http://www.whatwg.org/specs/web-apps/current-work/multipage/comms.html#event-definitions-1
interface MessageEvent implements Event
{
	public var data : Dynamic;
	public var origin : String;
	public var lastEventId : String;
	//public var source : Dynamic;
	//public var ports : Dynamic;
}

// http://www.whatwg.org/specs/web-workers/current-work/#runtime-script-errors
interface ErrorEvent implements Event
{
	public var message : String;
	public var filename : String;
	public var lineno : Int;
}

interface EventTarget
{
	public function addEventListener(type : String, listener : Dynamic, useCapture : Bool = false) : Void;
	public function removeEventListener(type : String, listener : Dynamic, useCapture : Bool = false) : Void;
	public function dispatchEvent(event : Event) : Bool;
}

// http://www.w3.org/TR/progress-events/
interface ProgressEvent implements Event {	
	public var lengthComputable: Bool;
	public var loaded : Int;
	public var total : Int;
}


interface Worker implements EventTarget
{
	public function addEventListener(type : String, listener : Dynamic, useCapture : Bool = false) : Void;
	public function removeEventListener(type : String, listener : Dynamic, useCapture : Bool = false) : Void;
	public function dispatchEvent(event : Event) : Bool;	

	public function setOnerror(func : ErrorEvent -> Void) : Void;
	public function setOnmessage(func : MessageEvent -> Void) : Void;	
	
	// TODO: messagePort
	public function postMessage(message : Dynamic) : Void;
	public function terminate() : Void;
}