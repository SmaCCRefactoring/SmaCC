generated
scanForToken
	self step.
	currentCharacter = $!
		ifTrue: [ 
			self recordMatch: #(29).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(1) ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(33).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(11) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(82) ].
			^ self reportLastMatch ].
	currentCharacter = $&
		ifTrue: [ 
			self recordMatch: #(34).
			self step.
			currentCharacter = $&
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(64) ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(26) ].
	^ self scanSplitSeq2