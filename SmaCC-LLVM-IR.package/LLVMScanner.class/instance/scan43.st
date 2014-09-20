generated
scan43
	self step.
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $k
				ifTrue: [ 
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self step.
							currentCharacter = $d
								ifTrue: [ ^ self recordAndReportMatch: #(12) ] ].
					^ self reportLastMatch ].
			currentCharacter = $n
				ifTrue: [ 
					self step.
					currentCharacter = $d
						ifTrue: [ ^ self recordAndReportMatch: #(214) ] ].
			^ self reportLastMatch ].
	currentCharacter = $e
		ifTrue: [ 
			self recordMatch: #(195).
			self step.
			currentCharacter = $s
				ifTrue: [ 
					self step.
					currentCharacter = $t
						ifTrue: [ ^ self recordAndReportMatch: #(139) ] ].
			^ self reportLastMatch ].
	currentCharacter = $i
		ifTrue: [ 
			self step.
			currentCharacter = $n
				ifTrue: [ 
					self step.
					currentCharacter = $f
						ifTrue: [ ^ self recordAndReportMatch: #(35) ] ].
			^ self reportLastMatch ].
	currentCharacter = $n
		ifTrue: [ 
			self step.
			currentCharacter = $a
				ifTrue: [ 
					self step.
					currentCharacter = $n
						ifTrue: [ ^ self recordAndReportMatch: #(32) ] ].
			^ self reportLastMatch ].
	currentCharacter = $o
		ifTrue: [ ^ self scan44 ].
	currentCharacter = $s
		ifTrue: [ 
			self step.
			currentCharacter = $w
				ifTrue: [ ^ self recordAndReportMatch: #(110) ].
			currentCharacter = $z
				ifTrue: [ ^ self recordAndReportMatch: #(37) ].
			^ self reportLastMatch ].
	currentCharacter = $u
		ifTrue: [ 
			self step.
			currentCharacter = $w
				ifTrue: [ ^ self recordAndReportMatch: #(111) ] ].
	^ self reportLastMatch