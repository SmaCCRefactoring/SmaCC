generated
scan44
	self recordMatch: #(77).
	self step.
	currentCharacter = $e
		ifTrue: [ 
			self recordMatch: #(77).
			self step.
			currentCharacter = $f
				ifTrue: [ 
					self recordMatch: #(22 77).
					self step.
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
						ifTrue: [ ^ self scan34 ].
					^ self reportLastMatch ].
			currentCharacter = $l
				ifTrue: [ 
					self recordMatch: #(1 77).
					self step.
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
						ifTrue: [ ^ self scan34 ].
					^ self reportLastMatch ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ 
							currentCharacter = $_
								or: [ 
									(currentCharacter between: $a and: $e)
										or: [ (currentCharacter between: $g and: $k) or: [ currentCharacter between: $m and: $z ] ] ] ] ])
				ifTrue: [ ^ self scan34 ].
			^ self reportLastMatch ].
	((currentCharacter between: $0 and: $9)
		or: [ 
			(currentCharacter between: $A and: $Z)
				or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $d) or: [ currentCharacter between: $f and: $z ] ] ] ])
		ifTrue: [ ^ self scan34 ].
	^ self reportLastMatch