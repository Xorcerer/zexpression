# zExpression

A library to parse and evalate math expression with functions and
variables.

### Example:

ActionScript 3:

			var expectedResult:Number = a + 2 - (+3 * (+b - -c) * 2 * (Math.max(2, 1))) - Math.min(1, d_e)
			var exp:String =           'a + 2 - (+3 * (+b - -c) * 2 * (     max(2, 1))) -      min(1, d_e)'

			var tree:ASTree = ASTreeParser.parse(exp)
			tree.setVariable('a', a)
			tree.setVariable('b', b)
			tree.setVariable('c', c)
			tree.setVariable('d_e', d_e)
			tree.setFunction('min', Math.min) // min() is built-in
			actually, as well as max().
			var actualResult:Number = tree.calculate()

			trace(tree.toStringWithVariablesReplaced(), '=', actualResult)
			Utils.assert(expectedResult == actualResult)


### Supported languages:
* ActionScript 3

### TODO:
* C++ support.
* More test cases.
