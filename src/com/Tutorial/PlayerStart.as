package com.Tutorial 
{
	import org.flixel.FlxSprite;
	
	
	public class PlayerStart extends FlxSprite
	{
		
		public static var xPos:int;
		public static var yPos:int;
		
		public function PlayerStart(X:Number = 0, Y:Number = 0) 
		{
			createGraphic(1, 1, 0x00ffffff);
			xPos = X;
			yPos = Y;
		}
		
	}

}