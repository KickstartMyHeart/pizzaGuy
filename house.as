package  
{
	import flash.display.*;
	
	public class house extends objects
	{
		private var stageref:Stage;

		public function house(stage:Stage) 
		{
			// constructor code
			stageref = stage;
			this.x = stageref.stageWidth;
			this.y = (stageref.stageHeight * .32);
			this.gotoAndStop(1);
		}

	}
	
}
