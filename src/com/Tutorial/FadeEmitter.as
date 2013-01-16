package com.Tutorial 
{
	import org.flixel.*;
	import flash.utils.getTimer;
	
	public class FadeEmitter extends FlxEmitter
	{
		private var dbug2:int
		
		public function FadeEmitter(X:Number=0, Y:Number=0) 
		{
			super();
		}
		/**
		 * This function can be used both internally and externally to emit the next particle.
		 */
		override public function emitParticle():void
		{
			_counter++;
			var s:FlxSprite = members[_particle] as FlxSprite;
			s.visible = true;
			s.exists = true;
			s.active = true;
			s.x = x - (s.width>>1) + FlxU.random()*width;
			s.y = y - (s.height>>1) + FlxU.random()*height;
			s.velocity.x = minParticleSpeed.x;
			if(minParticleSpeed.x != maxParticleSpeed.x) s.velocity.x += FlxU.random()*(maxParticleSpeed.x-minParticleSpeed.x);
			s.velocity.y = minParticleSpeed.y;
			if(minParticleSpeed.y != maxParticleSpeed.y) s.velocity.y += FlxU.random()*(maxParticleSpeed.y-minParticleSpeed.y);
			s.acceleration.y = gravity;
			s.angularVelocity = minRotation;
			if(minRotation != maxRotation) s.angularVelocity += FlxU.random()*(maxRotation-minRotation);
			if(s.angularVelocity != 0) s.angle = FlxU.random()*360-180;
			s.drag.x = particleDrag.x;
			s.drag.y = particleDrag.y;
			s.visible = true;
			s.alpha = 1;
			_particle++;
			if(_particle >= members.length)
				_particle = 0;
			s.onEmit();
		}
		
		/**
		 * Internal function that actually goes through and updates all the group members.
		 * Overridden here to remove the position update code normally used by a FlxGroup.
		 */
		override protected function updateMembers():void
		{
			dbug2 = getTimer();
			var s:FlxSprite;
			var l:uint = members.length;
			for(var i:uint = 0; i < l; i++)
			{
				s = members[i] as FlxSprite;
				if ((s != null) && s.exists && s.active)
				{
					s.alpha -= (1 / delay) * FlxG.elapsed;
					s.update();
				}
			}
		}
	}

}