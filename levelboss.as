package
{
	import flash.display.Stage;
	import flash.display.MovieClip;

	public class levelboss extends MovieClip
	{
		private var _hp:int;
		private var _attack:int;
		private var _defence:int;
		private var _stage:Stage;
		
		// private var avatar:Movieclip;
				
		public function levelboss(hp:int, attack:int, defence:int, stage:Stage)
		{
			_hp = hp;
			_attack = attack;
			_defence = defence;
			
			_stage = stage;
		}
		
		public function set hp(value:int)
		{
			_hp = value;
		}
		
		public function hpdown(value:int)
		{
			_hp -= value;
		}
		
		private function die()
		{
			// Not sure what to put here yet.
		}
	}
}