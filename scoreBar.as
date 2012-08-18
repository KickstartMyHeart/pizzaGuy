package{
	
	import flash.display.*;
	import flash.events.*;
	public class scoreBar extends MovieClip{
		
		public function scoreBar()
		{
			x = 100;
			y = 90;
			addEventListener(Event.ENTER_FRAME,writeScore);
		}
		public function writeScore(event:Event)
		{
			scoreText.text = "Score: "+(game.main.theScore);
		}
	}
}