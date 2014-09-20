generated
scan16
	2
		timesRepeat: [ 
			self step.
			currentCharacter = $.
				ifFalse: [ 
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(258) ].
					(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
						ifTrue: [ ^ self scan5 ].
					^ self reportLastMatch ] ].
	self recordMatch: #(29).
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch