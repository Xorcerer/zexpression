package logan.zExpression.astree
{
	import flash.utils.Dictionary;

	public class VariableNode extends Node
	{
		public function VariableNode(content:Object)
		{
			super(content)
		}

		override public function calculate(variables:Object, functions:Object):Number
		{
			return Number(variables[content])
		}

		override public function toStringWithVariablesReplaced(variables:Object):String
		{
			return variables[content]
		}
	}
}
