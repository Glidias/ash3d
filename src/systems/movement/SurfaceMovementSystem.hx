import ash.core.NodeList;
import ash.core.System;
import components.CollisionResult;
import components.controller.SurfaceMovement;
import components.MoveResult;
import components.Pos;
import components.Rot;

/**
 * Handles surface movement of all entities.
 * 
 * @author Glenn Ko
 */
class SurfaceMovementSystem extends System
{
	public function new() 
	{
		

	}	
	
	

	
	override public function update(time:Float):Void {
		
		
	}
}



class SurfaceMovementNode extends NodeList<SurfaceMovementNode> {
	
	public var vel:Vel;
	public var rot:Rot;
	public var movement:SurfaceMovement;
	public var collision:CollisionResult;  // this is used to determine whther person is on surface or not..
	
}


