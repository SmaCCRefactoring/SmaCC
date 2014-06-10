generated
scan5
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self step.
			currentCharacter = $"
				ifTrue: [ 
					self step.
					currentCharacter = $"
						ifTrue: [ 
							self step.
							currentCharacter = Character cr
								ifTrue: [ 
									self step.
									currentCharacter = Character lf
										ifTrue: [ ^ self recordAndReportMatch: #(7) ].
									^ self reportLastMatch ].
							((currentCharacter between: Character tab and: Character lf) or: [ currentCharacter = Character space ])
								ifTrue: [ ^ self recordAndReportMatch: #(7) ] ] ].
			^ self reportLastMatch ].
	currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
	^ self reportLastMatch