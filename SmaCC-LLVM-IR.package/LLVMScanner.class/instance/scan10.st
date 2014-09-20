generated
scan10
	self step.
	currentCharacter = $.
		ifTrue: [ 
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self recordAndReportMatch: #(29) ] ].
	^ self reportLastMatch