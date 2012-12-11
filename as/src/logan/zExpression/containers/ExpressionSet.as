package logan.zExpression.containers
{
	import flash.utils.Dictionary;

	import logan.zExpression.astree.ASTree;
	import logan.zExpression.astree.ASTreeParser;
	import logan.zExpression.astree.BuiltinFunctions;
	import logan.zExpression.errors.CycleReferencesError;
	import logan.zExpression.errors.CycleReferencesError;

	public class ExpressionSet extends VariableAndFunctionContainer
	{
		private var _resultVariableNameChain:Array = []
		private var _expressions:Dictionary = new Dictionary // result name: expression in AST

		public function ExpressionSet()
		{
			BuiltinFunctions.addBuiltinFunctions(this)
		}

		public function putExp(resultVariableName:String, exp:String):void
		{
			var tree:ASTree = ASTreeParser.parse(exp)
			_expressions[resultVariableName] = tree
		}

		public function getValue(resultVariableName:String):Number
		{
			_resultVariableNameChain.push(resultVariableName)

			if (_resultVariableNameChain.indexOf(resultVariableName) != _resultVariableNameChain.length - 1)
			{
				var e:CycleReferencesError = new CycleReferencesError(_resultVariableNameChain)
				_resultVariableNameChain = []
				throw e
			}

			var value:Object = _variables[resultVariableName]
			if (value != null)
				return Number(value)
			return _expressions[resultVariableName].calculate(new ExpressionVariableAdapter(this), _functions)

			_resultVariableNameChain.pop()
		}
	}
}
