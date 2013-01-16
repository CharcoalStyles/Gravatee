package com.Tutorial.Effects 
{
	import org.flixel.*;
	import com.Tutorial.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Smoke extends FlxEmitter
	{
		
		private static const grav:int = -10;
		private static const dripTimer:Number = 0.2;
		
		private var timer:Number;
		
		public function Smoke(X:int, Y:int) 
		{
			super(X,Y);
			
			timer = 0;
			
			var s:FlxSprite;
			setXSpeed(-1, 1);
			setYSpeed(0, 0);
			var particles:uint = 50;
			for(var i:uint = 0; i < particles; i++)
			{
				s = new collideKillSprite();
				s.createGraphic(2, 2);
				s.color = 0xcccccc;
				s.alpha = 0.5;
				s.exists = false;
				add(s);
			}
			
			gravity = grav;
			
			start(false, dripTimer, 0);
		}
		
		override public function update():void 
		{
			super.update();
			if (PlayState.singleton.switchedGravaty)
				gravity *= -1;
		}
	}

}