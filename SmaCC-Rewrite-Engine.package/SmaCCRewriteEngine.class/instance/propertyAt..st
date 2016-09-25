accessing-properites
propertyAt: aString
	^ properties at: aString ifAbsent: [ nil ]