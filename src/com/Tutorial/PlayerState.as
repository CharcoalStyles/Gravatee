package com.Tutorial 
{
	import org.flixel.*;
	public class PlayerState
	{		
		public static var body:FlxSprite;
		
		private var playerStateFrames:Array;
		
		public var color:uint;
		
		public function PlayerState() 
		{
			playerStateFrames = new Array();
		}
		
		public function push(inPlayerStateFrame:PlayerStateFrame):void 
		{
			playerStateFrames.push(inPlayerStateFrame);
		}
		
		public static function load():void 
		{
			body = new FlxSprite(-100, -100);
			body.loadGraphic(Player.tBody, true, true, 16, 16);
			body.alpha = 0.33;
		
			body.addAnimation("Walkrn", [0, 1], 40);
			body.addAnimation("Walkln", [2, 3], 40);
			body.addAnimation("wallHumpingln", [4]);
			body.addAnimation("wallHumpingrn", [5]);
			body.addAnimation("flyn", [6,7],15);
			body.addAnimation("Stoppedn", [8]);
			body.addAnimation("Walkrf", [9, 10], 40);
			body.addAnimation("Walklf", [11, 12], 40);
			body.addAnimation("wallHumpinglf", [13]);
			body.addAnimation("wallHumpingrf", [14]);
			body.addAnimation("flyf", [15,16],15);
			body.addAnimation("Stoppedf", [17]);
		}
		
		public function render(frame:int):void 
		{
			if (frame >= playerStateFrames.length)
			{
				frame = playerStateFrames.length - 1;
			}
			
			body.x = playerStateFrames[frame].bodX;
			body.y = playerStateFrames[frame].bodY;
			body.frame = playerStateFrames[frame].bodAnimFrame;
			body.color = color;
			body.render();
		}
	}

}