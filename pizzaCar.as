package{

	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	import flash.filters.*;
	import flash.utils.Timer;
	
	public class pizzaCar extends MovieClip{
		
			//key listeners
			//game.main.stage.addEventListener(KeyboardEvent.KEY_DOWN);
			//game.main.stage.addEventListener(KeyboardEvent.KEY_UP);
			
		//static property so it can be referenced from any class easily 
		static public var main;
		public var health=int;
		//velocity
		private var v:Number;
		//buffers
		public var xBufferLeft:int = 50;
		public var xBufferRight:int = 200;
		public var yBufferUp:int = 250;
		public var yBufferDown:int = 20;
		//build Car
		public function pizzaCar(x_, y_){
			main = this;
			health=100;
			x = x_;
			y = y_;
			v = 10;
			//add an ENTER_FRAME event so we can do some logic at frame rate
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		private function enterFrame(event:Event){
			//setupLevel.main.hp.healthText.text = health;
			drive();
		}
		public function drive():void{
			if (Key.isDown(Keyboard.LEFT) && x > xBufferLeft){
				x -=v;
			}
			if (Key.isDown(Keyboard.RIGHT) && x < game.WIDTH - xBufferRight){
				x +=v;
			}
			if (Key.isDown(Keyboard.UP) && y > yBufferUp){
				y -=v;
			}
			if (Key.isDown(Keyboard.DOWN) && y < game.HEIGHT - yBufferDown){
				y +=v;
			}
		}
		
	}
}