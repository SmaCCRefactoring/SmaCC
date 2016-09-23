accessing
nodeFor: aString
	^ nodes at: aString ifAbsent: [ nil ]