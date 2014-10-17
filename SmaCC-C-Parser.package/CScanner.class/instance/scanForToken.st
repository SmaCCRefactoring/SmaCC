generated
scanForToken
	self step.
	currentCharacter = $!
		ifTrue: [ 
			self recordMatch: #(29).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(1) ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(33).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(11) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(82) ].
			^ self reportLastMatch ].
	currentCharacter = $&
		ifTrue: [ 
			self recordMatch: #(34).
			self step.
			currentCharacter = $&
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(64) ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(26) ].
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
	currentCharacter = $=
		ifTrue: [ 
			self recordMatch: #(12).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(4) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(7).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(3) ].
			currentCharacter = $>
				ifTrue: [ 
					self recordMatch: #(18).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(63) ] ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	currentCharacter = $L
		ifTrue: [ ^ self scanSplit1 ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(79) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(80) ].
	currentCharacter = $^
		ifTrue: [ 
			self recordMatch: #(2).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(59) ].
			^ self reportLastMatch ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(81) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(5).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(60) ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(15) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(82) ].
	currentCharacter = $~
		ifTrue: [ ^ self recordAndReportMatch: #(32) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan10 ].
	(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
		ifTrue: [ 
			[ 
			self recordMatch: #(83).
			self step.
			currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue.
			^ self reportLastMatch ].
	currentCharacter isSafeForHTTP
		ifTrue: [ 
			[ 
			self recordMatch: #(76).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch