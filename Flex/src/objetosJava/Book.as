package objetosJava
{
	[Bindable]
	[RemoteClass(alias="crud.Book")]
	public class Book
	{
		public var Bookid:int;
		public var title:String;
		public var author:String;
		public var price:Number;
	}
}