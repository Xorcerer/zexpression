/**
 * Created with IntelliJ IDEA.
 * User: logan
 * Date: 11/19/12
 * Time: 7:28 PM
 * Email: xorcererzc@gmail.com
 */
package logan.zExpression.containers
{
	public class Queue
	{
		private var _first:LinkedNode
		private var _last:LinkedNode

		public function Queue(data:Array = null)
		{
			if (data != null)
				for each(var o:Object in data)
					push(o)
		}

		public function isEmpty():Boolean
		{
			return _first == null
		}

		public function push(data:Object):void
		{
			var node:LinkedNode = new LinkedNode

			node.data = data
			node.next = null

			if (isEmpty())
			{
				_first = node
				_last = node
			}
			else
			{
				_last.next = node
				_last = node
			}
		}

		public function pop():Object
		{
			if (isEmpty())
				return null

			var data:Object = _first.data
			_first = _first.next

			if (_first == null)
				_last = null

			return data
		}

		public function head():Object
		{
			if (isEmpty())
				return null
			return _first.data
		}

		public function toString():String
		{
			var result:String = "Queue(["
			var node:LinkedNode = _first
			while (node != null)
			{
				result += node.data.toString() + ', '
				node = node.next
			}
			result += '])'
			return result
		}
	}
}
