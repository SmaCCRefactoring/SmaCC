accessing
matchingCharacters
	^ignoreCase ifTrue: [characters reject: [:each | each isLowercase]] ifFalse: [characters]