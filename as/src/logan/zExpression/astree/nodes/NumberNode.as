package logan.zExpression.astree.nodes
{
	public class NumberNode extends Node
	{
		public function NumberNode(content:Object)
		{
			super(content)
		}

		override public function calculate(variables:Object, functions:Object):Number
		{
			return Number(content)
		}
	}
}
