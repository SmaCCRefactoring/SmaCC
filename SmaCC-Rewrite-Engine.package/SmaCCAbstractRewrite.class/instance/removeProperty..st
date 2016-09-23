accessing-properites
removeProperty: aString
	^ self properties removeKey: aString ifAbsent: [ nil ]