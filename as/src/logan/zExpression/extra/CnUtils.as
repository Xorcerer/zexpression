package logan.zExpression.extra
{
	import logan.zExpression.Utils;

	public final class CnUtils
	{
		public static function isLetterOrCnChar(char:String):Boolean
		{
			const regex:RegExp = /[\u4e00-\u9fa5]/
			return Utils.isLetter(char) || regex.test(char)
		}

	}
}
