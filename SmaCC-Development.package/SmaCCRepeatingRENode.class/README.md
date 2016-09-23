SmaCCRepeatingRENode is a SmaCCRegularExpressionNode that matches a particular RE node multiple times.

Instance Variables:
	maximumMatches	<Integer>	the maximum amount of matches (or #finiteInfinity if we can repeat unlimited number of times)
	minimumMatches	<Integer>	the minimum amount of matches we must accept
	node	<SmaCCRegularExpressionNode>	the node we are matching