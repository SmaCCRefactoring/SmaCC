generated
scanSplitSeq2
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(27) ].
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(35).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(13) ].
			^ self reportLastMatch ].
	currentCharacter = $+
		ifTrue: [ 
			self recordMatch: #(36).
			self step.
			currentCharacter = $+
				ifTrue: [ ^ self recordAndReportMatch: #(20) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(37) ].
			^ self reportLastMatch ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(24) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(31).
			self step.
			currentCharacter = $-
				ifTrue: [ ^ self recordAndReportMatch: #(21) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(56) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(23) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ 
			self recordMatch: #(22).
			self step.
			currentCharacter = $.
				ifTrue: [ 
					self step.
					currentCharacter = $.
						ifTrue: [ ^ self recordAndReportMatch: #(74) ].
					^ self reportLastMatch ].
			currentCharacter isDigit
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self scan8 ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			^ self reportLastMatch ].
	currentCharacter = $0
		ifTrue: [ 
			self recordMatch: #(77).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan9 ].
			currentCharacter isDigit
				ifTrue: [ ^ self scan10 ].
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan6 ].
			('Xx' includes: currentCharacter)
				ifTrue: [ 
					self step.
					currentCharacter isHexDigit
						ifTrue: [ 
							[ 
							self recordMatch: #(77).
							self step.
							currentCharacter isHexDigit ] whileTrue.
							('LUlu' includes: currentCharacter)
								ifTrue: [ ^ self recordAndReportMatch: #(77) ] ].
					^ self reportLastMatch ].
			('LUlu' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(77) ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(17).
			self step.
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(80) ].
			^ self reportLastMatch ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(57) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(6).
			self step.
			currentCharacter = $%
				ifTrue: [ ^ self recordAndReportMatch: #(81) ].
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(79) ].
			currentCharacter = $<
				ifTrue: [ 
					self recordMatch: #(14).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(62) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(8) ].
			^ self reportLastMatch ].
	^ self scanSplitSeq1