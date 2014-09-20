generated
scan32
	self step.
	currentCharacter = $1
		ifTrue: [ 
			self step.
			currentCharacter = $2
				ifTrue: [ 
					self step.
					currentCharacter = $8
						ifTrue: [ ^ self recordAndReportMatch: #(130) ] ].
			^ self reportLastMatch ].
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $x
				ifTrue: [ 
					self step.
					currentCharacter = $t
						ifTrue: [ ^ self recordAndReportMatch: #(192) ] ].
			^ self reportLastMatch ].
	currentCharacter = $t
		ifTrue: [ 
			self step.
			currentCharacter = $o
				ifTrue: [ 
					self step.
					currentCharacter = $s
						ifTrue: [ 
							self step.
							currentCharacter = $i
								ifTrue: [ ^ self recordAndReportMatch: #(187) ].
							^ self reportLastMatch ].
					currentCharacter = $u
						ifTrue: [ 
							self step.
							currentCharacter = $i
								ifTrue: [ ^ self recordAndReportMatch: #(188) ] ].
					^ self reportLastMatch ].
			currentCharacter = $r
				ifTrue: [ 
					self step.
					currentCharacter = $u
						ifTrue: [ 
							self step.
							currentCharacter = $n
								ifTrue: [ 
									self step.
									currentCharacter = $c
										ifTrue: [ ^ self recordAndReportMatch: #(190) ] ] ] ] ].
	^ self reportLastMatch