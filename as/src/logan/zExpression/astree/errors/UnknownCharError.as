package logan.zExpression.astree.errors
{
	public class UnknownCharError extends InvalidExpressionError
	{
		public function UnknownCharError(token:String)
		{
			super('Unknown token: "' + token + '".')
		}
	}
}
