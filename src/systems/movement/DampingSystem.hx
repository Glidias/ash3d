package systems.movement;
import ash.core.Node;
import ash.tools.ListIteratingSystem;
import components.Damp;
import components.Gravity;
import components.Vel;

/**
 * ...
 * @author Glenn Ko
 */
class DampingSystem extends ListIteratingSystem<DampNode>
{

	public function new() 
	{
		super(DampNode, updateNode);
	}
	
	private function updateNode(node:GravityNode, time:Float):Void {
		node.damp.update(node.vel, time);
	}
}


class DampNode extends Node<DampNode> {
	public var damp:Damp;
	public var vel:Vel;
}