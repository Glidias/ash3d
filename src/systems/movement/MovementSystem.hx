package systems.movement;
import ash.core.Node;
import ash.tools.ListIteratingSystem;
import components.AABB;
import components.Pos;
import components.Vel;

/**
 * 
 * @author Glenn Ko
 */
class MovementSystem extends ListIteratingSystem<MovementNode>
{
	public function new() 
	{
		super(MovementNode, updateNode);
	}
	private inline function updateNode(node:MovementNode, time:Float):Void {
		node.pos.x += (node.vel.x * time);
		node.pos.y += (node.vel.y * time);
		node.pos.z += (node.vel.z * time);
	}
}

class MovementNode extends Node<MovementNode> {
	public var pos:Pos;
	public var vel:Vel;
}