# zExpression

A library to parse and evalate math expression with functions and
variables.

### Example:

ActionScript 3:
```actionscript
			var a:Number = 1

			var expSet:ExpressionSet = new ExpressionSet

			// Step 1: Parse expression strings.
			expSet.putExp('b', '1 + a')
			expSet.putExp('a', 'min(1, 10)')

			// Step 2: Set variables and functions
			expSet.setVariable('a', a)
			expSet.setFunction('min', Math.min) // min() is built-in actually, example only.

			// Step 3: Get the result. Step 2, 3 could be done repeatly.
			trace('b = ', expSet.getValue('b'))
```

Optional i18n variables support, by replacing the letterValidator, you
can make it support any language:

```actionscript
			var expSet:ExpressionSet = new ExpressionSet

			// Set a custom letter validator
			expSet.letterValidator = CnUtils.isLetterOrCnChar

			expSet.putExp('面包', '面粉 * 水')
			expSet.putExp('家庭', '爱情 + 面包')
			expSet.setVariable('爱情', 99)
			expSet.setVariable('面粉', 1)
			expSet.setVariable('水', 1)

			trace('家庭 = ', expSet.getValue('家庭'))
```

### Supported languages:
* ActionScript 3

### TODO:
* C# support.
* C++ support.
* More test cases.
