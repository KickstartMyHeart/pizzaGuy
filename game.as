package{
	
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.system.System;
	import flash.text.*;
	import flash.ui.Keyboard;
	import flash.utils.*;
	
	public class game extends MovieClip{
		static public var main;
		static public var WIDTH:int = 800;
		static public var HEIGHT:int = 600;
		static public var stageRef:Stage;
		public var car;
		public var bulletVector:Vector.<pizzaBullet>; //bullet
		private var spacebar:Boolean=false;
		public var theScore:int = 0;
		
		public function game(){
			main = this;
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event = null){
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Key.initialize(stage);
			
			WIDTH = stage.stageWidth;
			HEIGHT = stage.stageHeight;
			
			var ll = new setupLevel(stage);
			car = new pizzaCar(WIDTH/4, HEIGHT * .85);
			
			stage.addChild(car);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDownFunction);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyUpFunction);
			
			bulletVector = new Vector.<pizzaBullet>();
			bulletVector.push(new pizzaBullet(-300)); //so that the pizzaTarget has a reference if you don't shoot first
			stage.addChild(bulletVector[0]);
		}
		
		public function keyDownFunction(event:KeyboardEvent)
		{
			if (event.keyCode == 32 && spacebar == false)
			{
				var b:pizzaBullet = new pizzaBullet(-300, car.x, car.y);
				bulletVector.push(b);
				spacebar = true;
				stage.addChild(b);
			}
		}
		
		public function keyUpFunction(event:KeyboardEvent)
		{
			if (event.keyCode == 32)
			{
				spacebar = false;
			}
		}
	}
}