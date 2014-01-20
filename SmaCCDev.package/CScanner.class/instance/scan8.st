generated-scanner
scan8
	[ 
	self step.
	currentCharacter <= $!
		or: [ (currentCharacter between: $# and: $&) or: [ (currentCharacter between: $( and: $[) or: [ currentCharacter >= $] ] ] ] ]
		whileTrue.
	currentCharacter = $'
		ifTrue: [ 
			[ 
			self recordMatch: #(77).
			self step.
			(currentCharacter <= $!
				or: [ (currentCharacter between: $# and: $&) or: [ (currentCharacter between: $( and: $[) or: [ currentCharacter >= $] ] ] ])
				ifTrue: [ ^ self scan8 ].
			currentCharacter = $' ] whileTrue.
			currentCharacter = $\
				ifTrue: [ ^ self scan9 ].
			^ self reportLastMatch ].
	currentCharacter = $\
		ifTrue: [ ^ self scan9 ].
	^ self reportLastMatch