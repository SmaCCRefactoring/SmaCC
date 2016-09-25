accessing
type
	^ self isCollection
		ifTrue: [ self collectionType ]
		ifFalse: [ self baseType ]