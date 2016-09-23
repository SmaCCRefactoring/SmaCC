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
				ifTrue: [ ^ self recordAndReportMatch: #(32) ].
			currentCharacter == $'
				ifTrue: [ ^ self scan3 ].
			currentCharacter == $(
				ifTrue: [ ^ self recordAndReportMatch: #(1) ].
			currentCharacter == $)
				ifTrue: [ ^ self recordAndReportMatch: #(6) ].
			currentCharacter == $*
				ifTrue: [ ^ self recordAndReportMatch: #(3) ].
			currentCharacter == $+
				ifTrue: [ ^ self recordAndReportMatch: #(5) ].
			currentCharacter == $/
				ifTrue: [ ^ self scan5 ].
			currentCharacter == $:
				ifTrue: [ ^ self scan7 ].
			currentCharacter == $;
				ifTrue: [ ^ self recordAndReportMatch: #(33) ].
			currentCharacter == $<
				ifTrue: [ ^ self scan9 ].
			currentCharacter == $?
				ifTrue: [ ^ self recordAndReportMatch: #(7) ].
			currentCharacter == ${
				ifTrue: [ ^ self recordAndReportMatch: #(29) ].
			currentCharacter == $|
				ifTrue: [ ^ self recordAndReportMatch: #(2) ].
			(currentCharacter isSeparator
				or: [ currentCharacter == Character pageUp ])
				ifTrue:
					[ ^ self scanForTokenX3 ].
			(currentCharacter isLetter or: [ currentCharacter == $_ ])
				ifTrue:
					[ self scanForTokenX4 ] ].
	^ self reportLastMatch