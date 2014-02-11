generated
scan2
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan3 ] ] repeat