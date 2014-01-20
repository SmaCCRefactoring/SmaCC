accessing
parentOfType: aSmaCCParseNodeClassOrCollection
	^ parent notNil
		ifTrue: [ parent nodeOfType: aSmaCCParseNodeClassOrCollection ]
		ifFalse: [ nil ]