package{
	
	import flash.display.*;
	import flash.events.*;
	public class healthBar extends MovieClip{
		
		public function healthBar(){
			x = 100;
			y = 50;
			trace (healthText.text);
			addEventListener(Event.ENTER_FRAME, writeHealth);
		}
		public function writeHealth(event:Event){
			healthText.text = "Health: "+(pizzaCar.main.health);
			if (pizzaCar.main.health <= 0){
				healthText.text = "You are dead";
				removeEventListener(Event.ENTER_FRAME, writeHealth);
			}
		}
	}
}