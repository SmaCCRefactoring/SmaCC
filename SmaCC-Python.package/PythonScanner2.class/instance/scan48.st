generated
scan48
	self recordMatch: #(71).
	self step.
	currentCharacter = $e
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $f
				ifTrue: [ 
					self recordMatch: #(24 71).
					self step.
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
						ifTrue: [ ^ self scan37 ].
					^ self reportLastMatch ].
			currentCharacter = $l
				ifTrue: [ 
					self recordMatch: #(1 71).
					self step.
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
						ifTrue: [ ^ self scan37 ].
					^ self reportLastMatch ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ 
							currentCharacter = $_
								or: [ 
									(currentCharacter between: $a and: $e)
										or: [ (currentCharacter between: $g and: $k) or: [ currentCharacter between: $m and: $z ] ] ] ] ])
				ifTrue: [ ^ self scan37 ].
			^ self reportLastMatch ].
	((currentCharacter between: $0 and: $9)
		or: [ 
			(currentCharacter between: $A and: $Z)
				or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $d) or: [ currentCharacter between: $f and: $z ] ] ] ])
		ifTrue: [ ^ self scan37 ].
	^ self reportLastMatch