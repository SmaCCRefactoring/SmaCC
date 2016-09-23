compiling
removeUnnecessaryClassChanges
	| allChanges classChanges |
	allChanges := self changes changes copy.
	(allChanges
		allSatisfy: [ :each | (each isKindOf: RBCompositeRefactoryChange) not ])
		ifFalse: [ ^ self ].
	classChanges := allChanges
		select:
			[ :each | 
			(each isKindOf: RBAddClassChange)
				and:
					[ each changeClass notNil
						and: [ each changeClass superclass name = each superclassName ] ] ].
	classChanges
		do:
			[ :each | 
			| addVars variables existingVariables |
			addVars := allChanges
				select:
					[ :change | 
					(change isKindOf: RBAddInstanceVariableChange)
						and: [ each changeClass = change changeClass ] ].
			variables := addVars
				inject: Set new
				into:
					[ :sum :change | 
					sum
						add: change variable;
						yourself ].
			variables addAll: each instanceVariableNames.
			existingVariables := each changeClass instVarNames.
			(existingVariables size = variables size
				and:
					[ existingVariables asSortedCollection asArray
						= variables asSortedCollection asArray ])
				ifTrue:
					[ self removeChange: each.
					addVars do: [ :change | self removeChange: change ] ] ]