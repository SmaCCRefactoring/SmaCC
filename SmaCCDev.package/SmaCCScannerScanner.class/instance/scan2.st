generated-scanner
scan2
	self step.
	(currentCharacter <= $b or: [ (currentCharacter between: $d and: $w) or: [ currentCharacter >= $y ] ])
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $c
		ifTrue: [ 
			self step.
			(currentCharacter between: $A and: $Z)
				ifTrue: [ ^ self scan4 ].
			^ self reportLastMatch ].
	currentCharacter = $x
		ifTrue: [ 
			self step.
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $F) or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ ^ self scan4 ].
			^ self reportLastMatch ].
	^ self reportLastMatch