/**
 * User: logan
 * Date: 11/19/12
 * Time: 4:54 PM
 * Email: xorcererzc@gmail.com
 */
package logan.zExpression
{
	import flash.utils.Dictionary;

	public class ASTree
	{
		private var _root:ASTreeNode
		private var _variables:Dictionary = new Dictionary
		private var _functions:Dictionary = new Dictionary
		public function ASTree(root:ASTreeNode)
		{
			_root = root

			//built-in variables and functions
			setVariable('PI', Math.PI)

			setFunction('+', function(x:Number, y:Number) { return x + y; })
			setFunction('-', function(x:Number, y:Number) { return x - y; })
			setFunction('*', function(x:Number, y:Number) { return x * y; })
			setFunction('/', function(x:Number, y:Number) { return x / y; })
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
	}
}
