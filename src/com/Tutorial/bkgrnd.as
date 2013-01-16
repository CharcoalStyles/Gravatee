package com.Tutorial 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class bkgrnd extends FlxSprite
	{
		[Embed(source = '../../data/bkgrnd.png')] public static var tBkgrnd:Class;
		
		public function bkgrnd(X:Number = 0, Y:Number = 0, SimpleGraphic:Class = null) 
		{
			super(X, Y, SimpleGraphic);
			loadGraphic(tBkgrnd, true, true, 1600,1007);
			
		}
		
	}

}