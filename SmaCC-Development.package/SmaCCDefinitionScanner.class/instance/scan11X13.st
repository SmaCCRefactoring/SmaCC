generated
scan11X13
	currentCharacter == $:
		ifTrue: [ ^ self scan11X10 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(36 40) ].
	currentCharacter == $<
		ifTrue: [ ^ self scan11X7 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(8 40) ].
	currentCharacter == $[
		ifTrue: [ ^ self scan11X3 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan11X1 ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(3 40) ].
	currentCharacter == ${
		ifTrue: [ ^ self scan11X6 ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(5 40) ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue: [ ^ self scan11X9 ].
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ ^ self scan11X4 ].
	^ self recordAndReportMatch: #(40)