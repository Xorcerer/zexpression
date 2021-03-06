package logan.zExpression.astree.nodes
{
	import logan.zExpression.containers.IVariableAdapter;

	public class FunctionNode extends Node
	{
		public function FunctionNode(content:Object)
		{
			super(content)
		}

		override public function calculate(variables:IVariableAdapter, functions:Object):Number
		{
			var func:Function = functions[content]
			var args:Array = []
			for each(var node:Node in children)
				args.push(node.calculate(variables, functions))
			return func.apply(null, args)
		}

		override public function toString():String
		{
			return ([content, '(', children.join(), ')']).join('')
		}

		override public function toStringWithVariablesReplaced(variables:IVariableAdapter):String
		{
			var childrenStrs:Array = []
			for each(var n:Node in children)
				childrenStrs.push(n.toStringWithVariablesReplaced(variables))
			return ([content, '(', childrenStrs.join(), ')']).join('')
		}
	}
}
