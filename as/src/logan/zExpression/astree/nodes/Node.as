/**
 * User: logan
 * Date: 11/19/12
 * Time: 4:37 PM
 * Email: xorcererzc@gmail.com
 */
package logan.zExpression.astree.nodes
{
	import flash.errors.IllegalOperationError;

	import logan.zExpression.*;
	import logan.zExpression.containers.IVariableAdapter;

	public class Node
	{
		private var _content:Object = null
		protected var children:Vector.<Node> = new Vector.<Node>

		public function Node(content:Object)
		{
			_content = content
		}

		public function get content():Object
		{
			return _content
		}

		public function addChild(node:Node):void
		{
			Utils.assert(node != null)
			children.push(node)
		}

		public function toString():String
		{
			return _content.toString()
		}

		public function toStringWithVariablesReplaced(variables:IVariableAdapter):String
		{
			return toString()
		}

		public function calculate(variables:IVariableAdapter, functions:Object):Number
		{
			throw new IllegalOperationError('')
		}
	}
}
