generated
scanSplit6
	self recordMatch: #(30).
	self step.
	currentCharacter = $t
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $a
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $r
						ifTrue: [ 
							self recordMatch: #(30).
							self step.
							currentCharacter = $t
								ifTrue: [ 
									self recordMatch: #(23 30).
									self step ].
							(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
								ifTrue: [ 
									[ 
									self recordMatch: #(30).
									self step.
									currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
							^ self reportLastMatch ].
					currentCharacter = $t
						ifTrue: [ 
							self recordMatch: #(30).
							self step.
							currentCharacter = $e
								ifTrue: [ 
									self recordMatch: #(30).
									self step.
									currentCharacter = $s
										ifTrue: [ 
											self recordMatch: #(12 30).
											self step ] ] ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(30).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $u
		ifTrue: [ 
			2
				timesRepeat: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $f
						ifFalse: [ ^ self reportLastMatch ] ].
			self recordMatch: #(30).
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $x
						ifTrue: [ 
							self recordMatch: #(18 30).
							self step ] ] ].
	(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(30).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
	^ self reportLastMatch