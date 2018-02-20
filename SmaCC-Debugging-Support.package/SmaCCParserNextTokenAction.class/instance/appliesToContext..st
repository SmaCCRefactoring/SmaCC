testing
appliesToContext: aContext
	^ (super appliesToContext: aContext)
		and: [ self session parser atEnd not ]