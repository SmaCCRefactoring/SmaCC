generated
scan34
	self step.
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $l
				ifTrue: [ 
					self step.
					currentCharacter = $f
						ifTrue: [ ^ self recordAndReportMatch: #(135) ] ].
			^ self reportLastMatch ].
	currentCharacter = $i
		ifTrue: [ 
			2
				timesRepeat: [ 
					self step.
					currentCharacter = $d
						ifFalse: [ ^ self reportLastMatch ] ].
			self step.
			currentCharacter = $e
				ifTrue: [ 
					self step.
					currentCharacter = $n
						ifTrue: [ ^ self recordAndReportMatch: #(163) ] ] ].
	^ self reportLastMatch