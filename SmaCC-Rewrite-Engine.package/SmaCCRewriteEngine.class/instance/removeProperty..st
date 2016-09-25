accessing-properites
removeProperty: aString
	^ properties removeKey: aString ifAbsent: [ nil ]