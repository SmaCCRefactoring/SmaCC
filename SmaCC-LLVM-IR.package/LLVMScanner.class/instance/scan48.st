generated
scan48
	self step.
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $q
				ifTrue: [ ^ self recordAndReportMatch: #(232) ].
			^ self reportLastMatch ].
	currentCharacter = $g
		ifTrue: [ 
			self step.
			currentCharacter = $e
				ifTrue: [ ^ self recordAndReportMatch: #(239) ].
			currentCharacter = $t
				ifTrue: [ ^ self recordAndReportMatch: #(237) ].
			^ self reportLastMatch ].
	currentCharacter = $l
		ifTrue: [ 
			self step.
			currentCharacter = $e
				ifTrue: [ ^ self recordAndReportMatch: #(244) ].
			currentCharacter = $t
				ifTrue: [ ^ self recordAndReportMatch: #(241) ].
			^ self reportLastMatch ].
	currentCharacter = $n
		ifTrue: [ 
			self step.
			currentCharacter = $e
				ifTrue: [ ^ self recordAndReportMatch: #(245) ].
			^ self reportLastMatch ].
	currentCharacter = $p
		ifTrue: [ 
			self step.
			currentCharacter = $a
				ifTrue: [ 
					self step.
					currentCharacter = $q
						ifTrue: [ 
							self step.
							currentCharacter = $u
								ifTrue: [ 
									self step.
									currentCharacter = $e
										ifTrue: [ ^ self recordAndReportMatch: #(149) ] ] ].
					^ self reportLastMatch ].
			currentCharacter = $t
				ifTrue: [ 
					self step.
					currentCharacter = $n
						ifTrue: [ 
							self step.
							currentCharacter = $o
								ifTrue: [ 
									self step.
									currentCharacter = $n
										ifTrue: [ 
											self step.
											currentCharacter = $e
												ifTrue: [ ^ self recordAndReportMatch: #(14) ] ] ].
							^ self reportLastMatch ].
					currentCharacter = $s
						ifTrue: [ 
							self step.
							currentCharacter = $i
								ifTrue: [ 
									self step.
									currentCharacter = $z
										ifTrue: [ 
											self step.
											currentCharacter = $e
												ifTrue: [ ^ self recordAndReportMatch: #(13) ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $r
		ifTrue: [ 
			self recordMatch: #(96).
			self step.
			currentCharacter = $d
				ifTrue: [ ^ self recordAndReportMatch: #(243) ] ].
	^ self reportLastMatch