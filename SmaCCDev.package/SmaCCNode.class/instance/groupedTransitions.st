private
groupedTransitions
	^transitions inject: OrderedCollection new
		into: 
			[:sum :each | 
			(sum detect: [:edgeCollection | edgeCollection first canMergeWith: each]
				ifNone: [sum add: OrderedCollection new]) add: each.
			sum]