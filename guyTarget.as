package  
{
	import flash.display.*;
	import flash.events.*;
	public class guyTarget extends objects
	{
		private var stageref:Stage;
		public function guyTarget(stage:Stage) 
		{
			// constructor code
			stageref = stage;
			this.x = stageref.stageWidth;
			this.y = (stageref.stageHeight * .5);
			this.addEventListener(Event.ENTER_FRAME, pizzaHit);
			addEventListener(Event.ENTER_FRAME, animate);
		}
		
		public function animate(event:Event){
		   if (this.currentFrame == 11) {
			   this.gotoAndStop(1);
		   }
		   else {
			   this.gotoAndStop(this.currentFrame+1);
		   }
		   /*
		   if (this.currentFrame == 10) {
			   
		   }
		   if (this.currentFrame == 20){
			   super.AItrue();
			   this.gotoAndStop(1);
		   }*/
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
					gotoAndStop(12);
					game.main.theScore += 100;
				}
			}
		}


	}
	
}
