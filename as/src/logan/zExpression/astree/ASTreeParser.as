/**
 * User: logan
 * Date: 11/19/12
 * Time: 4:22 PM
 * Email: xorcererzc@gmail.com
 */
package logan.zExpression.astree
{
	import logan.zExpression.Utils;
	import logan.zExpression.astree.errors.InvalidExpressionError;
	import logan.zExpression.astree.errors.UnexpectedTokenError;
	import logan.zExpression.astree.nodes.FunctionNode;
	import logan.zExpression.astree.nodes.Node;
	import logan.zExpression.astree.nodes.NumberNode;
	import logan.zExpression.astree.nodes.VariableNode;
	import logan.zExpression.containers.Queue;

	public class ASTreeParser
	{
		public static function parse(exp:String):ASTree
		{
			var tokens:Array = Tokenizer.tokenize(exp)
			trace(tokens)
			var parser:ASTreeParser = new ASTreeParser
			var rootNode:Node = parser.parse(new Queue(tokens), new TerminatorContainer())
			return new ASTree(rootNode)
		}

		private function parse(tokens:Queue, terminators:TerminatorContainer):Node
		{
			// FIXME: Parenthesis check.
			var lfs:Node = null
			var token:String = tokens.pop() as String

			while (token != null)
			{
				if (isNumber(token))
				{
					if (lfs == null)
					    lfs = new NumberNode(token)
					// TODO: else throw Error.
				}
				else if (isVariable(token))
				{
					lfs = parseVariable(token, tokens)
				}
				else if (token == '(')
				{
					lfs = parse(tokens, new TerminatorContainer(')'))
					Utils.assertEquals(tokens.pop(), ')')
				}
				else if (token == '+' || token == '-')
				{
					lfs = parseTerm(token, lfs, terminators, tokens)
				}
				else if (token == '*' || token == '/')
				{
					lfs = parseFactor(token, lfs, terminators, tokens)
				}

				if (terminators.match(tokens.head() as String))
					break
				token = tokens.pop() as String
			}

			Utils.assert(lfs != null)
			return lfs
		}

		private function parseVariable(variableName:String, tokens:Queue):Node
		{
			if (tokens.head() != '(')
				return new VariableNode(variableName)
			tokens.pop()
			return parseFunctionCall(variableName, tokens)
		}

		private function parseFunctionCall(functionName:String, tokens:Queue):Node
		{
			var result:Node = new FunctionNode(functionName)
			var tc:TerminatorContainer = new TerminatorContainer(',', ')')

			Utils.assert(tokens.head() != null)
			if (tokens.head() == ')')
			{
				tokens.pop()
				return result
			}

			while (tc.lastMatchedSymbol != ')')
			{
				result.addChild(parse(tokens, tc))
				tokens.pop()
			}

			return result
		}

		private function parseTerm(operator:String, lfs:Node, terminators:TerminatorContainer, tokens:Queue):Node
		{
			Utils.assertContains(['+', '-'], operator)

			var op:Node = new FunctionNode(operator)
			var tc:TerminatorContainer
			if (lfs == null) // lfs may be null. e.g. "-1", "(+ 2 - 3) * 2"
			{
				tc = terminators.combine('+', '-', '*', '/')
				op.addChild(parse(tokens, tc))

				return op
			}

			tc = terminators.combine('+', '-')
			op.addChild(lfs)
			op.addChild(parse(tokens, tc))

			var terminator:String = tc.lastMatchedSymbol

			if (terminator == '+' || terminator == '-')
			{
				Utils.assertEquals(tokens.pop(), terminator)
				op = parseTerm(terminator, op, terminators, tokens)
			}
			return op
		}

		private function parseFactor(operator:String, lfs:Node, terminators:TerminatorContainer, tokens:Queue):Node
		{
			Utils.assertContains(['*', '/'], operator)

			var op:Node = new FunctionNode(operator)
			op.addChild(lfs)

			var token:String = tokens.pop() as String

			if (token == null)
				throw new InvalidExpressionError("Expect one more token at least.")

			if (isNumber(token))
				op.addChild(new NumberNode(token))
			else if (isVariable(token))
				op.addChild(parseVariable(token, tokens))
			else if (token == '(')
			{
				op.addChild(parse(tokens, new TerminatorContainer(')')))
				Utils.assertEquals(tokens.pop(), ')')
			}
			else
				throw new UnexpectedTokenError(token)

			if (tokens.head() == '*' || tokens.head() == '/')
			{
				token = tokens.pop() as String
				op = parseFactor(token, op, terminators, tokens)
			}

			return op
		}

		public static function isNumber(token:String):Boolean
		{
			return Utils.isDigit(token.charAt(0))
		}

		public static function isVariable(token:String):Boolean
		{
			return Utils.isLetter(token.charAt(0))
		}
	}
}

class TerminatorContainer
{
	private var _terminators:Array
	private var _lastMatchedSymbol:String = null

	function TerminatorContainer(...rest)
	{
		_terminators = rest
	}

	public function match(symbol:String):Boolean
	{
		if (_terminators.indexOf(symbol) < 0)
			return false
		_lastMatchedSymbol = symbol
		return true
	}

	public function get lastMatchedSymbol():String
	{
		return _lastMatchedSymbol;
	}

	private function add(symbol:String):void
	{
		_terminators.push(symbol)
	}

	public function combine(...rest):TerminatorContainer
	{
		var tc:TerminatorContainer = new TerminatorContainer
		for each(var s1:String in _terminators)
			tc.add(s1)

		for each(var s2:String in rest)
			tc.add(s2)

		return tc
	}
}