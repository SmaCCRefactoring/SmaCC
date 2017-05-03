generated
scan12X14
	currentCharacter == $:
		ifTrue: [ ^ self scan12X11 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(37 41) ].
	currentCharacter == $<
		ifTrue: [ ^ self scan12X4 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(6 41) ].
	currentCharacter == $[
		ifTrue: [ ^ self scan12X3 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan12X1 ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(11 41) ].
	currentCharacter == ${
		ifTrue: [ ^ self scan12X7 ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(4 41) ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue: [ ^ self scan12X9 ].
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ ^ self scan12X5 ].
	^ self recordAndReportMatch: #(41)