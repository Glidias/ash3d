package systems.movement;
import ash.core.Node;
import ash.core.System;
import components.Bounce;
import components.Jump;
import components.MoveResult;
import components.Pos;
import components.Sticky;
import components.Vel;

/**
 * Handles entity's components like Bounce/Sticky and Jump against their MoveResults. NOTE: Bounce and Sticky shuld not be used at the same time! "Q" is for Quake-like physics.
 * This should be used before MovementSystem, unless  you aren't using MovementSystem but simply using QPhysics to drive everything.
 * 
 * @author Glenn Ko
 */
class QPhysicsSystem extends System
{

	public function new() 
	{
		
	}
	
}

///*
class QJumpNode extends Node<QJumpNode> {  // adjust jump lock according to MoveResult, so long as user is touching ground
	public var result:MoveResult;
	public var vel:Vel;
	public var jump:Jump;   // if jump state changes, some trigger is required! This can be handled by optional component query of JumpSignal, since change doesn't happen often.
}

class QStickyNode extends Node<QStickyNode> {  // if got collision, need to stick entity and set velocity to zero
	public var stick:Sticky;
	public var vel:Vel;
	public var result:MoveResult;  // if sticky occurs, some trigger should be required! <<< This can be handled by post-solve handler
}

class QBounceNode extends Node<QBounceNode> { // if got collision, adjust velocities based on bounce values.
	public var bounce:Bounce;
	public var vel:Vel;
	public var result:MoveResult;  // if bounce occurs, some trigger  should be  required! <<<This can be handled by post-solve handler
}
//*/

class ResultNode extends Node<ResultNode> { 
	// finalise move result by adjusting velocity in relation to current position for MovementSystem, or set position immediately if MovementSystem isn't available!
	public var result:MoveResult;    
	public var vel:Vel;				
	public var pos:Pos;
}

