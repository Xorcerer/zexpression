package logan.zExpression.astree
{
	public final class BuiltinFunctions
	{
		// 1 + 1 -> add(1, 1)
		// +1 -> add(1)
		public static function add(x:Number, y:Number = 0):Number
		{
			return x + y
		}

		// 1 - 1 -> minus(1, 1)
		// -1 -> minus(1)
		public static function minus(x:Number, y:Object = null):Number
		{
			if (y == null)
				return -x
			return x - Number(y)
		}
	}
}
