package
{

	import flash.display.Sprite;
	import flash.text.TextField;

	import logan.zExpression.ASTree;
	import logan.zExpression.ASTreeParser;

	public class Sample extends Sprite
	{

		public function Sample()
		{
			var textField:TextField = new TextField()
			textField.text = 'Please look at the traces.'
			addChild(textField)

			var exp:String = 'a + 2 - (3 * b - c)'
			var tree:ASTree = ASTreeParser.parse(exp)
			tree.setVariable('a', 1)
			tree.setVariable('b', 2.5)
			tree.setVariable('c', 3)
			trace(exp, '=', tree.calculate())

			exp = '123 * (1.3 + 1)'
			calc(exp)

			exp = '2 * (a + 3 * b)'
			calc(exp, {a: 1, b: 2.5})

			exp = '2 * PI'
			calc(exp)
		}

		private function calc(exp:String, variables:Object = null):void
		{
			var tree:ASTree = ASTreeParser.parse(exp)
			if (variables != null)
				for(var key:String in variables)
					tree.setVariable(key, variables[key])

			trace('tree in reversed polish: ', tree)
			trace(exp, '=', tree.calculate())
		}


	}
}
