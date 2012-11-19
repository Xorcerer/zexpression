/**
 * Created with IntelliJ IDEA.
 * User: logan
 * Date: 11/19/12
 * Time: 5:09 PM
 * To change this template use File | Settings | File Templates.
 */
package logan.zExpression
{
	public class Token
	{
		public static const TYPE_NONE:uint = 0
		public static const TYPE_OPERATOR:uint = 1
		public static const TYPE_VAR:uint = 2
		public static const TYPE_NUMBER:uint = 3

		private var _content:String
		private var _type:uint

		public function Token(content:String, type:uint)
		{
			_content = content
			_type = type
		}

		public function get type():uint
		{
			return _type;
		}

		public function get content():String
		{
			return _content;
		}
	}
}
