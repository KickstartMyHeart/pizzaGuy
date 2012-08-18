package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;

	public class roosterKingRocket extends MovieClip
	{
		private var _stage:Stage;
		private var i:int;
		
		public function roosterKingRocket(x:Number, y:Number, stage:Stage)
		{
			this.x = x;
			this.y = y;
			i = 4;
			_stage = stage;
			
			this.addEventListener(Event.ENTER_FRAME, movement)
			_stage.addChild(this);			
		}
		
		private function movement(e:Event):void
		{
			i++;
			this.y -= i;
		}
		
		public function destroy():void
		{
			this.removeEventListener(Event.ENTER_FRAME, movement);
			this.parent.removeChild(this);
		}
	}
}