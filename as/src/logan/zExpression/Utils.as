/**
 * Created with IntelliJ IDEA.
 * User: logan
 * Date: 11/19/12
 * Time: 5:17 PM
 * To change this template use File | Settings | File Templates.
 */
package logan.zExpression
{
	import logan.zExpression.astree.errors.InvalidExpressionError;

	public final class Utils
	{
		public function Utils()
		{
		}

		public static function isLetter(char:String):Boolean
		{
			return isLowCaseLetter(char) || isUpCaseLetter(char)
		}

		public static function isLowCaseLetter(char:String):Boolean
		{
			const a:uint = 97
			const z:uint = 122

			var code:uint = char.charCodeAt(0)
			return a <= code && code <= z

		}

		public static function isUpCaseLetter(char:String):Boolean
		{
			const A:uint = 65
			const Z:uint = 90

			var code:uint = char.charCodeAt(0)
			return A <= code && code <= Z
		}

		public static function isDigit(char:String):Boolean
		{
			const charCode0:uint = 48
			const charCode9:uint = 57

			var code:uint = char.charCodeAt(0)
			return charCode0 <= code && code <= charCode9
		}

		public static function assert(condition:Boolean, comment:String = ''):void
		{
			if (!condition)
				throw new InvalidExpressionError(comment)
		}

		public static function assertEquals(a:Object, b:Object):void
		{
			assert(a == b)
		}

		public static function assertContains(a:Object, b:Object):void
		{
			assert(a.indexOf(b) >= 0)
		}
	}
}
