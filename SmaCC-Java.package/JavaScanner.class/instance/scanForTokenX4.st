generated
scanForTokenX4
	self recordMatch: #(95).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(55) ].
	currentCharacter == $>
		ifTrue: [ self recordMatch: #(96).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(64) ].
			currentCharacter == $>
				ifTrue: [ self recordMatch: #(97).
					self step.
					currentCharacter == $=
						ifTrue: [ ^ self recordAndReportMatch: #(63) ] ] ].
	^ self reportLastMatch