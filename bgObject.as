package  {
	
	public class bgObject {
		private var stageref:Stage;
		
		public function bgObject() {
			// constructor code
			stageref = stage;
			this.x = stageref.stageWidth;
			this.y = (stageref.stageHeight * .2);
		}

	}
	
}
