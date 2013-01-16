package com.Tutorial.Effects 
{
	import org.flixel.*;
	import com.Tutorial.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Drip extends FlxSprite
	{
		private static const grav:int = 50;
		private static const dripTimer:Number = 0.75;
		
		private var timer:Number;
		
		private var emitter:FlxEmitter;
		
		public function Drip(X:int, Y:int) 
		{
			super(X,Y);
			
			timer = 0;
			
			emitter = new FlxEmitter(X, Y);
			var s:FlxSprite;
			emitter.setXSpeed(0, 0);
			emitter.setYSpeed(0, 0);
			var particles:uint = 20;
			for(var i:uint = 0; i < particles; i++)
			{
				s = new collideKillSprite();
				s.createGraphic(1, 1);
				s.color = 0x222222;
				s.alpha = 1;
				s.exists = false;
				emitter.add(s);
			}
			
			emitter.gravity = grav;
			
			emitter.start(false, dripTimer, 0);
		}
		
		override public function update():void 
		{
			super.update();
			emitter.update();
			if (PlayState.singleton.switchedGravaty)
				emitter.gravity *= -1;
		}
		
		override public function render():void 
		{
			emitter.render();
		}
		
	}

}