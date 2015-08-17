algorithm
mergeNodeUsing: aDictionary
	| seen todo mappings |
	mappings := Dictionary new.
	aDictionary keysAndValuesDo: [ :key :value | value do: [ :each | mappings at: each put: key ] ].
	seen := IdentitySet new.
	todo := OrderedCollection with: root.
	[ todo notEmpty ]
		whileTrue: [ 
			| node mergedNode |
			node := todo removeFirst.
			node transitions
				do: [ :each | 
					(seen includes: each to)
						ifFalse: [ 
							todo add: each to.
							seen add: each to ] ].
			mergedNode := mappings at: node ifAbsent: [ nil ].
			mergedNode notNil
				ifTrue: [ node mergeWith: mergedNode ] ]