package logan.zExpression.astree.errors
{
	public class UnexpectedCharError extends InvalidExpressionError
	{
		public function UnexpectedCharError(char:String)
		{
			super('Unexpected char: "' + char + '".')
		}
	}
}
