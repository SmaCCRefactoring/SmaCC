private
mergeCaseSensitiveKeywords
	| duplicateMap |
	duplicateMap := Dictionary new.
	self symbols
		do:
			[ :each | 
			(each isTerminal and: [ each name first = $" ])
				ifTrue:
					[ (duplicateMap
						at: each name asUppercase
						ifAbsentPut: [ OrderedCollection new ]) add: each ] ].
	duplicateMap
		keysAndValuesDo: [ :name :value | 
			value size > 1
				ifTrue: [ self mergeAll: value ] ]