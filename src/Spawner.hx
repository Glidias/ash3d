package ;
import ash.core.Engine;
import ash.core.Entity;

/**
 * ...
 * @author Glenn Ko
 */

class Spawner 
{
	public var engine:Engine;
		
	public function new(engine:Engine) 
	{
		this.engine = engine;	
	}

	
	
	public static function getDestructor(entity:Entity, engine:Engine):Void->Void {
		return new Destructor(entity, engine).destroy;
	}

}




class Destructor {
	public var engine:Engine;
	public var entity:Entity;
	
	public function new(entity:Entity, engine:Engine):Void {
		this.engine = engine;
		this.entity = entity;
	}
	public function destroy():Void {
		engine.removeEntity(entity);
	}
	
}