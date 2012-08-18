package
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.getTimer;
	
	public class pizzaTarget extends objects
	{
		private var stageref:Stage;
		public function pizzaTarget(stage:Stage)
		{
			stageref = stage;
			this.addEventListener(Event.ENTER_FRAME, pizzaHit);
			this.x = stageref.stageWidth;
			this.y = (stageref.stageHeight * .3);
			gotoAndStop(1);
		}
		public function pizzaHit(e:Event)
		{
			if (this.x < -20){
				removeEventListener(Event.ENTER_FRAME, pizzaHit);
				removeEventListener(Event.ENTER_FRAME, scroll);
				this.parent.removeChild(this);
			}
			
			for each (var bullet:pizzaBullet in game.main.bulletVector) 
			{
				if (this.hitTestObject(bullet)){
					removeEventListener(Event.ENTER_FRAME, pizzaHit);
					gotoAndStop(2);
					game.main.theScore += 100;
				}
			}
		}
	}
}