generated
scanSplitSeq1
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(38) ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(77) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(19).
			self step.
			currentCharacter = $<
				ifTrue: [ 
					self recordMatch: #(2).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(75) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(17) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ 
			self recordMatch: #(59).
			self step.
			currentCharacter = $=
				ifTrue: [ 
					self recordMatch: #(11).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(29) ] ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(16).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(18) ].
			currentCharacter = $>
				ifTrue: [ 
					self recordMatch: #(5).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(74) ].
					currentCharacter = $>
						ifTrue: [ 
							self recordMatch: #(9).
							self step.
							currentCharacter = $=
								ifTrue: [ ^ self recordAndReportMatch: #(76) ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(62) ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(23) ].
	currentCharacter = $\
		ifTrue: [ ^ self scan5 ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(20) ].
	currentCharacter = $^
		ifTrue: [ 
			self recordMatch: #(64).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(71) ].
			^ self reportLastMatch ].
	currentCharacter = $`
		ifTrue: [ ^ self scan18 ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(24) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(65).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(69) ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(61) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(28) ].
	currentCharacter = $~
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(84).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan9 ].
			currentCharacter isDigit ] whileTrue.
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan10 ].
			^ self reportLastMatch ].
	currentCharacter isSeparator
		ifTrue: [ 
			[ 
			self recordMatch: #(82).
			self step.
			currentCharacter isSeparator ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isLetter or: [ currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ] ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch