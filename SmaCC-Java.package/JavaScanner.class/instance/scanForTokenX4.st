generated
scanForTokenX4
	self recordMatch: #(96).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(56) ].
	currentCharacter == $>
		ifTrue: [ self recordMatch: #(97).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(66) ].
			currentCharacter == $>
				ifTrue: [ self recordMatch: #(98).
					self step.
					currentCharacter == $=
						ifTrue: [ ^ self recordAndReportMatch: #(61) ] ] ].
	^ self reportLastMatch