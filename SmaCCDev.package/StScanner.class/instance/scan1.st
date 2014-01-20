generated-scanner
scan1
	[ 
	self step.
	currentCharacter ~= $' ] whileTrue.
	currentCharacter = $'
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch