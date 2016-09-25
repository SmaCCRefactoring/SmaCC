generated
scanForTokenX7
	self recordMatch: #(151).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $>
		ifTrue: [ self recordMatch: #(152).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(128) ] ].
	^ self reportLastMatch