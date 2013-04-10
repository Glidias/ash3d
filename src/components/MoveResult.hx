package components;
import ash.core.Entity;
import systems.collisions.CollisionEvent;
import util.geom.XYZ;

/**
 * A component that is specific to each entity instance, storing it's unique result for any collisions that might occur.
 * @author Glenn Ko
 */
class MoveResult implements XYZ
{
	public var collisions:CollisionEvent;  // any collisions that occur if any
	
	// Final position of move
	public var x:Float;
	public var y:Float;
	public var z:Float;
	
	// Collision Event handlers
	// If no handler is used, default behaviour occurs.
	
	public var preSolve:MoveResult->Vel->Entity->Bool; 
	//   return  true to preventDefault behaviour, otherwise, any behaviour which the system will use by default (depending on entity's components) will occur. This can be used to overwrite
	// default collision behaviour of any entity.
	
	public var postSolve:MoveResult->Vel->Pos->Entity->Void;  
	//  after physical collision has been solved by given system and entity has moved to intended position, any further action can occur here. 

	public function new() 
	{
		
	}
	
	public inline function dispose():Void {
		while ( collisions) collisions = collisions.next;
	}
	
	
	
}