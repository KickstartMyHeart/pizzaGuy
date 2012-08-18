package{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.Timer;
   
   public class hen extends chicken{
	   private var eggMath:Number;
	   private var eggTimer;
	   private var egg;
	   private var x_;
	   private var y_;
       
       public function hen(stage:Stage){
		   super(stage);
		   eggMath = ((Math.round(Math.random()*3) + 1)*1000);
			beginEggTimer();
			addEventListener(Event.ENTER_FRAME, animateHen);
       }
	   public function beginEggTimer()
	   {
		   eggTimer = new Timer(eggMath);
		   eggTimer.addEventListener(TimerEvent.TIMER,shootEgg);
		   eggTimer.start();
	   }
	   public function shootEgg(event:TimerEvent)
	   {
		   egg = new eggBullet(x, y);
		   stageref.addChild(egg);
		   this.gotoAndStop(10);
		   AIfalse();
		   eggTimer.removeEventListener(TimerEvent.TIMER,shootEgg);/*
		   eggMath = ((Math.round(Math.random()*3) + 4)*1000);
		   beginEggTimer();*/
	   }
	   
	   public function destructor() {
		   eggTimer.removeEventListener(TimerEvent.TIMER,shootEgg);
		   horribleDeath();
	   }
	   public function animateHen(event:Event){
		   if (this.currentFrame == 9) {
			   this.gotoAndStop(1);
		   }
		   else {
			   this.gotoAndStop(this.currentFrame+1);
		   }
		   if (this.currentFrame == 10) {
			   
		   }
		   if (this.currentFrame == 20){
			   super.AItrue();
			   this.gotoAndStop(1);
		   }
	   }
   }
}