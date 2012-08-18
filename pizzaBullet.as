package
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.getTimer;
	
	public class pizzaBullet extends MovieClip
	{
		private var dy:Number //speed
		private var lastTime:int;
		
		public function pizzaBullet(speed:Number, x:Number = 0, y:Number = 0)
		{
			this.x = x;
			this.y = y;
			dy = speed;
			lastTime = getTimer();
			addEventListener(Event.ENTER_FRAME,moveBullet);
		}
		
		public function moveBullet(event:Event)
		{
			var timePassed:int = getTimer() - lastTime;
			lastTime += timePassed;
			this.y += dy*timePassed/1000;
			this.x += -.5 * (dy*timePassed/1000)
			
			if (this.y < 190)
			{
				removeEventListener(Event.ENTER_FRAME,moveBullet);
				game.main.bulletVector.pop();
				this.parent.removeChild(this);
			}
		}
		
		
	}
}