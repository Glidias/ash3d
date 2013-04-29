package ;
import ash.core.Engine;
import ash.tick.FrameTickProvider;
import flash.display.Stage;
import systems.collisions.EllipsoidCollider;
import systems.movement.GravitySystem;
import systems.movement.SurfaceMovementSystem;

/**
 * ...
 * @author Glenn Ko
 */

class TheGame 
{
	private var engine:Engine;
	private var spawner:Spawner;
	private var stage:Stage;
	private var ticker:FrameTickProvider;

	
	
	public function new(stage:Stage) 
	{
		
		engine = new Engine();
		spawner = new Spawner(engine);
		this.stage = stage;
		

		// Craete ticker
		ticker = new FrameTickProvider(stage);
		ticker.add(engine.update);
		
		// Create systems
		EllipsoidCollider;
		SurfaceMovementSystem;
		GravitySystem;
		
				
		// Spawn starting entities
		
	
		// Start
		ticker.start(); 
	}

	
}