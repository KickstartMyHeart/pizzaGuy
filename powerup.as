package{
	
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	import flash.filters.*;
	import flash.utils.Timer;
	public class powerup extends objects{
           private var puNum:Number = Math.floor(Math.random()*2)+1;
		   private var puType:String;
		   
		public function powerup(){
			if (puNum == 1) {
				puType = "small";
			}
			if (puNum == 2) {
				puType = "medium";
			}
			x = 400;
			y = 300;
			addEventListener(Event.ENTER_FRAME, enterFrame);
			addEventListener(Event.ENTER_FRAME, animatePowerup);
		}
		public function enterFrame(event:Event){
			collision();
		}
		private function collision(){
			if(this.hitTestObject(game.main.car)){
				removeEventListener(Event.ENTER_FRAME, enterFrame);
				this.parent.removeChild(this);
				if (puType == "small") {
					pizzaCar.main.health += 15;
				}
				if (puType == "medium") {
					pizzaCar.main.health += 30;
				}
			}
		}
	   public function animatePowerup(event:Event){
		   if (puType == "small") {
			   if (this.currentFrame == 4) {
				   this.gotoAndStop(1);
			   }
			   else {
				   this.gotoAndStop(this.currentFrame+1);
			   }
		   }
		   if (puType == "medium") {
				this.gotoAndStop(5);
			   if (this.currentFrame == 8) {
				   this.gotoAndStop(5);
			   }
			   else {
				   this.gotoAndStop(this.currentFrame+1);
			   }
		   }
		   /*
			if (health < 1 && this.currentFrame < 7){
				this.gotoAndStop(7);
				//hitCar = false;
			}*/
	   }
	}
}