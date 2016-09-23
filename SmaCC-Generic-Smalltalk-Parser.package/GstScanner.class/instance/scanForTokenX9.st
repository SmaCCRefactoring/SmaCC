generated
scanForTokenX9
	currentCharacter == $1
		ifTrue: [ ^ self scan7 ].
	currentCharacter == $2
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $3
		ifTrue: [ ^ self scan9 ].
	currentCharacter == $4
		ifTrue: [ ^ self scan10 ].
	currentCharacter == $5
		ifTrue: [ ^ self scan11 ].
	currentCharacter == $6
		ifTrue: [ ^ self scan12 ].
	currentCharacter == $7
		ifTrue: [ ^ self scan13 ].
	currentCharacter == $8
		ifTrue: [ ^ self scan14 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan15 ].
	currentCharacter == $:
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(14) ].
	^ self scanForTokenX8