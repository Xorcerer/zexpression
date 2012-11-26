/**
 * User: logan
 * Date: 11/19/12
 * Time: 1:22 PM
 * Email: xorcererzc@gmail.com
 */
package logan.zExpression.astree
{
	import logan.zExpression.*;
	import logan.zExpression.astree.errors.UnknownCharError;

	public class Tokenizer
	{
		public function Tokenizer()
		{
		}

		public static function tokenize(expressionStr:String):Array
		{
			var tokens:Array = []
			var tokenizer:Tokenizer = new Tokenizer;
			for each(var char:String in expressionStr.split(''))
			{
				var token:String = tokenizer.inputChar(char)
				if (token != null)
					tokens.push(token)
			}
			tokens.push(tokenizer.popLastToken())

			return tokens
		}

		private var validExpression:Boolean = true;

		private var _untokenizedLetters:Array = [];
		private function get lastChar():String
		{
		    if (_untokenizedLetters.length == 0)
				return null
			return _untokenizedLetters[_untokenizedLetters.length - 1]
		}

		public function get finished():Boolean
		{
			return !validExpression || _untokenizedLetters == null
		}

		private var _currentTokenType:uint = Token.TYPE_NONE
		private var _dotOfNumberAppeared:Boolean = false

		/*
		 * Input chars one by one, return a not-null string if a token constructed.
		 */
		private function inputChar(currentChar:String):String
		{
			if (finished) return null

			isCharOrThrow(currentChar)

			switch (currentChar)
			{
				case '+':
				case '-':
				case '*':
				case '/':
				case ',':
					_currentTokenType = Token.TYPE_OPERATOR
					return getThenResetLastToken(currentChar)
				case '(':
					_currentTokenType = Token.TYPE_OPEN_PARENTHESIS
					return getThenResetLastToken(currentChar)
				case ')':
					_currentTokenType = Token.TYPE_CLOSE_PARENTHESIS
					return getThenResetLastToken(currentChar)
				case ' ':
					// Simply skip it.
					return null
			}

			if (Utils.isLetter(currentChar) || currentChar == "_")
			{
				if (_currentTokenType == Token.TYPE_VAR)
				{
					_untokenizedLetters.push(currentChar)
				}
				else
				{
					_currentTokenType = Token.TYPE_VAR
					return getThenResetLastToken(currentChar)
				}
			}

			else if (Utils.isDigit(currentChar))
			{
				if (_currentTokenType == Token.TYPE_VAR || _currentTokenType == Token.TYPE_NUMBER)
				{
					_untokenizedLetters.push(currentChar)
				}
				else
				{
					_currentTokenType = Token.TYPE_NUMBER
					_dotOfNumberAppeared = false
					return getThenResetLastToken(currentChar)
				}
			}

			else if (currentChar == '.')
			{
				if (_dotOfNumberAppeared)
				{
					validExpression = false
					throw Error('Too many dot "." in a number.')
				}

				if (_currentTokenType == Token.TYPE_NUMBER)
				{
					_dotOfNumberAppeared = true
					_untokenizedLetters.push(currentChar)
				}
			}
			else
			{
				throw new UnknownCharError(currentChar)
			}

			return null;
		}

		public function popLastToken():String
		{
			if (finished || _untokenizedLetters.length == 0) return null

			var lastToken:String = _untokenizedLetters.join('')
			_untokenizedLetters = null
			return lastToken
		}

		private function getThenResetLastToken(newChar:String):String
		{
			isCharOrThrow(newChar)

			var lastToken:String = _untokenizedLetters.join('')
			if  (isSpace(newChar))
				_untokenizedLetters = []
			else
				_untokenizedLetters = [newChar]
			return (lastToken.length > 0 ? lastToken : null)
		}

		private function isSpace(char:String):Boolean
		{
			isCharOrThrow(char)
			return char == ' '
		}

		private function isCharOrThrow(c:String):void
		{
			if (c == null || c.length > 1)
				throw ArgumentError("currentChar should be a single character string.")
		}
	}
}