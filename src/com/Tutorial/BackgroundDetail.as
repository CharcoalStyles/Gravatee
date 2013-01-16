package com.Tutorial 
{
	import org.flixel.*;
	
	public class BackgroundDetail extends FlxSprite
	{
		private var s:uint;
		
		private var count:Number = 0;
		
		public function BackgroundDetail(X:Number,Y:Number, S:int)
		{
			super(X, Y);
			s = FlxU.random() * S + S;
			count = FlxU.random() * s;
			createGraphic(s, s, 0x00FFFFFF * FlxU.random()+ 0xA0000000);
		}
		
		override public function update():void 
		{
			count += FlxG.elapsed;
			angle = count * 1024 / s;
			scale.x = ((Math.sin(count * 24 / s) +1) / 2) +0.25;
			scale.y = ((Math.cos(count * 24 / s) +1) / 2) +0.25;
			super.update();
		}
		
	}

}