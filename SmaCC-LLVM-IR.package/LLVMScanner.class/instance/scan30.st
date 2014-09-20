generated
scan30
	self step.
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $d
				ifTrue: [ 
					self step.
					currentCharacter = $d
						ifTrue: [ ^ self recordAndReportMatch: #(123) ].
					^ self reportLastMatch ].
			currentCharacter = $s
				ifTrue: [ 
					self step.
					currentCharacter = $t
						ifTrue: [ 
							self recordMatch: #(44).
							2
								timesRepeat: [ 
									self step.
									currentCharacter = $c
										ifFalse: [ ^ self reportLastMatch ] ].
							^ self recordAndReportMatch: #(173) ] ].
			^ self reportLastMatch ].
	currentCharacter = $c
		ifTrue: [ 
			self step.
			currentCharacter = $m
				ifTrue: [ 
					self step.
					currentCharacter = $p
						ifTrue: [ ^ self recordAndReportMatch: #(75) ] ].
			^ self reportLastMatch ].
	currentCharacter = $d
		ifTrue: [ ^ self scan31 ].
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $n
				ifTrue: [ 
					self step.
					currentCharacter = $c
						ifTrue: [ 
							self step.
							currentCharacter = $e
								ifTrue: [ ^ self recordAndReportMatch: #(202) ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $i
		ifTrue: [ 
			self step.
			currentCharacter = $l
				ifTrue: [ 
					self step.
					currentCharacter = $t
						ifTrue: [ 
							self step.
							currentCharacter = $e
								ifTrue: [ 
									self step.
									currentCharacter = $r
										ifTrue: [ ^ self recordAndReportMatch: #(231) ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $l
		ifTrue: [ 
			self step.
			currentCharacter = $o
				ifTrue: [ 
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $t
								ifTrue: [ ^ self recordAndReportMatch: #(131) ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $m
		ifTrue: [ 
			self step.
			currentCharacter = $u
				ifTrue: [ 
					self step.
					currentCharacter = $l
						ifTrue: [ ^ self recordAndReportMatch: #(118) ] ].
			^ self reportLastMatch ].
	currentCharacter = $p
		ifTrue: [ ^ self scan32 ].
	currentCharacter = $r
		ifTrue: [ 
			self step.
			currentCharacter = $e
				ifTrue: [ 
					self step.
					currentCharacter = $m
						ifTrue: [ ^ self recordAndReportMatch: #(98) ] ].
			^ self reportLastMatch ].
	currentCharacter = $s
		ifTrue: [ 
			self step.
			currentCharacter = $u
				ifTrue: [ 
					self step.
					currentCharacter = $b
						ifTrue: [ ^ self recordAndReportMatch: #(119) ] ] ].
	^ self reportLastMatch