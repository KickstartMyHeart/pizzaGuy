package{
	import flash.display.*;
	import flash.events.*;
	
	public class rooster extends chicken{
		
		public function rooster(stage:Stage){
			super(stage);
			canDieToggle();
			addEventListener(Event.ENTER_FRAME, animateRooster)
		}
		public function animateRooster(event:Event){
			if (hitCar == true && this.currentFrame < 9){
				this.gotoAndStop(9);
				//hitCar = false;
			}
			if (this.currentFrame == 9) {
				this.gotoAndStop(10);
			}
			if (this.currentFrame == 15){
				this.gotoAndStop(16);
			}
			if (this.currentFrame == 8) {
				this.gotoAndStop(1);
			}
			else {
				this.gotoAndStop(this.currentFrame+1);
			}
			if (this.currentFrame == 25 && canDie == false){
				canDieToggle();
				destructor();
			}
		}
		
		public function destructor() {
			removeEventListener(TimerEvent.TIMER,animateRooster);
			horribleDeath();
		}
	}
}