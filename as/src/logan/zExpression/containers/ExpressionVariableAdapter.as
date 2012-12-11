package logan.zExpression.containers
{
	public class ExpressionVariableAdapter implements IVariableAdapter
	{
		private var _expSet:ExpressionSet
		public function ExpressionVariableAdapter(expSet:ExpressionSet)
		{
			_expSet = expSet
		}

		public function getValue(variableName:String):Number
		{
			return _expSet.getValue(variableName)
		}
	}
}
