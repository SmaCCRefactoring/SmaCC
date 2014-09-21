generated
scan7
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(253).
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(257) ].
			^ self reportLastMatch ] ] repeat