generated
scanForToken
	state == #parser
		ifTrue:
			[ ^ self scanForTokenX1 ].
	state == #scanner
		ifTrue: [ ^ self scan12 ].
	(#(#default #directives) includes: state)
		ifTrue: [ self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan1 ].
			currentCharacter == $#
				ifTrue:
					[ ^ self scanForTokenX2 ].
			currentCharacter == $%
				ifTrue: [ ^ self scan3 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan4 ].
			currentCharacter == $(
				ifTrue: [ ^ self recordAndReportMatch: #(3) ].
			currentCharacter == $)
				ifTrue: [ ^ self recordAndReportMatch: #(5) ].
			currentCharacter == $*
				ifTrue: [ ^ self recordAndReportMatch: #(2) ].
			currentCharacter == $+
				ifTrue: [ ^ self recordAndReportMatch: #(1) ].
			currentCharacter == $/
				ifTrue: [ ^ self scan6 ].
			currentCharacter == $:
				ifTrue: [ ^ self scan8 ].
			currentCharacter == $;
				ifTrue: [ ^ self recordAndReportMatch: #(37) ].
			currentCharacter == $<
				ifTrue: [ ^ self scan10 ].
			currentCharacter == $?
				ifTrue: [ ^ self recordAndReportMatch: #(6) ].
			currentCharacter == $[
				ifTrue: [ ^ self recordAndReportMatch: #(7) ].
			currentCharacter == $]
				ifTrue: [ ^ self recordAndReportMatch: #(11) ].
			currentCharacter == ${
				ifTrue: [ ^ self recordAndReportMatch: #(33) ].
			currentCharacter == $|
				ifTrue: [ ^ self recordAndReportMatch: #(4) ].
			(currentCharacter isSeparator
				or: [ currentCharacter == Character pageUp ])
				ifTrue:
					[ ^ self scanForTokenX3 ].
			(currentCharacter isLetter or: [ currentCharacter == $_ ])
				ifTrue:
					[ self scanForTokenX4 ] ].
	^ self reportLastMatch