accessing
removeProperty: aString
	^properties removeKey: aString ifAbsent: [nil]