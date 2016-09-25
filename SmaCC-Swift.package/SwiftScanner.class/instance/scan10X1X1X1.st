generated
scan10X1X1X1
	self recordMatch: #(86).
	self step.
	currentCharacter == $e
		ifTrue: [ self recordMatch: #(86).
			self step.
			currentCharacter == $d
				ifTrue: [ self recordMatch: #(86).
					self step.
					currentCharacter == $(
						ifTrue: [ self step.
							currentCharacter == $s
								ifTrue: [ (self scanForString: 'afe)')
										ifTrue: [ ^ self recordAndReportMatch: #(8) ].
									^ self reportLastMatch ].
							currentCharacter == $u
								ifTrue: [ (self scanForString: 'nsafe)')
										ifTrue: [ ^ self recordAndReportMatch: #(19) ] ].
							^ self reportLastMatch ].
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z)
								or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
						ifTrue: [ [ self recordMatch: #(86).
							self step.
							(currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z)
										or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
								whileTrue ].
					^ self reportLastMatch ].
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_
								or: [ (currentCharacter between: $a and: $c)
										or: [ currentCharacter between: $e and: $z ] ] ] ])
				ifTrue: [ [ self recordMatch: #(86).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z)
								or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $d)
								or: [ currentCharacter between: $f and: $z ] ] ] ])
		ifTrue: [ [ self recordMatch: #(86).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch