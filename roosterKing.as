﻿package
{
	import flash.display.Stage;
	import flash.events.*;

	public class roosterKing extends levelboss
	{
		private var HenHarem:Vector.<hen>;
		private var _stage:Stage;
		
		private var direction:Boolean;
		private var yspeed:Number;
		private var ymodifier:Number;
		private var AIactive:Boolean;
		private var bossCounter:int;
		private var movechange:int;
		
		private var rocket:roosterKingRocket;
		private var fireball:roosterKingFireball;
		
		public function roosterKing(stage:Stage) 
		{
			var hp:int = 250;
			var attack:int = 40;
			var defence:int = 30;
			x = 550;
			y = 255;
			
			yspeed = 4;
			bossCounter = 1;
						
			_stage = stage;
			
			super(hp, attack, defence, _stage);
			
			AIactive = true;
			this.addEventListener(Event.ENTER_FRAME, AI);
		}
		
		private function AI(e:Event)
		{
			if (AIactive) {
				bossCounter++;
				
				
				move();
			}
		}
		
		private function move():void
		{
			movechange = 1;
			
			// Boss has chance to switch direction every 24 frames
			
			if (!(bossCounter % 48))
			{
			 	if (!(Math.floor(Math.random() * 100) % 8)) haremAttack();
			}
			
			if (!(bossCounter % 40))
			{
				if (!(Math.floor(Math.random() * 100) % 5)) roosterRocketAttack();
			}
			
			if (!(bossCounter % 30))
			{
				if (!(Math.floor(Math.random() * 100) % 4)) roosterFireballAttack();
			}

			if (!(bossCounter % 24))
			{
				movechange = Math.floor(Math.random() * 100);
			}

			if ((this.y >= _stage.stageHeight - 20) || (this.y <= 250) || !(movechange % 4))
				direction = !direction;
			
			if (direction){
				ymodifier = -1;
			}
			else{
				ymodifier = 1;
			}
			
			this.y += (yspeed * ymodifier);
		}
		
		private function roosterRocketAttack():void
		{
			rocket = new roosterKingRocket(this.x, this.y, _stage);
		}
		
		private function roosterFireballAttack()
		{
			fireball = new roosterKingFireball(this.x, this.y, _stage);
		}
		
		private function haremAttack()
		{
			HenHarem = new Vector.<hen>();
			for (var i:int = 0; i < 3; i++)
			{
				HenHarem.push(new hen(_stage));
				_stage.addChild(HenHarem[i]);
			}
		}
	}
}