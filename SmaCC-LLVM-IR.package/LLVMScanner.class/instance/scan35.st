generated
scan35
	self step.
	currentCharacter = $c
		ifTrue: [ 
			self step.
			currentCharacter = $m
				ifTrue: [ 
					self step.
					currentCharacter = $p
						ifTrue: [ ^ self recordAndReportMatch: #(76) ] ].
			^ self reportLastMatch ].
	currentCharacter = $n
		ifTrue: [ ^ self scan36 ].
	^ self reportLastMatch