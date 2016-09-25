private
computeIndices
	indices := OrderedCollection new.
	1 to: rhs size do:
		[ :i | 
		| symbol |
		symbol := rhs at: i.
		(rhs variableNameForIndex: i) notNil
			ifTrue: [ indices add: i ]
			ifFalse: [ symbol returnsSingleVariable
					ifTrue: [ indices add: i ] ] ].
	^ indices