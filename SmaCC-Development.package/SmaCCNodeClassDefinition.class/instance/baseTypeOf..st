private-variables
baseTypeOf: aVariableName
	| allTypes aRBRootNamespace |
	aRBRootNamespace := class model.
	allTypes := self modelTypesForVariable: aVariableName.
	allTypes
		remove: (aRBRootNamespace classFor: nil class)
		ifAbsent: [ nil ].
	allTypes isEmpty
		ifTrue: [ ^ aRBRootNamespace classFor: Object ].
	allTypes := allTypes asOrderedCollection.
	^ allTypes
		inject: allTypes first
		into:
			[ :sum :each | 
			| current |
			current := sum.
			[ current notNil and: [ (each includesClass: current) not ] ]
				whileTrue: [ current := current superclass ].
			current ]