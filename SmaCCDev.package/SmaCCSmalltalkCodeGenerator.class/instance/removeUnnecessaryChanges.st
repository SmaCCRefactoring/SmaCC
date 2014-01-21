compiling
removeUnnecessaryChanges
	| allChanges |
	allChanges := self changes changes copy.
	(allChanges allSatisfy: [:each | (each isKindOf: CompositeRefactoryChange) not]) ifFalse: [^self].
	allChanges
		keysAndValuesDo:
			[:key :each | 
			(each isKindOf: RemoveMethodChange)
				ifTrue:
					[key + 1
						to: allChanges size
						do:
							[:i | 
							| other |
							other := allChanges at: i.
							[((other isKindOf: AddMethodChange)
								and:
									[each selector = other selector
										and:
											[each changeClassName = other changeClassName
												and: [(other changeObject sourceCodeAt: other selector) asString = other parseTree source asString]]])
								ifTrue:
									[self
										removeChange: each;
										removeChange: other]] on: Error do: [:ex | ex return]]]]