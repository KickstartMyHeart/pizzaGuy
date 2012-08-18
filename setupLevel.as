package{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.Timer;
    
    public class setupLevel extends MovieClip
	{
		public var enemyTimer;
	   	 public var pizzaTimer;
		 public var levelBGTimer;
	   	 static public var setupMain;
	   	 public var setup;
	   	 public var test = 1;
	   	 public var pizza;
	   	 public var score;
	   	 public var hp;
	   	 public var bg1;
		 public var bg2;
		 public var sky1;
		 public var sky2;
	   	 public var enemy;
	   	 public var bossenemy:levelboss;
	   	 
	   	 private var stageref;
	   	 public var pt;
		 public var bgVar;
	   	 private var chickenType:int;
	   	 private var i = 0; //to cycle thru array
	   	 public var levelLayout:Array = [1,3,1,2,1,3,1,1,1,2,1,3,1,3,2,0];
		 public var levelTargets:Array = [1,1,1,2,1,2,1,2,2,1,1,1,1,2,1,2,2,1];
		// public var levelLayout:Array = [0]; // Boss testing.
		 
	   	 public function setupLevel(stage:Stage){
	   		 stageref = stage;
	   		 setupMain = this;
			 //add the two backgrounds (one follows the other and they switch places to repeat)
			 sky1 = new sky();
			 sky2 = new sky();
			 stage.addChild(sky1);
			 stage.addChild(sky2);
			 sky1.x = 0;
			 sky2.x = sky1.width;
	   		 bg1 = new background();
			 bg2 = new background();
	   		 stage.addChild(bg1);
	   		 stage.addChild(bg2);
			 bg1.x = 0;
			 bg2.x = bg1.width;
			 stageref.addEventListener(Event.ENTER_FRAME, moveBG);
	   		 pizza = new powerup();
	   		 stage.addChild(pizza);
	   		 hp = new healthBar();
	   		 stage.addChild(hp);
	   		 score = new scoreBar();
	   		 stage.addChild(score);
			 beginLevelTimer();
	   		 beginPizzaTargetTimer();
	   		 beginEnemyTimer();
	   	 }
		 
		 public function moveBG(e:Event){
			 if ((bg1.x <= -bg1.width))
			 {
				 bg1.x = bg1.width;
			 }
			 else if (bg1.x >= bg1.width)
			 {
				 bg1.x = -bg1.width;
			 }
			 
			 if (bg2.x <= -bg2.width)
			 {
				 bg2.x = bg2.width;
			 }
			 else if (bg2.x >= bg2.width)
			 {
				 bg2.x = -bg2.width;
			 }
			 
			 if (sky1.x < -sky1.width)
			 {
				 sky1.x = sky1.width;
			 }
			 else if (sky1.x >= sky1.width)
			 {
				 sky1.x = -sky1.width;
			 }
			 
			 if (sky2.x < -sky2.width)
			 {
				 sky2.x = sky2.width;
			 }
			 else if (sky2.x >= sky2.width)
			 {
				 sky2.x = -sky2.width;
			 }
		 }
		 
	   	 public function beginEnemyTimer(){
	   		 enemyTimer = new Timer(1000, 0);
	   		 enemyTimer.addEventListener("timer", selectEnemy);
	   		 enemyTimer.start();
	   	 }
		 
		 public function endEnemyTimer()
		 {
			 enemyTimer.stop();
			 enemyTimer.removeEventListener;
		 }
		 
	   	 public function selectEnemy(event:TimerEvent){
	   		 createEnemy();
	   	 }
		 
	   	 public function createEnemy(){
	   		 chickenType = Math.round(Math.random());
	   		 if (chickenType == 0)
	   		 {
	   			 enemy = new rooster(stageref);
	   			 stageref.addChild(enemy);
	   		 }
	   		 if (chickenType == 1)
	   		 {
	   			 enemy = new hen(stageref);
	   			 stageref.addChild(enemy);
	   		 }
	   	 }
		 
	   	 public function beginPizzaTargetTimer(){
	   		 pizzaTimer = new Timer(4000, 0);
	   		 pizzaTimer.addEventListener("timer", selectPizzaTarget);
	   		 pizzaTimer.start();
	   	 }
		 
		 public function beginLevelTimer(){
	   		 levelBGTimer = new Timer(6000, 0);
	   		 levelBGTimer.addEventListener("timer", selectLevelBG);
	   		 levelBGTimer.start();
	   	 }
		 
	   	 public function selectLevelBG(event:TimerEvent){
	   		 if (levelLayout[i] == 1)
	   		 {
	   			 bgVar = new house(stageref);
	   			 stageref.addChild(bgVar);
	   		 }
	   		 if (levelLayout[i] == 2)
	   		 {
	   			 bgVar = new house(stageref);
	   			 stageref.addChild(bgVar);
	   		 }
	   		 if (levelLayout[i] == 3)
	   		 {
	   			 bgVar = new house(stageref);
	   			 stageref.addChild(bgVar);
	   		 }
	   		 i++;
	   	 }
		 
		 public function selectPizzaTarget(event:TimerEvent){
	   		 if (levelLayout[i] == 0)
	   		 {
				bossTime();
	   		 }
	   		 if (levelTargets[i] == 1)
	   		 {
	   			 pt = new girlTarget(stageref);
	   			 stageref.addChild(pt);
	   		 }
	   		 if (levelTargets[i] == 2)
	   		 {
	   			 pt = new guyTarget(stageref);
	   			 stageref.addChild(pt);
	   		 }
	   		 i++;
	   	 }
		
		private function bossTime()
		{
			endEnemyTimer();
			bossintro();
		}
		
		private function bossintro()
		{
			bg1.scrolltoggle();
			bg2.scrolltoggle();
			sky1.scrolltoggle();
			sky2.scrolltoggle();
			
			bossenemy = new roosterKing(stageref);
			stageref.addChild(bossenemy);
			
			bossfight();
		}
		
		private function bossfight()
		{
			bg1.reversedirection();
			bg2.reversedirection();
			sky1.reversedirection();
			sky2.reversedirection();
			
			bg1.scrolltoggle();
			bg2.scrolltoggle();
			sky1.scrolltoggle();
			sky2.scrolltoggle();
		}
	}
}