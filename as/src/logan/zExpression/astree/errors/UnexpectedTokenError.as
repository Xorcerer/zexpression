package logan.zExpression.astree.errors
{
	import logan.zExpression.astree.*;
	public class UnexpectedTokenError extends InvalidExpressionError
	{
		public function UnexpectedTokenError(token:String)
		{
			super('Unexpected token: "' + token + '".')
		}
	}
}
