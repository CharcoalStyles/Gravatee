package com.Tutorial 
{
	import org.flixel.*;
	public class PlayerStateFrame
	{
		public var bodX:Number;
		public var bodY:Number;
		public var bodAnimFrame:uint;
		
		public function PlayerStateFrame(player:Player) 
		{
			bodX = player.x;
			bodY = player.y;
			bodAnimFrame = player.frame;
		}
	}

}