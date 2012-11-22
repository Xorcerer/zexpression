package
{

	import flash.display.Sprite;
	import flash.text.TextField;

	import logan.zExpression.Utils;

	import logan.zExpression.astree.ASTree;
	import logan.zExpression.astree.ASTreeParser;

	public class Sample extends Sprite
	{

		public function Sample()
		{
			var textField:TextField = new TextField()
			textField.text = 'Please look at the traces.'
			addChild(textField)

			var a:Number = 1
			var b:Number = 2.5
			var c:Number = 3
			var d:Number = 10
			var expectedResult:Number = a + 2 - (+3 * (+b - -c) * 2 * (Math.max(2, 1))) - Math.min(1, d)
			var exp:String =           'a + 2 - (+3 * (+b - -c) * 2 * (     max(2, 1))) -      min(1, d)'

			var tree:ASTree = ASTreeParser.parse(exp)
			tree.setVariable('a', a)
			tree.setVariable('b', b)
			tree.setVariable('c', c)
			tree.setVariable('d', d)
			tree.setFunction('min', Math.min)
			var actualResult:Number = tree.calculate()

			trace(tree.toStringWithVariablesReplaced(), '=', actualResult)
			Utils.assert(expectedResult == actualResult)

			exp = '(123 * (1.3 + 1))'
			calc(exp)

			exp = '2 * (a + 3 * b)'
			calc(exp, {a: 1, b: 2.5})

			exp = '2 * PI'
			calc(exp)
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


	}
}
