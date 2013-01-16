package com.Tutorial 
{
	import adobe.utils.CustomActions;
	import com.Tutorial.Effects.Drip;
	import com.Tutorial.Effects.Smoke;
	import flash.display.BitmapData;
	import flash.utils.getTimer;
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{		
		public static var singleton:PlayState;
		//message
		private var messageText:FadeText;
		
		//mode
		private var mode:int;
		private var modeTimer:Number;
		
		//activePlayer
		private var player:Player;
		
		private const GRAVITY:int = 900;
		private var grav_direction:int = 1;
		public var switchedGravaty:Boolean = false;
		
		private var effectsGroup:FlxGroup;
		
		public function getGravity():int
		{
			return GRAVITY * grav_direction;
		}
		public function getGravMod():int {
			return grav_direction;
		}

		private var psArray:Array;
		private var replayFrame:int;
		
		//public var _map:MapBase;
		
		public var tiles:BitmapData;
		
		private var level:DAMELevel;
		
		private var killgroup:FlxGroup;
		
		//Ui
		//Timer
		private var timer:Number;
		private var timerText:FlxText;
		//attempt
		private var attempt:int;
		private var attemptText:FlxText;
		

		protected function onAddSpriteCallback(obj:FlxSprite):void
		{
			/*
			*/
		}
		
		public function PlayState() 
		{	
			super();
			singleton = this;
			
			attempt = 0;
			timer = 0;
			
			mode = 0;
			modeTimer = 0;
			
			messageText = new FadeText(0, FlxG.height / 3, FlxG.width,"");
			messageText.setFormat(null, 16, 0xFFFFFFFF, "center");
			messageText.fadeOut(0.001);
			this.add(messageText);
			
			effectsGroup = new FlxGroup();
			add(effectsGroup);
			
			killgroup = new FlxGroup();
			add(killgroup);
		}
		override public function create():void 
		{
			super.create();
			//level = new Level_Level1(false, getKillMaps);
			level = new Level_TestLevel(false, getKillMaps);
			level.createObjects();
			add(level.masterLayer);
			
			player = new Player(FlxG.width / 2, FlxG.height / 2);
			player.kill();
			add(player);
			
			timerText = new FlxText(0, 8, FlxG.width, "0.00")
			timerText.setFormat(null, 8, 0xFFFFFFFF, "left", 0xFF333333);
			timerText.scrollFactor = new FlxPoint();
			this.add(timerText);
			
			attemptText = new FlxText(0, 8, FlxG.width, "0")
			attemptText.setFormat(null, 8, 0xFFFFFFFF, "right", 0xFF333333);
			attemptText.scrollFactor = new FlxPoint();
			this.add(attemptText);
			
			PlayerState.load();
			
			psArray = new Array();
			
			mode = 0;
			modeTimer = 0;
		}
		
		public function getKillMaps(map:FlxTilemap, dunno:int, level:DAMELevel, properties:Array):void
		{
			FlxG.log(properties.length);
			for (var i:int = 0; i < properties.length; i ++)
			{
				if (properties[i].name == "Kills" &&
					properties[i].value)
				{
					killgroup.add(map);
				}
			}
		}
		
		override public function update(): void 
		{
			
			switch (mode)
			{
				case 0: //playing
				if (modeTimer == 0)
				{
					grav_direction = 1;
					player.reset(PlayerStart.xPos, PlayerStart.yPos);
				
					//FlxG.followAdjust(1, 1);
					FlxG.followBounds(DAMELevel.boundsMinX, DAMELevel.boundsMinY, DAMELevel.boundsMaxX, DAMELevel.boundsMaxY);
					FlxG.follow(player, 0.75);
					FlxG.followAdjust(1, 0.75);
					
					attempt++;
					attemptText.text = attempt.toString();
					timer = 0;
					player.reColor();
					
					replayFrame = 0;
				}
				
				if (switchedGravaty)
					switchedGravaty = false;
					
				if (FlxG.keys.justPressed("Z")) // just pressed
				{
					FlxG.log(player.onFloor);
					if (player.onFloor ||
						player.onLeftWall ||
						player.onRightWall)
						{
							grav_direction *= -1;
							switchedGravaty = true;
						}
				}
				
				modeTimer += FlxG.elapsed;
				replayFrame++;
				
				timer += FlxG.elapsed;
				timerText.text = timer.toFixed(2);
				
				if (player.isDead)
				{
					player.kill();
					modeTimer = 0;
					mode = 1;
				}
				break;
				case 1: //respawning
				if (modeTimer == 0)
				{
					replayFrame = 0;
					psArray.push(player.getAndResetPlayerState());
					//mode = 0;
				}
				
				modeTimer += FlxG.elapsed;
				
				if (modeTimer > 0.75)
				{
					modeTimer = 0;
					mode = 0;
				}
				break;
				case 10: //replay
				if (modeTimer == 0)
				{
					replayFrame = 0;
				}
				
				modeTimer += FlxG.elapsed;
				replayFrame++;
				
				//if ()
				//{
					//modeTimer = 0;
				//}
				break;
				
			}
			
			super.update();
			
			player.checkingKills = true;
			player.collide(killgroup);
			player.checkingKills = false;
			player.collide(level.hitTilemaps);
			
			effectsGroup.collide(level.hitTilemaps);
			
		}
		
		override public function render(): void 
		{
			
			super.render();
			
			//if (mode == 10)
			//{
				for each (var ps:PlayerState in psArray)
				{
					ps.render(replayFrame);
				}
			//}
			
		}
		
	}

}
