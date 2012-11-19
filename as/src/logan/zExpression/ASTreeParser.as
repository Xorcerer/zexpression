/**
 * User: logan
 * Date: 11/19/12
 * Time: 4:22 PM
 * Email: xorcererzc@gmail.com
 */
package logan.zExpression
{
	import logan.zExpression.containers.Queue;

	public class ASTreeParser
	{
		public static function parse(exp:String):ASTree
		{
			var tokens:Array = Tokenizer.tokenize(exp)
			var parser:ASTreeParser = new ASTreeParser
			var rootNode:ASTreeNode = parser.parse(new Queue(tokens))
			return new ASTree(rootNode)
		}

		private function parse(tokens:Queue, terminators:Array = null):ASTreeNode
		{
			var lfs:ASTreeNode = null
			var token:String = tokens.pop() as String
			var lastToken:String = null

			while (token != null && (terminators == null || terminators.indexOf(token) < 0))
			{
				if (token == '(')
				{
					if (lastToken != null && Utils.isVariable(lastToken))
						parseFunctionCall(lastToken, tokens)
					else
						lfs = parse(tokens, [')'])
				}
				else if (token == '+' || token == '-')
				{
					Utils.assert(op == null)
					Utils.assert(lastToken != null)

					var op:ASTreeNode = new ASTreeNode(token, ASTreeNode.TYPE_FUNCTION)
					if (lfs != null)
						op.addChild(lfs)
					else
						op.addChild(getValueNode(lastToken))
					op.addChild(parse(tokens, terminators))

					return op
				}
				else if (token == '*' || token == '/')
				{
					var nextToken:String = tokens.pop() as String
					Utils.assert(nextToken != null)

					var rfs:ASTreeNode = null
					if (nextToken == '(')
						rfs = parse(tokens, [')'])
					else
						rfs = getValueNode(nextToken)
					var newLfs:ASTreeNode = new ASTreeNode(token, ASTreeNode.TYPE_FUNCTION)
					if (lfs != null)
						newLfs.addChild(lfs)
					else
						newLfs.addChild(getValueNode(lastToken))
					newLfs.addChild(rfs)
					lfs = newLfs
				}

				lastToken = token
				token = tokens.pop() as String
			}

			if (lfs)
				return lfs
			else
				return getValueNode(lastToken)
		}

		private function getValueNode(token:String):ASTreeNode
		{
			Utils.assert(Utils.isValue(token))
			if (Utils.isNumber(token))
				return new ASTreeNode(token, ASTreeNode.TYPE_NUMBER)

			Utils.assert(Utils.isVariable(token))
			return new ASTreeNode(token, ASTreeNode.TYPE_VARIABLE)

		}

		private function parseFunctionCall(functionName:String, tokens:Queue):ASTreeNode
		{
			var result:ASTreeNode = new ASTreeNode(functionName, ASTreeNode.TYPE_FUNCTION)
			var token:String = tokens.pop() as String

			while (token != null && token != ')')
			{
				result.addChild(parse(tokens, [',', ')']))
			}

			return result
		}

	}
}
