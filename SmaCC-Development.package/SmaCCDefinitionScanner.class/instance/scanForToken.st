generated
scanForToken
	state == #parser
		ifTrue:
			[ ^ self scanForTokenX1 ].
	state == #scanner
		ifTrue: [ ^ self scan11 ].
	(#(#default #directives) includes: state)
		ifTrue: [ self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan1 ].
			currentCharacter == $#
				ifTrue:
					[ ^ self scanForTokenX2 ].
			currentCharacter == $%
				ifTrue: [ ^ self recordAndReportMatch: #(34) ].
			currentCharacter == $'
				ifTrue: [ ^ self scan3 ].
			currentCharacter == $(
				ifTrue: [ ^ self recordAndReportMatch: #(2) ].
			currentCharacter == $)
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			currentCharacter == $*
				ifTrue: [ ^ self recordAndReportMatch: #(1) ].
			currentCharacter == $+
				ifTrue: [ ^ self recordAndReportMatch: #(3) ].
			currentCharacter == $/
				ifTrue: [ ^ self scan5 ].
			currentCharacter == $:
				ifTrue: [ ^ self scan7 ].
			currentCharacter == $;
				ifTrue: [ ^ self recordAndReportMatch: #(35) ].
			currentCharacter == $<
				ifTrue: [ ^ self scan9 ].
			currentCharacter == $?
				ifTrue: [ ^ self recordAndReportMatch: #(4) ].
			currentCharacter == $[
				ifTrue: [ ^ self recordAndReportMatch: #(6) ].
			currentCharacter == $]
				ifTrue: [ ^ self recordAndReportMatch: #(8) ].
			currentCharacter == ${
				ifTrue: [ ^ self recordAndReportMatch: #(31) ].
			currentCharacter == $|
				ifTrue: [ ^ self recordAndReportMatch: #(5) ].
			(currentCharacter isSeparator
				or: [ currentCharacter == Character pageUp ])
				ifTrue:
					[ ^ self scanForTokenX3 ].
			(currentCharacter isLetter or: [ currentCharacter == $_ ])
				ifTrue:
					[ self scanForTokenX4 ] ].
	^ self reportLastMatch