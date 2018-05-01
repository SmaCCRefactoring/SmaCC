generated
scan9X12
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(9 40) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(1 40) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(4 40) ].
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(41) ].
	currentCharacter == $/
		ifTrue: [ ^ self scan9X9 ].
	currentCharacter == $:
		ifTrue: [ ^ self scan7 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(36 40) ].
	currentCharacter == $<
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(8 40) ].
	currentCharacter == $[
		ifTrue: [ ^ self scan9X5 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan9X3 ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(3 40) ].
	^ self scan9X11