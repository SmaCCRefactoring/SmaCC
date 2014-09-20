generated
scan54
	self step.
	currentCharacter = $"
		ifTrue: [ 
			[ 
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self recordAndReportMatch: #(262) ] ] repeat ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(257) ].
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(257) ].
			currentCharacter = $l
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(257) ].
					currentCharacter = $l
						ifTrue: [ 
							self recordMatch: #(222).
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(257) ] ].
					(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
						ifTrue: [ ^ self scan5 ].
					^ self reportLastMatch ].
			currentCharacter = $t
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(257) ].
					currentCharacter = $c
						ifTrue: [ 
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(257) ].
							currentCharacter = $h
								ifTrue: [ 
									self recordMatch: #(228).
									self step.
									currentCharacter = $:
										ifTrue: [ ^ self recordAndReportMatch: #(257) ] ].
							(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
								ifTrue: [ ^ self scan5 ].
							^ self reportLastMatch ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $c
		ifTrue: [ 
			self recordMatch: #(165).
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(257) ].
			currentCharacter = $c
				ifTrue: [ 
					self recordMatch: #(170).
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(257) ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $l
		ifTrue: [ ^ self scan55 ].
	currentCharacter = $m
		ifTrue: [ ^ self scan56 ].
	currentCharacter = $o
		ifTrue: [ ^ self scan57 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch