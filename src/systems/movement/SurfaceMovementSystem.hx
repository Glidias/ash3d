package systems.movement;

import ash.core.Engine;
import ash.core.Node;
import ash.core.NodeList;
import ash.core.System;
import ash.tools.ListIteratingSystem;
import components.CollisionResult;
import components.controller.SurfaceMovement;
import components.MoveResult;
import components.Pos;
import components.Rot;
import components.Vel;

/**
 * Handles surface movement of all entities.
 * 
 * @author Glenn Ko
 */
class SurfaceMovementSystem extends System
{
	public var nodeList:NodeList<SurfaceMovementNode>;
	
	public function new() 
	{
		super();
	}	
	
	
	override public function addToEngine(engine:Engine):Void {
		nodeList = engine.getNodeList(SurfaceMovementNode);
	}
	
	override public function update(time:Float):Void {
		var n:SurfaceMovementNode = nodeList.head;
		
		while (n != null) {
			
			 if (n.collision.gotCollision) {
				n.movement.update(time,  n.rot, n.vel, ( n.collision.flags & CollisionResult.FLAG_MAX_GROUND_NORMAL )!=0 ? n.collision.maximum_ground_normal : null);
			}
			
			n = n.next;
			
		}
	}

}



class SurfaceMovementNode extends Node<SurfaceMovementNode> {
	
	public var vel:Vel;
	public var rot:Rot;
	public var movement:SurfaceMovement;
	public var collision:CollisionResult;  // this is used to determine whther person is on surface or not..
	
}


