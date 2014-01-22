compiling
removeUnnecessaryChanges
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
											and: [ (other changeObject sourceCodeAt: other selector) asString = other parseTree source asString ] ] ])
							ifTrue: [ 
								self
									removeChange: each;
									removeChange: other ] ]
							on: Error
							do: [ :ex | ex return ] ] ] ]