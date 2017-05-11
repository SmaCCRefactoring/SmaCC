generated
scan11X13
	currentCharacter == $:
		ifTrue: [ ^ self scan11X10 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(35 39) ].
	currentCharacter == $<
		ifTrue: [ ^ self scan11X7 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(4 39) ].
	currentCharacter == $[
		ifTrue: [ ^ self scan11X3 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan11X1 ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(8 39) ].
	currentCharacter == ${
		ifTrue: [ ^ self scan11X6 ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(5 39) ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue: [ ^ self scan11X9 ].
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ ^ self scan11X4 ].
	^ self recordAndReportMatch: #(39)