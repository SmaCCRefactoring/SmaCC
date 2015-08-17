private
basicModelTypes: aSet
	| types isCollection |
	isCollection := false.
	types := Set new.
	self indices size <= 1
		ifTrue: [ 
			rhs productionSymbol
				productionsDo: [ :each | 
					(isCollection := isCollection or: [ each reduceAction indices size > 1 ])
						ifFalse: [ 
							each reduceAction indices notEmpty
								ifTrue: [ types addAll: (each reduceAction basicModelTypes: aSet forIndex: each reduceAction indices first) ] ] ] ]
		ifFalse: [ isCollection := true ].
	^ isCollection
		ifTrue: [ Array with: (self model classFor: OrderedCollection) ]
		ifFalse: [ types asArray ]