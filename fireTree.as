package
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.Timer;
	
	public class fireTree extends objects
	{
		private var stageref:Stage;
		private var fireMath:Number;
		private var fireTimer;
		private var fire;
		
		public function fireTree(stage:Stage)
		{
			stageref = stage;
			//this.addEventListener(Event.ENTER_FRAME, pizzaHit);
			this.x = stageref.stageWidth;
			this.y = (stageref.stageHeight * .2);
			fireMath = ((Math.round(Math.random()*3) + 1)*1000);
			beginFireTimer();
		}
	   public function beginFireTimer()
	   {
		   fireTimer = new Timer(fireMath);
		   fireTimer.addEventListener(TimerEvent.TIMER,shootFire);
		   fireTimer.start();
	   }
	   public function shootFire(event:TimerEvent)
	   {
		   fire = new fireTreeFireball(x, y);
		   stageref.addChild(fire);
		   trace("fireball shoot");
		   fireTimer.removeEventListener(TimerEvent.TIMER,shootFire);/*
		   eggMath = ((Math.round(Math.random()*3) + 4)*1000);
		   beginEggTimer();*/
	   }
	}
}