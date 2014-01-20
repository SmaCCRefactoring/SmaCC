generated-scanner
scan5
	[ 
	self step.
	currentCharacter <= $! or: [ (currentCharacter between: $# and: $[) or: [ currentCharacter >= $] ] ] ] whileTrue.
	currentCharacter = $"
		ifTrue: [ ^ self recordAndReportMatch: #(97) ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			(currentCharacter = $"
				or: [ 
					currentCharacter = $'
						or: [ 
							(currentCharacter between: $0 and: $7)
								or: [ 
									currentCharacter = $\
										or: [ 
											currentCharacter = $b
												or: [ currentCharacter = $f or: [ currentCharacter = $n or: [ currentCharacter = $r or: [ currentCharacter = $t ] ] ] ] ] ] ] ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	^ self reportLastMatch