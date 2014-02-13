compiling
removeUnnecessaryChanges
	"TODO: Rework this because :
		In the changes, classes are first redeclared without instance variables, method removed and then instance variables are added one by one and then the new methods. When this optimisation is applied, methods aren't removed and each class recompilation forces a recompilation of all methods with many Undeclared warnings for missing instance variables (and those instance variables will be added later)."

	| allChanges |
	allChanges := self changes changes copy.
	(allChanges allSatisfy: [ :each | (each isKindOf: RBCompositeRefactoryChange) not ])
		ifFalse: [ ^ self ].
	allChanges
		keysAndValuesDo: [ :key :each | 
			(each isKindOf: RBRemoveMethodChange)
				ifTrue: [ 
					key + 1 to: allChanges size do: [ :i | 
						| other |
						other := allChanges at: i.
						[ 
						((other isKindOf: RBAddMethodChange)
							and: [ 
								each selector = other selector
									and: [ 
										each changeClassName = other changeClassName
											and: [ (other methodSourceFor: other selector) asString = other parseTree source asString ] ] ])
							ifTrue: [ 
								self
									removeChange: each;
									removeChange: other ] ]
							on: Error
							do: [ :ex | ex return ] ] ] ]