package systems;

/**
 * @author richard
 */
class SystemPriorities
{
    public static inline var preUpdate:Int = 1;
    public static inline var update:Int = 2;
    public static inline var move:Int = 3;
	public static inline var postMove:Int = 4;
    public static inline var resolveCollisions:Int = 5;
    public static inline var stateMachines:Int = 6;
    public static inline var animate:Int = 7;
    public static inline var render:Int = 8;
	 public static inline var postRender:Int = 9;
}
