package logan.zExpression.astree.errors
{
	import logan.zExpression.Utils;

	public class InvalidExpressionError extends Error
	{
		private var _expression:String
		private var _position:uint
		public function InvalidExpressionError(message:* = '')
		{
			super(message)
		}

		public function setExpressionAndErrorPosition(exp:String, pos:uint):void
		{
			_expression = exp
			_position = pos
		}

		public function get verboseMessage():String
		{
			return message + '\n' + expression + '\n' + Utils.repeatString(' ', position) + '^'

		}

		public function get expression():String
		{
			return _expression;
		}

		public function get position():uint
		{
			return _position;
		}
	}
}
