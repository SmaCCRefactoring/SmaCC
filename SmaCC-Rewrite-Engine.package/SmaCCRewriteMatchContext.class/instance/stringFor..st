accessing
stringFor: aString
	^ (strings at: aString ifAbsent: [ [ '' ] ]) value