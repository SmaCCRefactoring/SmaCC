comparing
= anObject
	^ self class = anObject class and: [ self rhs == anObject rhs ]