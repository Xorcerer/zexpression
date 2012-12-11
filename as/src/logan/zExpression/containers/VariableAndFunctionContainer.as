/**
 * Created with IntelliJ IDEA.
 * User: logan
 * Date: 12/11/12
 * Time: 2:24 PM
 * To change this template use File | Settings | File Templates.
 */
package logan.zExpression.containers
{
	import flash.utils.Dictionary;

	public class VariableAndFunctionContainer
	{
		protected var _variables:Dictionary = new Dictionary

		protected var _functions:Dictionary = new Dictionary

		public function VariableAndFunctionContainer()
		{
		}

		public function setVariable(name:String, value:Number):void
		{
			_variables[name] = value
		}

		public function setFunction(name:String, value:Function):void
		{
			_functions[name] = value
		}
	}
}
