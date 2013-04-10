package systems.movement;
import ash.core.Node;
import ash.tools.ListIteratingSystem;
import components.Gravity;
import components.Vel;

/**
 * ...
 * @author Glenn Ko
 */
class GravitySystem extends ListIteratingSystem<GravityNode>
{

	public function new() 
	{
		super(GravityNode, updateNode);
	}
	
	private function updateNode(node:GravityNode, time:Float):Void {
		node.gravity.update(node.vel, time);
	}
}


class GravityNode extends Node<GravityNode> {
	public var gravity:Gravity;
	public var vel:Vel;
	
	
}