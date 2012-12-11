package logan.zExpression.astree.nodes
{
	import logan.zExpression.containers.IVariableAdapter;

	public class VariableNode extends Node
	{
		public function VariableNode(content:Object)
		{
			super(content)
		}

		override public function calculate(variables:IVariableAdapter, functions:Object):Number
		{
			return variables.getValue(content.toString())
		}

		override public function toStringWithVariablesReplaced(variables:IVariableAdapter):String
		{
			return variables.getValue(content.toString()).toString()
		}
	}
}
