private
addFirst: anObject to: aCollection
	anObject isNil ifTrue: [^self].
	aCollection addFirst: anObject