package{
	
	import flash.display.*;
	import flash.events.*;
	import flash.filters.*;
	import flash.ui.*;
	import flash.utils.Timer;
	
	public class objects extends MovieClip
	{
		private var v;
		private var scrollstatus:Boolean;
		
		public function objects(scrollamount:Number = 5)
		{
			v = scrollamount;
			scrollstatus = true;
			addEventListener(Event.ENTER_FRAME, scroll);
		}
		
		//public function enterFrame(event:Event){
		//	scroll();
		//}

		internal function scroll(event:Event)
		{
			if (scrollstatus) x -= v;
		}
		
		public function scrolltoggle()
		{
			scrollstatus = !scrollstatus;
		}
		
		public function reversedirection()
		{
			v = -v;
		}
	}
}