generated
scan30
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(257) ].
	currentCharacter = $c
		ifTrue: [ ^ self scan31 ].
	currentCharacter = $d
		ifTrue: [ ^ self scan32 ].
	currentCharacter = $l
		ifTrue: [ ^ self scan36 ].
	currentCharacter = $n
		ifTrue: [ ^ self scan39 ].
	currentCharacter = $p
		ifTrue: [ ^ self scan40 ].
	currentCharacter = $r
		ifTrue: [ ^ self scan41 ].
	currentCharacter = $s
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(257) ].
			currentCharacter = $h
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(257) ].
					currentCharacter = $r
						ifTrue: [ 
							self recordMatch: #(121).
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(257) ] ].
					(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
						ifTrue: [ ^ self scan9 ].
					^ self reportLastMatch ].
			currentCharacter = $m
				ifTrue: [ 
					self recordMatch: #(87).
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(257) ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan9 ].
			^ self reportLastMatch ].
	currentCharacter = $t
		ifTrue: [ ^ self scan46 ].
	currentCharacter = $v
		ifTrue: [ ^ self scan48 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan9 ].
	^ self reportLastMatch