generated
scanSplit5
	self step.
	currentCharacter = $c
		ifTrue: [ 
			self step.
			currentCharacter = $e
				ifTrue: [ 
					self step.
					currentCharacter = $n
						ifTrue: [ 
							self step.
							currentCharacter = $a
								ifTrue: [ ^ self scanSplit1 ].
							currentCharacter = $|
								ifTrue: [ ^ self recordAndReportMatch: #(10) ].
							(currentCharacter <= Character tab
								or: [ 
									(currentCharacter between: Character pageUp and: Character newPage)
										or: [ 
											(currentCharacter between: (Character value: 14) and: $`)
												or: [ (currentCharacter between: $b and: ${) or: [ currentCharacter >= $} ] ] ] ])
								ifTrue: [ ^ self scan7 ].
							^ self reportLastMatch ].
					currentCharacter = $|
						ifTrue: [ ^ self recordAndReportMatch: #(10) ].
					(currentCharacter <= Character tab
						or: [ 
							(currentCharacter between: Character pageUp and: Character newPage)
								or: [ 
									(currentCharacter between: (Character value: 14) and: $m)
										or: [ (currentCharacter between: $o and: ${) or: [ currentCharacter >= $} ] ] ] ])
						ifTrue: [ ^ self scan7 ].
					^ self reportLastMatch ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: $d)
								or: [ (currentCharacter between: $f and: ${) or: [ currentCharacter >= $} ] ] ] ])
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: $b)
						or: [ (currentCharacter between: $d and: ${) or: [ currentCharacter >= $} ] ] ] ])
		ifTrue: [ ^ self scan7 ].
	^ self reportLastMatch