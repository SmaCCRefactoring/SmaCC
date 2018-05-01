generated
scanForToken
	state == #parser
		ifTrue:
			[ ^ self scanForTokenX1 ].
	state == #scanner
		ifTrue: [ ^ self scan9 ].
	(#(#default #directives) includes: state)
		ifTrue: [ self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan1 ].
			currentCharacter == $#
				ifTrue:
					[ ^ self scanForTokenX3 ].
			currentCharacter == $%
				ifTrue: [ ^ self recordAndReportMatch: #(35) ].
			currentCharacter == $'
				ifTrue: [ ^ self scan3 ].
			currentCharacter == $(
				ifTrue: [ ^ self recordAndReportMatch: #(2) ].
			currentCharacter == $)
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			currentCharacter == $*
				ifTrue: [ ^ self recordAndReportMatch: #(1) ].
			currentCharacter == $+
				ifTrue: [ ^ self recordAndReportMatch: #(4) ].
			currentCharacter == $/
				ifTrue: [ ^ self scan5 ].
			currentCharacter == $:
				ifTrue: [ ^ self scan7 ].
			currentCharacter == $;
				ifTrue: [ ^ self recordAndReportMatch: #(36) ].
			currentCharacter == $<
				ifTrue: [ ^ self scan8 ].
			currentCharacter == $?
				ifTrue: [ ^ self recordAndReportMatch: #(8) ].
			currentCharacter == $[
				ifTrue: [ ^ self recordAndReportMatch: #(6) ].
			currentCharacter == $]
				ifTrue: [ ^ self recordAndReportMatch: #(3) ].
			currentCharacter == ${
				ifTrue: [ ^ self recordAndReportMatch: #(32) ].
			currentCharacter == $|
				ifTrue: [ ^ self recordAndReportMatch: #(5) ].
			(currentCharacter isSeparator
				or: [ currentCharacter == Character pageUp ])
				ifTrue:
					[ ^ self scanForTokenX4 ].
			((currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $z)
								or: [ ('ªµº' includes: currentCharacter)
										or: [ (currentCharacter
												between: (Character value: 192)
												and: (Character value: 214))
												or: [ (currentCharacter
														between: (Character value: 216)
														and: (Character value: 246))
														or: [ currentCharacter >= (Character value: 248) ] ] ] ] ] ])
				ifTrue:
					[ self scanForTokenX2 ] ].
	^ self reportLastMatch