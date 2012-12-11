/**
 * User: logan
 * Date: 11/19/12
 * Time: 4:54 PM
 * Email: xorcererzc@gmail.com
 */
package logan.zExpression.astree
{
	import flash.utils.Dictionary;

	import logan.zExpression.astree.BuiltinFunctions;

	import logan.zExpression.astree.nodes.Node;
	import logan.zExpression.containers.DictionaryVariableAdapter;
	import logan.zExpression.containers.IVariableAdapter;
	import logan.zExpression.containers.VariableAndFunctionContainer;

	public class ASTree extends VariableAndFunctionContainer
	{
		private var _root:Node

		public function ASTree(root:Node)
		{
			_root = root

			BuiltinFunctions.addBuiltinFunctions(this)
		}

		public function calculate(variables:IVariableAdapter = null, functions:Object = null):Number
		{
			if (variables == null)
				variables = new DictionaryVariableAdapter(_variables)
			if (functions == null)
				functions = _functions
			return _root.calculate(variables, functions)
		}

		public function toString():String
		{
			return _root.toString()
		}

		public function toStringWithVariablesReplaced():String
		{
			return _root.toStringWithVariablesReplaced(new DictionaryVariableAdapter(_variables))
		}
	}
}
