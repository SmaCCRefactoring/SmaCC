generated
scan15
	2
		timesRepeat: [ 
			self step.
			currentCharacter = $.
				ifFalse: [ 
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(170) ].
					(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
						ifTrue: [ ^ self scan4 ].
					^ self reportLastMatch ] ].
	self recordMatch: #(148).
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(170) ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch