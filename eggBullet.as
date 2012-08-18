package
{
	import flash.display.*;
	import flash.events.*;
	
	public class eggBullet extends objects
	{
		private var v:Number;
		
		public function eggBullet(x_, y_)
		{
			x = x_;
			y = y_;
			v = 20;
			addEventListener(Event.ENTER_FRAME, moveBullet)
		}
		public function moveBullet(event:Event)
		{
			x -= v;
			if (this.x < -20)
			{
				removeEventListener(Event.ENTER_FRAME, moveBullet);
				this.parent.removeChild(this);
			}
		}
	}
}