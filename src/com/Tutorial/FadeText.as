package com.Tutorial 
{
	import flash.accessibility.Accessibility;
	import org.flixel.*;
	
	public class FadeText extends FlxText
	{
		private var fadeTime:Number;
		
		public function FadeText(X:Number, Y:Number, Width:uint, Text:String=null) 
		{
			super(X, Y, Width, Text);
		}
		
		override public function update():void
		{
			if (fadeTime != 0)
			{
				alpha += FlxG.elapsed / fadeTime;
			}
			
			if (alpha >= 1)
			{
				alpha = 1;
				fadeTime = 0;
			}
			else if (alpha <= 0)
			{
				alpha = 0;
				fadeTime = 0;
			}
			
			super.update();
		}
		
		public function fadeIn(time:Number):void 
		{
			alpha = 0;
			fadeTime = time;
		}
		
		public function fadeOut(time:Number):void 
		{
			alpha = 1;
			fadeTime = -time;
		}
	}

}