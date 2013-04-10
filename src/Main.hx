package ;



import #if(nme)nme#elseif(flash)flash#end.display.Sprite;
import #if(nme)nme#elseif(flash)flash#end.events.Event;
import #if(nme)nme#elseif(flash)flash#end.Lib;
import #if(nme)nme#elseif(flash)flash#end.media.Sound;
import #if(nme)nme#elseif(flash)flash#end.net.URLRequest;
import #if(nme)nme#elseif(flash)flash#end.ui.Keyboard;
import flash.Lib;
import systems.collisions.EllipsoidCollider;

/**
 * ...
 * @author Glenn Ko
 */

class Main extends Sprite 
{
	static private var _game:TheGame;

	
	public function new() 
	{
		super();
		
		EllipsoidCollider;
	}
	

	


	
	static public function main() 
	{
		_game = new TheGame( Lib.current.stage );
	}
	
}
