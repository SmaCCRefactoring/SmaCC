generated
scanForTokenX16
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(36) ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(31) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scanForTokenX5 ].
	currentCharacter == $=
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(43) ].
	currentCharacter == $@
		ifTrue: [ ^ self recordAndReportMatch: #(49) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(52) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(46) ].
	currentCharacter == $_
		ifTrue:
			[ ^ self scanForTokenX11 ].
	currentCharacter == $`
		ifTrue:
			[ ^ self scanForTokenX10 ].
	currentCharacter == $u
		ifTrue: [ ^ self scan9 ].
	^ self scanForTokenX15