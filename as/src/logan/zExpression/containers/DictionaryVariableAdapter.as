package logan.zExpression.containers
{
	public class DictionaryVariableAdapter implements IVariableAdapter
	{
		private var _dictionary:Object
		public function DictionaryVariableAdapter(dict:Object)
		{
			_dictionary = dict
		}

		public function getValue(variableName:String):Number
		{
			return _dictionary[variableName]
		}
	}
}
