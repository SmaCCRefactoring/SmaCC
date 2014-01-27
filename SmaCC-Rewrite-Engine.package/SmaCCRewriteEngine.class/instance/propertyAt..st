accessing
propertyAt: aString
	^properties at: aString ifAbsent: [nil]