package logan.zExpression.astree
{
	import logan.zExpression.containers.VariableAndFunctionContainer;

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

		public static function addBuiltinFunctions(container:VariableAndFunctionContainer):void
		{
			with (container)
			{
				//built-in variables and functions
				setVariable('PI', Math.PI)

				setFunction('+', BuiltinFunctions.add)
				setFunction('-', BuiltinFunctions.minus)
				setFunction('*', function(x:Number, y:Number):Number { return x * y })
				setFunction('/', function(x:Number, y:Number):Number { return x / y })
				setFunction('abs', Math.abs)
				setFunction('min', Math.min)
				setFunction('max', Math.max)
				setFunction('sqrt', Math.sqrt)
			}
		}
	}
}
