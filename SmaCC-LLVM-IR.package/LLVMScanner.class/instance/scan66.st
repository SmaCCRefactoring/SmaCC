generated
scan66
	self recordMatch: #(148).
	self step.
	currentCharacter = $8
		ifTrue: [ ^ self scan67 ].
	currentCharacter = $c
		ifTrue: [ 
			self step.
			currentCharacter = $h
				ifTrue: [ 
					self step.
					currentCharacter = $g
						ifTrue: [ ^ self recordAndReportMatch: #(206) ] ].
			^ self reportLastMatch ].
	currentCharacter = $o
		ifTrue: [ 
			self step.
			currentCharacter = $r
				ifTrue: [ ^ self recordAndReportMatch: #(95) ] ].
	^ self reportLastMatch