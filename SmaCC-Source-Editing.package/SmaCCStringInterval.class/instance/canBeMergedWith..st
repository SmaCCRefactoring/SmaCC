public
canBeMergedWith: nextSmaCCStringInterval
	^self id = nextSmaCCStringInterval id
		and: [self isRemoved = nextSmaCCStringInterval isRemoved and: [self stop + 1 = nextSmaCCStringInterval start]]