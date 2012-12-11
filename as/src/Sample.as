package
{

	import flash.display.Sprite;
	import flash.text.TextField;

	import logan.zExpression.Utils;
	import logan.zExpression.astree.ASTree;
	import logan.zExpression.astree.ASTreeParser;
	import logan.zExpression.astree.errors.InvalidExpressionError;
	import logan.zExpression.astree.errors.UnexpectedCharError;
	import logan.zExpression.astree.errors.UnexpectedTokenError;
	import logan.zExpression.containers.ExpressionSet;

	public class Sample extends Sprite
	{

		public function Sample()
		{
			TestSingleExpression()
			TestMultiExpressions()
		}

		private function TestSingleExpression():void
		{
			var textField:TextField = new TextField()
			textField.text = 'Please look at the traces.'
			addChild(textField)

			var a:Number = 1
			var b:Number = 2.5
			var c:Number = 3
			var d_e:Number = 10
			var expectedResult:Number = a + 2 - (+3.0 * (+b - -c) * 2 / (Math.max(2, 1))) - Math.min(1, d_e)
			var exp:String = 'a + 2 - (+3.0 * (+b - -c) * 2 / (     max(2, 1))) -      min(1, d_e)'

			var tree:ASTree = ASTreeParser.parse(exp)
			tree.setVariable('a', a)
			tree.setVariable('b', b)
			tree.setVariable('c', c)
			tree.setVariable('d_e', d_e)
			tree.setFunction('min', Math.min)
			var actualResult:Number = tree.calculate()

			trace(tree.toStringWithVariablesReplaced(), '=', actualResult)
			Utils.assert(expectedResult == actualResult)

			// TODO: Tests for each details.

			exp = '(123 * (1.3 + 1))'
			calc(exp)

			exp = '2 * (a + 3 * b)'
			calc(exp, {a:1, b:2.5})

			exp = '2 * PI'
			calc(exp)

			var errorExp:String
			errorExp = '1 + 1.1.1 * 2'
			parseAndExpectError(errorExp, UnexpectedCharError)

			errorExp = '1 + 1) * 2'
			parseAndExpectError(errorExp, UnexpectedTokenError)
		}

		private function TestMultiExpressions():void
		{
			var expSet:ExpressionSet = new ExpressionSet
			expSet.addExp('b', '1 + a')
			expSet.addExp('a', '1 + 1')

			trace('b = ', expSet.getValue('b'))
		}

		private static function calc(exp:String, variables:Object = null):void
		{
			var tree:ASTree = ASTreeParser.parse(exp)
			if (variables != null)
				for(var key:String in variables)
					tree.setVariable(key, variables[key])

			trace('tree in reversed polish: ', tree)
			trace(tree.toStringWithVariablesReplaced(), '=', tree.calculate())
		}

		private static function parseAndExpectError(exp:String, errorType:Class):void
		{
			try
			{
				ASTreeParser.parse(exp)
			}
			catch (e:InvalidExpressionError)
			{
				if (!(e is errorType))
					throw e
				trace('Caught error ', errorType)
				trace(e.messageWithErrorIndicator)
				return
			}
			Utils.assert(false, 'No expected error thrown!')
		}
	}
}
