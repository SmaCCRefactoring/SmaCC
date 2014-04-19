accessing
tokenStack
	^ tokenStack ifNil: [ tokenStack := OrderedCollection new ]