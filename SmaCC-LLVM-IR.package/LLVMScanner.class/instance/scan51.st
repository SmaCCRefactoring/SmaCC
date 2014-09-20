generated
scan51
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	currentCharacter = $i
		ifTrue: [ ^ self scan52 ].
	currentCharacter = $l
		ifTrue: [ ^ self scan53 ].
	currentCharacter = $r
		ifTrue: [ 
			self recordMatch: #(59).
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $u
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(258) ].
					currentCharacter = $l
						ifTrue: [ 
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(258) ].
							currentCharacter = $t
								ifTrue: [ 
									self step.
									currentCharacter = $:
										ifTrue: [ ^ self recordAndReportMatch: #(258) ].
									currentCharacter = $i
										ifTrue: [ 
											self step.
											currentCharacter = $:
												ifTrue: [ ^ self recordAndReportMatch: #(258) ].
											currentCharacter = $n
												ifTrue: [ 
													self recordMatch: #(26).
													self step.
													currentCharacter = $:
														ifTrue: [ ^ self recordAndReportMatch: #(258) ] ].
											(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
												ifTrue: [ ^ self scan5 ].
											^ self reportLastMatch ] ].
							(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
								ifTrue: [ ^ self scan5 ].
							^ self reportLastMatch ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $y
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			currentCharacter = $v
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(258) ].
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(258) ].
							currentCharacter = $l
								ifTrue: [ 
									self recordMatch: #(143).
									self step.
									currentCharacter = $:
										ifTrue: [ ^ self recordAndReportMatch: #(258) ].
									(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
										ifTrue: [ ^ self scan5 ].
									^ self reportLastMatch ] ].
					(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
						ifTrue: [ ^ self scan5 ].
					^ self reportLastMatch ] ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch