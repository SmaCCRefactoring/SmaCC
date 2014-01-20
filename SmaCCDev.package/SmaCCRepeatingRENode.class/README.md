SmaCCRepeatingRENode represents a repeating node in a regular expression.

Instance Variables:
	maximumMatches	<Integer>	the minimum number of matches required
	minimumMatches	<Integer>	the maximum number of matches allowed. An infinite amount of matches is represented by (SmaCCRepeatingRENode finiteInfinity).
	node	<SmaCCRegularExpressionNode>	what we need to match