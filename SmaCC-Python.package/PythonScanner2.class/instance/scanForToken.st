generated
scanForToken
	self step.
	currentCharacter = $!
		ifTrue: [ 
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(54) ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(48).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(33) ].
			^ self reportLastMatch ].
	currentCharacter = $&
		ifTrue: [ 
			self recordMatch: #(42).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(30) ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(26) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(27) ].
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(24).
			self step.
			currentCharacter = $*
				ifTrue: [ 
					self recordMatch: #(28).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(7) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(37) ].
			^ self reportLastMatch ].
	currentCharacter = $+
		ifTrue: [ 
			self recordMatch: #(40).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(35) ].
			^ self reportLastMatch ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(41).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(36) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(44).
			self step.
			currentCharacter = $/
				ifTrue: [ 
					self recordMatch: #(58).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(8) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(32) ].
			^ self reportLastMatch ].
	currentCharacter = $0
		ifTrue: [ 
			self recordMatch: #(79).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan11 ].
			(currentCharacter between: $8 and: $9)
				ifTrue: [ ^ self scan13 ].
			currentCharacter isDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(79).
					self step.
					currentCharacter = $.
						ifTrue: [ ^ self scan11 ].
					(currentCharacter between: $8 and: $9)
						ifTrue: [ ^ self scan13 ].
					currentCharacter isDigit ] whileTrue.
					('Ee' includes: currentCharacter)
						ifTrue: [ ^ self scan12 ].
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(79) ].
					^ self reportLastMatch ].
			('Bb' includes: currentCharacter)
				ifTrue: [ 
					self step.
					(currentCharacter between: $0 and: $1)
						ifTrue: [ 
							[ 
							self recordMatch: #(79).
							self step.
							currentCharacter between: $0 and: $1 ] whileTrue.
							('Ll' includes: currentCharacter)
								ifTrue: [ ^ self recordAndReportMatch: #(79) ] ].
					^ self reportLastMatch ].
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan12 ].
			('Ll' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(79) ].
			('Oo' includes: currentCharacter)
				ifTrue: [ 
					self step.
					(currentCharacter between: $0 and: $7)
						ifTrue: [ 
							[ 
							self recordMatch: #(79).
							self step.
							currentCharacter between: $0 and: $7 ] whileTrue.
							('Ll' includes: currentCharacter)
								ifTrue: [ ^ self recordAndReportMatch: #(79) ] ].
					^ self reportLastMatch ].
			('Xx' includes: currentCharacter)
				ifTrue: [ 
					self step.
					currentCharacter isHexDigit
						ifTrue: [ 
							[ 
							self recordMatch: #(79).
							self step.
							('Ll' includes: currentCharacter)
								ifTrue: [ ^ self recordAndReportMatch: #(79) ].
							currentCharacter isHexDigit ] whileTrue ] ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(23) ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(38) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(74).
			self step.
			currentCharacter = $<
				ifTrue: [ 
					self recordMatch: #(43).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(10) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(70) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(68) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ 
			self recordMatch: #(20).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(72) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(69) ].
			currentCharacter = $>
				ifTrue: [ 
					self recordMatch: #(4).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(6) ] ].
			^ self reportLastMatch ].
	currentCharacter = $@
		ifTrue: [ ^ self recordAndReportMatch: #(25) ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(56) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(57) ].
	currentCharacter = $^
		ifTrue: [ 
			self recordMatch: #(47).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(15) ].
			^ self reportLastMatch ].
	currentCharacter = $`
		ifTrue: [ ^ self recordAndReportMatch: #(50) ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(52) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(46).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(31) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(53) ].
	currentCharacter = $~
		ifTrue: [ ^ self recordAndReportMatch: #(55) ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(79).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan11 ].
			currentCharacter isDigit ] whileTrue.
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan12 ].
			('Ll' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(79) ].
			^ self reportLastMatch ].
	('Rr' includes: currentCharacter)
		ifTrue: [ ^ self scan15 ].
	('BUbu' includes: currentCharacter)
		ifTrue: [ ^ self scan14 ].
	currentCharacter isSafeForHTTP
		ifTrue: [ 
			[ 
			self recordMatch: #(77).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch