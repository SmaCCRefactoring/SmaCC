accessing
parseCsvLine: aString
	| readStream record value |
	aString isEmpty
		ifTrue: [ ^ nil ].
	record := OrderedCollection new.
	readStream := ReadStream on: aString.
	[ readStream atEnd ]
		whileFalse: [ 
			readStream peek = $"
				ifTrue: [ 
					readStream next.
					value := ''.
					[ 
					value := value , (readStream upTo: $").
					readStream peek = $" ]
						whileTrue: [ 
							value := value copyWith: $".
							readStream next ].
					readStream peekFor: $,.
					record add: value ]
				ifFalse: [ record add: (readStream upTo: $,) ] ].
	^ record