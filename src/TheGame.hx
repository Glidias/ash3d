package ;
import ash.core.Engine;
import ash.tick.FrameTickProvider;
import flash.display.Stage;

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

				
		// Spawn starting entities
		
	
		// Start
		ticker.start(); 
	}

	
}