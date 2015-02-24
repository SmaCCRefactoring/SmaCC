generated
scanSplit8
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $#
		ifTrue: [ 
			[ 
			self recordMatch: #(32).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $%
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $'
		ifTrue: [ ^ self scan4 ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter = $*
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter = $+
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter = $/
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $:
		ifTrue: [ ^ self scan8 ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(37) ].
	currentCharacter = $<
		ifTrue: [ ^ self scan10 ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter = $a
		ifTrue: [ ^ self scanSplit1 ].
	currentCharacter = $e
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $r
				ifTrue: [ ^ self scan13 ].
			currentCharacter = $x
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $c
						ifTrue: [ 
							self recordMatch: #(30).
							self step.
							currentCharacter = $l
								ifTrue: [ 
									self recordMatch: #(30).
									self step.
									currentCharacter = $u
										ifTrue: [ 
											self recordMatch: #(30).
											self step.
											currentCharacter = $d
												ifTrue: [ 
													self recordMatch: #(30).
													self step.
													currentCharacter = $e
														ifTrue: [ 
															self recordMatch: #(30).
															self step.
															currentCharacter = $s
																ifTrue: [ 
																	self recordMatch: #(13 30).
																	self step ] ] ] ] ] ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(30).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $g
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $l
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $r
						ifTrue: [ 
							self recordMatch: #(24 30).
							self step ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(30).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	^ self scanSplitSeq7