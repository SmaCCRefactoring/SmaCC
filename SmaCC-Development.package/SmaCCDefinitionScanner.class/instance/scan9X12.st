generated
scan9X12
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(9 41) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(1 41) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(4 41) ].
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(42) ].
	currentCharacter == $/
		ifTrue: [ ^ self scan9X9 ].
	currentCharacter == $:
		ifTrue: [ ^ self scan7 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(37 41) ].
	currentCharacter == $<
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(6 41) ].
	currentCharacter == $[
		ifTrue: [ ^ self scan9X5 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan9X3 ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(3 41) ].
	^ self scan9X11