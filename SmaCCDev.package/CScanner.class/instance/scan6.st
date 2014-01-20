generated-scanner
scan6
	[ 
	self step.
	currentCharacter <= $! or: [ (currentCharacter between: $# and: $[) or: [ currentCharacter >= $] ] ] ] whileTrue.
	currentCharacter = $"
		ifTrue: [ ^ self recordAndReportMatch: #(78) ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			currentCharacter <= $ÿ
				ifTrue: [ ^ self scan6 ].
			^ self reportLastMatch ].
	^ self reportLastMatch