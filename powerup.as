package{
	
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	import flash.filters.*;
	import flash.utils.Timer;
	public class powerup extends objects{
		public function powerup(){
			x = 400;
			y = 300;
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		public function enterFrame(event:Event){
			collision();
		}
		private function collision(){
			if(this.hitTestObject(game.main.car)){
				removeEventListener(Event.ENTER_FRAME, enterFrame);
				this.parent.removeChild(this);
				pizzaCar.main.health += 20;
			}
		}
	}
}