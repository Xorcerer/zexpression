/**
 * User: logan
 * Date: 11/19/12
 * Time: 4:54 PM
 * Email: xorcererzc@gmail.com
 */
package logan.zExpression.astree
{
	import flash.utils.Dictionary;

	import logan.zExpression.astree.nodes.Node;

	public class ASTree
	{
		private var _root:Node
		private var _variables:Dictionary = new Dictionary
		private var _functions:Dictionary = new Dictionary
		public function ASTree(root:Node)
		{
			_root = root

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

		public function setVariable(name:String, value:Number):void
		{
			_variables[name] = value
		}

		public function setFunction(name:String, value:Function):void
		{
			_functions[name] = value
		}

		public function calculate():Number
		{
			return _root.calculate(_variables, _functions)
		}

		public function toString():String
		{
			return _root.toString()
		}

		public function toStringWithVariablesReplaced():String
		{
			return _root.toStringWithVariablesReplaced(_variables)
		}
	}
}
