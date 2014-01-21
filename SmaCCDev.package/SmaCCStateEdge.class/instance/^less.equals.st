comparing
<= aSmaCCEdge
	^self class ~= aSmaCCEdge class
		or: [self transitionObjects first <= aSmaCCEdge transitionObjects first]