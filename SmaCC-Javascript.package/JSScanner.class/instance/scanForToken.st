generated
scanForToken
	self step.
	currentCharacter = $!
		ifTrue: [ 
			self recordMatch: #(3).
			self step.
			currentCharacter = $=
				ifTrue: [ 
					self recordMatch: #(12).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(39) ] ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(1).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(67) ].
			^ self reportLastMatch ].
	^ self scanSplitSeq2