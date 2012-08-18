package
{
	import flash.display.*;
	import flash.events.*;
	
	public class fireTreeFireball extends objects
	{
		private var x_;
		private var y_;
		private var xv = 5;
		private var yv = 5;
		
		public function fireTreeFireball(x_,y_)
		{
			x = x_;
			y = y_;
			addEventListener(Event.ENTER_FRAME, moveFireball);
		}
		public function moveFireball(event:Event)
		{
			x -=xv;
			y +=yv;
		}
	}
}