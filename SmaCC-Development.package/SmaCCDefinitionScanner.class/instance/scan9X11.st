generated
scan9X11
	currentCharacter == $:
		ifTrue: [ ^ self scan7 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(36 40) ].
	currentCharacter == $<
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(8 40) ].
	currentCharacter == $[
		ifTrue: [ ^ self scan9X3 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan9X1 ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(3 40) ].
	currentCharacter == ${
		ifTrue: [ ^ self scan9X6 ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(5 40) ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue: [ ^ self scan9X8 ].
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ ^ self scan9X4 ].
	^ self recordAndReportMatch: #(40)