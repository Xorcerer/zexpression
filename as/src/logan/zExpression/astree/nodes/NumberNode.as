package logan.zExpression.astree.nodes
{
	import logan.zExpression.containers.IVariableAdapter;

	public class NumberNode extends Node
	{
		public function NumberNode(content:Object)
		{
			super(content)
		}

		override public function calculate(variables:IVariableAdapter, functions:Object):Number
		{
			return Number(content)
		}
	}
}
