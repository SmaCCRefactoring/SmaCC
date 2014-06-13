generated
scan24
	self recordMatch: #(30).
	self step.
	currentCharacter = $i
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $g
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $h
						ifTrue: [ 
							self recordMatch: #(30).
							self step.
							currentCharacter = $t
								ifTrue: [ 
									self recordMatch: #(20 30).
									self step ].
							(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
								ifTrue: [ 
									[ 
									self recordMatch: #(30).
									self step.
									currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
							^ self reportLastMatch ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(30).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $o
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $o
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $t
						ifTrue: [ 
							self recordMatch: #(14 30).
							self step ].
					(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
						ifTrue: [ 
							[ 
							self recordMatch: #(30).
							self step.
							currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
					^ self reportLastMatch ] ].
	(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(30).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
	^ self reportLastMatch