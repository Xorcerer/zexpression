package logan.zExpression.astree.errors
{
	public class UnexpectedTokenError extends InvalidExpressionError
	{
		public function UnexpectedTokenError(token:String)
		{
			super('Unexpected token: "' + token + '".')
		}
	}
}
