generated
scan194
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(257) ].
	currentCharacter = $a
		ifTrue: [ ^ self scan195 ].
	currentCharacter = $p
		ifTrue: [ 
			self step.
			currentCharacter = $8
				ifTrue: [ 
					self step.
					currentCharacter = $0
						ifTrue: [ 
							self recordMatch: #(126).
							self step ] ].
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(257) ] ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch