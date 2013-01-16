//Code generated with DAME. http://www.dambots.com

package com.Tutorial
{
	import org.flixel.*;
	// Custom imports:
import com.Tutorial.Effects.*;
	public class Level_Level1 extends DAMELevel
	{
		//Embedded media...
		[Embed(source="../../data/mapCSV_Level1_Spikes.csv", mimeType="application/octet-stream")] public var CSV_Spikes:Class;
		[Embed(source="../../data/Spikes2.png")] public var Img_Spikes:Class;
		[Embed(source="../../data/mapCSV_Level1_Main.csv", mimeType="application/octet-stream")] public var CSV_Main:Class;
		[Embed(source="../../data/GirderLevelTiles.png")] public var Img_Main:Class;

		//Tilemaps
		public var layerSpikes:FlxTilemap;
		public var layerMain:FlxTilemap;

		//Shapes
		public var TutorialGroup:FlxGroup = new FlxGroup;

		//Properties


		public function Level_Level1(addToStage:Boolean = true, onAddCallback:Function = null)
		{
			// Generate maps.
			var properties:Array = [];

			properties = generateProperties( { name:"Kills", value:true }, null );
			layerSpikes = addTilemap( CSV_Spikes, Img_Spikes, 0.000, 0.000, 8, 8, 1.000, 1.000, false, 1, 1, properties, onAddCallback );
			properties = generateProperties( null );
			layerMain = addTilemap( CSV_Main, Img_Main, 0.000, 0.000, 8, 8, 1.000, 1.000, true, 1, 1, properties, onAddCallback );

			//Add layers to the master group in correct order.
			masterLayer.add(TutorialGroup);
			TutorialGroup.scrollFactor.x = 1.000000;
			TutorialGroup.scrollFactor.y = 1.000000;
			masterLayer.add(layerSpikes);
			masterLayer.add(layerMain);

			if ( addToStage )
				createObjects(onAddCallback);

			boundsMinX = 0;
			boundsMinY = 0;
			boundsMaxX = 640;
			boundsMaxY = 480;
			bgColor = 0xff000000;
		}

		override public function createObjects(onAddCallback:Function = null):void
		{
			addShapesForLayerTutorial(onAddCallback);
			generateObjectLinks(onAddCallback);
			FlxG.state.add(masterLayer);
		}

		public function addShapesForLayerTutorial(onAddCallback:Function = null):void
		{
			var obj:Object;

			addTextToLayer(new TextData(29.000, 430.000, 88.940, 13.000, 0.000, "Press X to Jump!","system", 8, 0xffffff, "center"), TutorialGroup,false, null, null ) ;
			addTextToLayer(new TextData(137.000, 393.000, 115.240, 13.000, 0.000, "Hold X to Jump higher!","system", 8, 0xffffff, "center"), TutorialGroup,false, null, null ) ;
			addTextToLayer(new TextData(320.000, 413.000, 86.940, 14.060, 0.000, "While in the air,","system", 8, 0xffffff, "center"), TutorialGroup,false, null, null ) ;
			addTextToLayer(new TextData(314.000, 424.000, 100.000, 14.710, 0.000, "hold X to hover!","system", 8, 0xffffff, "center"), TutorialGroup,false, null, null ) ;
			addTextToLayer(new TextData(471.000, 251.000, 100.000, 17.000, 0.000, "Careful!","system", 8, 0xffffff, "center"), TutorialGroup,false, null, null ) ;
			addTextToLayer(new TextData(455.000, 183.000, 129.700, 15.310, 0.000, "Press Z to swap Gravity!","system", 8, 0xffffff, "center"), TutorialGroup,false, null, null ) ;
		}

		public function generateObjectLinks(onAddCallback:Function = null):void
		{
		}

	}
}
