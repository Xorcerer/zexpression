/**
 * Created with IntelliJ IDEA.
 * User: logan
 * Date: 12/11/12
 * Time: 3:47 PM
 * To change this template use File | Settings | File Templates.
 */
package logan.zExpression.errors
{
	public class CycleReferencesError extends Error
	{
		public function CycleReferencesError(dependenciesChain:Array)
		{
			super('"' + dependenciesChain.join('" depends on "') + '"')
		}
	}
}
