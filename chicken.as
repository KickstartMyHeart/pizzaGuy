package{
   import flash.display.*;
   import flash.events.*;
   
   public class chicken extends objects{
       static public var main;
       protected var stageref:Stage;
       private var direction:Boolean;
       private var yspeed:Number;
       private var ymodifier:Number;
	   private var AIactive:Boolean;
	   public var canDie:Boolean = true;
	   public var hitCar:Boolean = false;
       
       public function chicken(stage:Stage){
           stageref = stage;
           this.x = stageref.stageWidth;
           this.y = (Math.random() * 250) + 250;
           direction = Boolean(Math.round(Math.random()))
		   AIactive = true;
           this.addEventListener(Event.ENTER_FRAME, AI);
       }
               
       public function AI(e:Event){
		   if (AIactive) {
			   yspeed = 1.5;
			   // if this goes off stage, call parent.removeChild and kill the object.
			   if ((this.y >= stageref.stageHeight - 20) || (this.y <= 250))
				   direction = !direction;
			   
			   if (direction){
				   ymodifier = -1;
			   }
			   else{
				   ymodifier = 1;
			   }
			   
			   this.y += (yspeed * ymodifier);
		   }
		   
		   if (this.x < -20){
				removeEventListener(Event.ENTER_FRAME, AI);
				removeEventListener(Event.ENTER_FRAME, scroll);
			   this.parent.removeChild(this);
		   }
		   
		   if(this.hitTestObject(game.main.car) && canDie==true)
		   {
				horribleDeath();
		   }
		   if(this.hitTestObject(game.main.car) && canDie==false)
		   {
				AIactive = false;
				hitCar = true;
		   }
       }
	   
	   public function toggleAI() {
		   AIactive = !AIactive;
	   }
	   
	   public function AItrue() {
		   AIactive = true;
	   }
	   
	   public function AIfalse() {
		   AIactive = false;
	   }
	   
	   public function canDieToggle() {
		   canDie = !canDie;
	   }
	   
	   protected function horribleDeath()
	   {
		   removeEventListener(Event.ENTER_FRAME, AI);
		   removeEventListener(Event.ENTER_FRAME, scroll);
		   this.parent.removeChild(this);
		   //pizzaCar.main.health -= 30;
		   //trace (pizzaCar.main.health);
	  }
   }
}