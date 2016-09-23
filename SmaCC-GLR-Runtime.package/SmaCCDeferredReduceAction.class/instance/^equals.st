comparing
= anObject
	^ self class = anObject class
		and:
			[ self selector = anObject selector
				and: [ self arguments = anObject arguments ] ]