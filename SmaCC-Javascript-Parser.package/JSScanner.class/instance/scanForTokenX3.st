generated
scanForTokenX3
	self recordMatch: #(8).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	currentCharacter == $>
		ifTrue: [ self recordMatch: #(2).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(76) ].
			currentCharacter == $>
				ifTrue: [ self recordMatch: #(5).
					self step.
					currentCharacter == $=
						ifTrue: [ ^ self recordAndReportMatch: #(77) ] ] ].
	^ self reportLastMatch