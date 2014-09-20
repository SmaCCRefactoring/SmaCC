generated
scan187
	self step.
	currentCharacter = $0
		ifTrue: [ ^ self scan188 ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(257) ].
	currentCharacter = $d
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(257) ].
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(257) ].
					currentCharacter = $v
						ifTrue: [ 
							self recordMatch: #(111).
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(257) ].
							(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
								ifTrue: [ ^ self scan5 ].
							^ self reportLastMatch ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(257) ].
			currentCharacter = $q
				ifTrue: [ 
					self recordMatch: #(241).
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(257) ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $g
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(257) ].
			currentCharacter = $e
				ifTrue: [ 
					self recordMatch: #(207).
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(257) ].
					(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
						ifTrue: [ ^ self scan5 ].
					^ self reportLastMatch ].
			currentCharacter = $t
				ifTrue: [ 
					self recordMatch: #(193).
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(257) ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $i
		ifTrue: [ ^ self scan189 ].
	currentCharacter = $l
		ifTrue: [ ^ self scan190 ].
	currentCharacter = $m
		ifTrue: [ ^ self scan191 ].
	currentCharacter = $n
		ifTrue: [ ^ self scan192 ].
	currentCharacter = $r
		ifTrue: [ ^ self scan202 ].
	currentCharacter = $w
		ifTrue: [ ^ self scan203 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch