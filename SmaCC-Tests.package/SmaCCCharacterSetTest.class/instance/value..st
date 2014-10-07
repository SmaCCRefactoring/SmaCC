private
value: anInteger
	^ Character
		value:
			(self supportsLargeValues
				ifTrue: [ anInteger ]
				ifFalse: [ anInteger bitAnd: 16rFF ])