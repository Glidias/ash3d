package components.controller;
import util.geom.Vec3;
import util.geom.Vec3Utils;

/**
 * Component with prescriptive System macro-implementation below (inlinable).
 * Supports your basic move forward/back and strafe/back actions.
 * @author Glenn Ko
 */
class SurfaceMovement 
{
	// State settings
	public var WALK_SPEED:Float;
	public var WALKBACK_SPEED:Float;
	public var STRAFE_SPEED:Float;

	// State for thing
	// delta walk/strafe state (-1 for backwards/left, 0 for neither direction, 1 for forwards/right)
    private var walk_state:Int; 
	private var strafe_state:Int;
	
	public static inline var WALK_FORWARD:Int = 1;
	public static inline var WALK_STOP:Int = 0;
	public static inline var WALK_BACK:Int = -1;

	public static inline var STRAFE_LEFT:Int = -1;
	public static inline var STRAFE_STOP:Int = 0;
	public static inline var STRAFE_RIGHT:Int = 1;
	
	// Normalized forward direction along surface
	public var forwardVec:Vec3;
	public var rightVec:Vec3;
	public var friction:Float;
	
	

	public function new() 
	{
		walk_state = 0;
		strafe_state = 0;
		forwardVec = new Vec3();
		rightVec = new Vec3();
		friction = .25;
		
		setWalkSpeeds(16);
		setStrafeSpeed(10);
	}
	
	inline public function setWalkSpeeds(forwardSpeed:Float, backspeed:Float = -1):Void {
		WALK_SPEED = forwardSpeed;
		WALKBACK_SPEED = (backspeed != -1) ? backspeed : forwardSpeed; 
	}
	inline public function setStrafeSpeed(val:Float):Void {
		STRAFE_SPEED = val;
	}
	inline public function setAllSpeeds(val:Float):Void {
		WALK_SPEED = val;
		WALKBACK_SPEED  = val;
		STRAFE_SPEED = val;
	}
		
	inline public function respond_move_forward():Void {
		walk_state = 1;
	}
	inline public function respond_move_back():Void {
		walk_state = -1;
	}
	inline public function respond_move_stop():Void {
		walk_state = 0;
	}
	
	inline public function respond_strafe_left():Void {
		strafe_state = -1;
	}
	inline public function respond_strafe_right():Void {
		strafe_state = 1;
	}
	inline public function respond_strafe_stop():Void {
		strafe_state = 0;
	}

	
	inline public function update(time:Float,rotation:Vec3, velocity:Vec3, ground_normal:Vec3 = null):Void {
		updateWith(time, rotation,velocity, walk_state, strafe_state, forwardVec, rightVec, WALK_SPEED, WALKBACK_SPEED, STRAFE_SPEED, friction, ground_normal);
	}
	
	public static inline function updateWith(time:Float, rotation:Vec3, velocity:Vec3, walkState:Int, strafeState:Int, forwardVec:Vec3, rightVec:Vec3, WALK_SPEED:Float, WALKBACK_SPEED:Float, STRAFE_SPEED:Float, friction:Float=.25, ground_normal:Vec3 = null):Void {
		var multiplier:Float;
		
		if (ground_normal != null) { // can walk on ground
			velocity.scale(friction);  
			/*
			 * Math.cos(this.thingBase.azimuth) * Math.cos(this.thingBase.elevation), Math.sin(this.thingBase.azimuth) * Math.cos(this.thingBase.elevation)
			 */
			forwardVec.x = -Math.sin(rotation.z); //Math.cos(rotation.z) * Math.cos(rotation.y);  // frm rotation.z azimith
			forwardVec.y = Math.cos(rotation.z);//Math.sin(rotation.z) * Math.cos(rotation.y); // frm rotation.x pitch.  //* Math.cos(rotation.x)
			forwardVec.z = 0;
			if (forwardVec.dotProduct(ground_normal) > 0) {
				//forwardVec.removeComponent(ground_normal);
				multiplier = axis.x * ground_normal.x + axis.y * ground_normal.y + axis.z * ground_normal.z;
				forwardVec.x -= axis.x * multiplier;
				forwardVec.y -= axis.y * multiplier;
				forwardVec.z -= axis.z * multiplier;
			}
			forwardVec.normalize();
			
			if (walkState != 0 ) {
				multiplier = (walkState != WALK_BACK) ? WALK_SPEED : -WALKBACK_SPEED;
				velocity.x += forwardVec.x * multiplier;
				velocity.y += forwardVec.y * multiplier;
				velocity.z += forwardVec.z * multiplier;
	
			}
			
			Vec3Utils.writeCross(forwardVec, ground_normal, rightVec);
			rightVec.normalize();
			if (strafeState != 0) {
				multiplier = strafeState != STRAFE_LEFT ? STRAFE_SPEED : -STRAFE_SPEED;
				velocity.x += rightVec.x * multiplier;
				velocity.y += rightVec.y * multiplier;
				velocity.z += rightVec.z * multiplier;
			}
		}
	}

}