comparing
= anObject
	^ self == anObject
		or:
			[ self class = anObject class
				and:
					[ self stateStack = anObject stateStack
						and: [ self nodeStack = anObject nodeStack ] ] ]