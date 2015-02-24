generated
scanSplitSeq6
	currentCharacter = $p
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $r
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self recordMatch: #(30).
							self step.
							currentCharacter = $f
								ifTrue: [ 
									self recordMatch: #(30).
									self step.
									currentCharacter = $i
										ifTrue: [ 
											self recordMatch: #(30).
											self step.
											currentCharacter = $x
												ifTrue: [ 
													self recordMatch: #(17 30).
													self step ] ] ] ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(30).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $r
		ifTrue: [ 
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
											self step ] ] ].
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
									self step ] ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(30).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $s
		ifTrue: [ ^ self scanSplit4 ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(33) ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
		ifTrue: [ 
			[ 
			self recordMatch: #(28).
			self step.
			currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isLetter or: [ currentCharacter = $_ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(30).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
	^ self reportLastMatch