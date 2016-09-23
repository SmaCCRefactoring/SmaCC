comparing
= anObject
	^ self class = anObject class
		and:
			[ self variableName = anObject variableName
				and: [ self isCollection = anObject isCollection ] ]