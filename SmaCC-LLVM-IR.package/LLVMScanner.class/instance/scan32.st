generated
scan32
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	currentCharacter = $i
		ifTrue: [ ^ self scan33 ].
	currentCharacter = $l
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			currentCharacter = $o
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(258) ].
					currentCharacter = $c
						ifTrue: [ 
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(258) ].
							currentCharacter = $a
								ifTrue: [ 
									self recordMatch: #(42).
									self step.
									currentCharacter = $:
										ifTrue: [ ^ self recordAndReportMatch: #(258) ] ].
							(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
								ifTrue: [ ^ self scan5 ].
							^ self reportLastMatch ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $w
		ifTrue: [ ^ self scan34 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch