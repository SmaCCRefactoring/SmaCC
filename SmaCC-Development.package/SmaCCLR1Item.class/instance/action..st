accessing
action: aSmaCCSymbol
	self isAtEnd
		ifTrue:
			[ (self symbol isStartingSymbol and: [ aSmaCCSymbol isEmptySymbol ])
				ifTrue: [ ^ SmaCCAcceptAction item: self ].
			(followers includes: aSmaCCSymbol)
				ifTrue: [ ^ SmaCCReduceAction item: self ] ]
		ifFalse:
			[ (rhs at: location) = aSmaCCSymbol
				ifTrue: [ ^ SmaCCShiftAction item: self ] ].
	^ SmaCCRejectAction item: self