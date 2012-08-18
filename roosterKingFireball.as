package  {
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;	
	
	public class roosterKingFireball extends MovieClip {
		
		private var _stage:Stage;
		
		public function roosterKingFireball(x:Number, y:Number, stage:Stage)
		{
			this.x = x;
			this.y = y;
			_stage = stage;
			
			this.addEventListener(Event.ENTER_FRAME, movement)
			_stage.addChild(this);	
		}
		
		private function movement(e:Event):void
		{
			this.x -= 20;
		}
		
		public function destroy():void
		{
			this.removeEventListener(Event.ENTER_FRAME, movement);
			this.parent.removeChild(this);
		}
	}
}