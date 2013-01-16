package com.Tutorial 
{
	import flash.display.Shape;
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{
		private var Ftxt:FadeText;
		
		override public function MenuState() 
		{
			
			var txt:FlxText
			txt = new FlxText(0, 32, FlxG.width, "Bob the Blob!")
			txt.setFormat(null, 16, 0xFFFFFFFF, "center", 0x333333);
			this.add(txt);
			
			txt = new FlxText(0, 48, FlxG.width, "in the Great Gravity Gamble")
			txt.setFormat(null, 8, 0xFFFFFFFF, "center", 0x333333);
			this.add(txt);
			
			txt = new FlxText(0, FlxG.height - 16, FlxG.width, "V0.2")
			txt.setFormat(null, 8, 0xFFFFFFFF, "center");
			this.add(txt);
			
			Ftxt = new FadeText(0, FlxG.height / 2, FlxG.width, "PRESS X TO START")
			Ftxt.setFormat(null, 8, 0xFFFFFFFF, "center");
			this.add(Ftxt);
			
			mX = 0;
			mY = 0;
			lA = 1;
		}
		
		protected var drawShape:Shape;
		
		override public function update():void
		{
			if (FlxG.keys.pressed("X"))
			{
				FlxG.flash.start(0xffffffff, 0.75);
				FlxG.fade.start(0xff000000, 1, onFade);
			}         
			
			if (Ftxt.alpha == 1)
			{
				Ftxt.fadeOut(0.5);
			}
			else if (Ftxt.alpha == 0)
			{
				Ftxt.fadeIn(0.5);
			}
			
			super.update();
		}
		
		private var mX:int;
		private var mY:int;
		private var lA:Number;
		
		override public function render():void 
		{
			super.render();
			
			//if (mX == FlxG.mouse.x && mY == FlxG.mouse.y)
			//{
				//lA -= 0.01;
			//}
			//else
			//{
				//lA = 1;
			//}
			//
			//mX = FlxG.mouse.x;
			//mY = FlxG.mouse.y;
			//
            //drawShape = new Shape();
            //drawShape.graphics.lineStyle(1, 0x202020, lA);
            //drawShape.graphics.moveTo(FlxG.width/2, FlxG.height / 2);
            //drawShape.graphics.lineTo(FlxG.mouse.x, FlxG.mouse.y);
            //FlxG.buffer.draw(drawShape);
		}
		
		private function onFade():void
		{
			  FlxG.state = new PlayState();
		}
	}

}