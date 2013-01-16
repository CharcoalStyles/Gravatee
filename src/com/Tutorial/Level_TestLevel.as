//Code generated with DAME. http://www.dambots.com

package com.Tutorial
{
	import org.flixel.*;
	// Custom imports:
import com.Tutorial.Effects.*;
	public class Level_TestLevel extends DAMELevel
	{
		//Embedded media...
		[Embed(source="../../data/mapCSV_TestLevel_Spikes.csv", mimeType="application/octet-stream")] public var CSV_Spikes:Class;
		[Embed(source="../../data/Spikes2.png")] public var Img_Spikes:Class;
		[Embed(source="../../data/mapCSV_TestLevel_Main.csv", mimeType="application/octet-stream")] public var CSV_Main:Class;
		[Embed(source="../../data/GirderLevelTiles.png")] public var Img_Main:Class;

		//Tilemaps
		public var layerSpikes:FlxTilemap;
		public var layerMain:FlxTilemap;

		//Sprites
		public var Layer2Group:FlxGroup = new FlxGroup;

		//Shapes
		public var Layer3Group:FlxGroup = new FlxGroup;

		//Properties


		public function Level_TestLevel(addToStage:Boolean = true, onAddCallback:Function = null)
		{
			// Generate maps.
			var properties:Array = [];

			properties = generateProperties( { name:"Kills", value:true }, null );
			layerSpikes = addTilemap( CSV_Spikes, Img_Spikes, 0.000, 0.000, 8, 8, 1.000, 1.000, false, 1, 1, properties, onAddCallback );
			properties = generateProperties( null );
			layerMain = addTilemap( CSV_Main, Img_Main, 0.000, 0.000, 8, 8, 1.000, 1.000, true, 1, 1, properties, onAddCallback );

			//Add layers to the master group in correct order.
			masterLayer.add(layerSpikes);
			masterLayer.add(layerMain);
			masterLayer.add(Layer3Group);
			Layer3Group.scrollFactor.x = 1.000000;
			Layer3Group.scrollFactor.y = 1.000000;
			masterLayer.add(Layer2Group);
			Layer2Group.scrollFactor.x = 1.000000;
			Layer2Group.scrollFactor.y = 1.000000;

			if ( addToStage )
				createObjects(onAddCallback);

			boundsMinX = 0;
			boundsMinY = 0;
			boundsMaxX = 320;
			boundsMaxY = 240;
			bgColor = 0xff000000;
		}

		override public function createObjects(onAddCallback:Function = null):void
		{
			addShapesForLayerLayer3(onAddCallback);
			addSpritesForLayerLayer2(onAddCallback);
			generateObjectLinks(onAddCallback);
			FlxG.state.add(masterLayer);
		}

		public function addShapesForLayerLayer3(onAddCallback:Function = null):void
		{
			var obj:Object;

			addTextToLayer(new TextData(8.000, 89.000, 304.170, 13.000, 0.000, "Press X to Jump, hold to jump higher.","system", 8, 0xffffff, "center"), Layer3Group,false, null, null ) ;
			addTextToLayer(new TextData(8.000, 103.000, 303.400, 12.770, 0.000, "On a wall, press X to jump off.","system", 8, 0xffffff, "center"), Layer3Group,false, null, null ) ;
			addTextToLayer(new TextData(8.000, 117.000, 303.400, 12.770, 0.000, "In the air, hold X to hover","system", 8, 0xffffff, "center"), Layer3Group,false, null, null ) ;
			addTextToLayer(new TextData(8.000, 131.000, 303.400, 12.770, 0.000, "Press Z while on a surface to switch gravity.","system", 8, 0xffffff, "center"), Layer3Group,false, null, null ) ;
		}

		public function addSpritesForLayerLayer2(onAddCallback:Function = null):void
		{
			addSpriteToLayer(null, PlayerStart, Layer2Group , 19.000, 200.000, 0.000, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"PlayerStart"
		}

		public function generateObjectLinks(onAddCallback:Function = null):void
		{
		}

	}
}
