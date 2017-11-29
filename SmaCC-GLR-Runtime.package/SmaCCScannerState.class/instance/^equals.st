comparing
= anObject
	^ self class = anObject class
		and: [ self position = anObject position
				and: [ self state = anObject state ] ]