/**
 * User: logan
 * Date: 11/19/12
 * Time: 4:37 PM
 * Email: xorcererzc@gmail.com
 */
package logan.zExpression
{
	import flash.utils.Dictionary;

	public class ASTreeNode
	{
		public static const TYPE_NUMBER:String = "number"
		public static const TYPE_VARIABLE:String = "variable"
		public static const TYPE_FUNCTION:String = "function"

		private var _value:Object = null
		private var _type:String = null
		private var children:Vector.<ASTreeNode> = new Vector.<ASTreeNode>

		public function ASTreeNode(value:Object, type:String)
		{
			_value = value
			_type = type
		}

		public function get value():Object
		{
			return _value
		}

		public function addChild(node:ASTreeNode):void
		{
			children.push(node)
		}

		public function toString():String
		{
			if (children.length > 0)
				return ([_value, '(', children.join(), ')']).join('')
			return _value.toString()
		}

		public function calculate(variables:Dictionary, functions:Dictionary):Number
		{
			switch (_type)
			{
				case TYPE_VARIABLE:
					return Number(variables[value])
				case TYPE_NUMBER:
					return Number(value)
				case TYPE_FUNCTION:
					var func:Function = functions[value]
					var args:Array = []
					for each(var node:ASTreeNode in children)
						args.push(node.calculate(variables, functions))
					return func.apply(null, args)
				default:
					Utils.assert(false)
					return 0
			}
		}
	}
}
