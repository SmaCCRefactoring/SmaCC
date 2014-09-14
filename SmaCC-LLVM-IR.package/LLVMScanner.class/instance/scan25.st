generated
scan25
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(169) ].
	currentCharacter = $d
		ifTrue: [ ^ self scan26 ].
	currentCharacter = $l
		ifTrue: [ ^ self scan27 ].
	currentCharacter = $n
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(169) ].
			currentCharacter = $d
				ifTrue: [ 
					self recordMatch: #(41).
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(169) ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
	currentCharacter = $p
		ifTrue: [ ^ self scan29 ].
	currentCharacter = $s
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(169) ].
			currentCharacter = $h
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(169) ].
					currentCharacter = $r
						ifTrue: [ 
							self recordMatch: #(42).
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(169) ] ].
					(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
						ifTrue: [ ^ self scan3 ].
					^ self reportLastMatch ].
			currentCharacter = $m
				ifTrue: [ 
					self recordMatch: #(83).
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(169) ].
					(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
						ifTrue: [ ^ self scan3 ].
					^ self reportLastMatch ] ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch