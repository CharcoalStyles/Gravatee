package com.Tutorial.Effects 
{
	import org.flixel.*;
	import com.Tutorial.PlayState;
	
	/**
	 * ...
	 * @author ...
	 */
	public class collideKillSprite extends FlxSprite
	{		
		public function collideKillSprite(X:Number = 0, Y:Number = 0, SimpleGraphic:Class = null) 
		{
			super(X, Y, SimpleGraphic);
		}
		
		override public function update():void 
		{
			super.update();
			if (PlayState.singleton.switchedGravaty)
				velocity.y *= -1;
			
		}
		override public function hitBottom(Contact:FlxObject, Velocity:Number):void 
		{
			kill();
		}
		
		override public function hitLeft(Contact:FlxObject, Velocity:Number):void 
		{
			kill();
		}
		
		override public function hitRight(Contact:FlxObject, Velocity:Number):void 
		{
			kill();
		}
		
		override public function hitTop(Contact:FlxObject, Velocity:Number):void 
		{
			kill();
		}
	}

}