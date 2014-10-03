removing
remove: aCharacter ifAbsent: aBlock
	(self includes: aCharacter)
		ifFalse: [ ^ aBlock value ].
	super remove: aCharacter asInteger ifAbsent: aBlock.
	^ aCharacter