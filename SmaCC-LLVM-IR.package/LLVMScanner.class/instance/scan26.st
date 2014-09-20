generated
scan26
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	currentCharacter = $c
		ifTrue: [ ^ self scan27 ].
	currentCharacter = $d
		ifTrue: [ ^ self scan28 ].
	currentCharacter = $l
		ifTrue: [ ^ self scan32 ].
	currentCharacter = $n
		ifTrue: [ ^ self scan35 ].
	currentCharacter = $p
		ifTrue: [ ^ self scan36 ].
	currentCharacter = $r
		ifTrue: [ ^ self scan37 ].
	currentCharacter = $s
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			currentCharacter = $h
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(258) ].
					currentCharacter = $r
						ifTrue: [ 
							self recordMatch: #(122).
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(258) ] ].
					(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
						ifTrue: [ ^ self scan5 ].
					^ self reportLastMatch ].
			currentCharacter = $m
				ifTrue: [ 
					self recordMatch: #(88).
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(258) ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $t
		ifTrue: [ ^ self scan42 ].
	currentCharacter = $v
		ifTrue: [ ^ self scan44 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch