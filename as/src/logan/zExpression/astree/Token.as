package logan.zExpression.astree
{
	public class Token
	{
		public static const TYPE_NONE:uint = 0
		public static const TYPE_OPERATOR:uint = 1
		public static const TYPE_VAR:uint = 2
		public static const TYPE_NUMBER:uint = 3
		public static const TYPE_OPEN_PARENTHESIS:uint = 4
		public static const TYPE_CLOSE_PARENTHESIS:uint = 5

		private var _content:String
		private var _type:uint

		public function Token(content:String, type:uint)
		{
			_content = content
			_type = type
		}

		public function get type():uint
		{
			return _type;
		}

		public function get content():String
		{
			return _content;
		}
	}
}
