private
isTerminalNode
	^transitions isEmpty or: [transitions size = 1 and: [self hasSimpleLoop]]