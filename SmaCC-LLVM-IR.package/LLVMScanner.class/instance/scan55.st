generated
scan55
	self step.
	currentCharacter = $c
		ifTrue: [ 
			self step.
			currentCharacter = $t
				ifTrue: [ 
					self step.
					currentCharacter = $i
						ifTrue: [ 
							self step.
							currentCharacter = $o
								ifTrue: [ 
									self step.
									currentCharacter = $n
										ifTrue: [ ^ self recordAndReportMatch: #(22) ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $l
		ifTrue: [ 
			self step.
			currentCharacter = $e
				ifTrue: [ 
					self step.
					currentCharacter = $c
						ifTrue: [ 
							self step.
							currentCharacter = $t
								ifTrue: [ ^ self recordAndReportMatch: #(68) ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $q
		ifTrue: [ 
			self step.
			currentCharacter = $_
				ifTrue: [ 
					self step.
					currentCharacter = $c
						ifTrue: [ 
							self step.
							currentCharacter = $s
								ifTrue: [ 
									self step.
									currentCharacter = $t
										ifTrue: [ ^ self recordAndReportMatch: #(181) ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $x
		ifTrue: [ 
			self step.
			currentCharacter = $t
				ifTrue: [ ^ self recordAndReportMatch: #(193) ] ].
	^ self reportLastMatch