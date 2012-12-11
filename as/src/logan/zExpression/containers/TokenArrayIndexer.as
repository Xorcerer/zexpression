package logan.zExpression.containers
{
	import logan.zExpression.Utils;

	public class TokenArrayIndexer
	{
		private var _array:Array;
		private var _index:uint;

		public function TokenArrayIndexer(array:Array, index:uint = 0)
		{
			_array = array
			_index = index
		}

		public function getAndMoveNext():String
		{
			if (_index >= _array.length)
				return null
			return _array[_index++] as String
		}

		public function get current():String
		{
			return _array[_index] as String
		}

		private static const SEP:String = ' ';
		public function toString():String
		{
			return _array.join(SEP)
		}

		public function toStringWithIndex():String
		{
			return toString() + '\n' + Utils.repeatString(' ', charIndex) + '^'
		}

		public function get charIndex():int
		{
			return _array.slice(0, _index).join(SEP).length - 1;
		}

		public function get index():uint
		{
			return _index;
		}
	}
}
