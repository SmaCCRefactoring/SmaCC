accessing
action: aSmaCCSymbol 
	location > rhs size 
		ifTrue: 
			[(symbol isStartingSymbol and: [aSmaCCSymbol isEmptySymbol]) 
				ifTrue: [^SmaCCAcceptAction new].
			(followers includes: aSmaCCSymbol) 
				ifTrue: [^SmaCCReduceAction symbol: symbol rhs: rhs]]
		ifFalse: [(rhs at: location) = aSmaCCSymbol ifTrue: [^SmaCCShiftAction new]].
	^SmaCCRejectAction new