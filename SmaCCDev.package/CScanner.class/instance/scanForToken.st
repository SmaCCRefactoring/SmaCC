generated-scanner
scanForToken
	self step.
	((currentCharacter between: $A and: $K)
		or: [ (currentCharacter between: $M and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #IDENTIFIER.
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	(currentCharacter between: $1 and: $9)
		ifTrue: [ ^ self scan5 ].
	((currentCharacter between: Character tab and: Character cr) or: [ currentCharacter = Character space ])
		ifTrue: [ 
			[ 
			self recordMatch: #whitespace.
			self step.
			(currentCharacter between: Character tab and: Character cr) or: [ currentCharacter = Character space ] ] whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $!
		ifTrue: [ 
			self recordMatch: #(32).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(4) ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(82) ].
			^ self reportLastMatch ].
	currentCharacter = $&
		ifTrue: [ 
			self recordMatch: #(28).
			self step.
			currentCharacter = $&
				ifTrue: [ ^ self recordAndReportMatch: #(5) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(63) ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ ^ self scan7 ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(25) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(26) ].
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(34).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(12) ].
			^ self reportLastMatch ].
	currentCharacter = $+
		ifTrue: [ 
			self recordMatch: #(35).
			self step.
			currentCharacter = $+
				ifTrue: [ ^ self recordAndReportMatch: #(23) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(11) ].
			^ self reportLastMatch ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(36).
			self step.
			currentCharacter = $-
				ifTrue: [ ^ self recordAndReportMatch: #(20) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(19) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(22) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ 
			self recordMatch: #(27).
			self step.
			(currentCharacter between: $0 and: $9)
				ifTrue: [ ^ self scan1 ].
			currentCharacter = $.
				ifTrue: [ 
					self step.
					currentCharacter = $.
						ifTrue: [ ^ self recordAndReportMatch: #(74) ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(29).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self recordAndReportMatch: #comment ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(13) ].
			^ self reportLastMatch ].
	currentCharacter = $0
		ifTrue: [ 
			self recordMatch: #(77).
			self step.
			(currentCharacter between: $0 and: $9)
				ifTrue: [ ^ self scan5 ].
			(currentCharacter = $L or: [ currentCharacter = $U or: [ currentCharacter = $l or: [ currentCharacter = $u ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(77) ].
			(currentCharacter = $E or: [ currentCharacter = $e ])
				ifTrue: [ ^ self scan3 ].
			(currentCharacter = $X or: [ currentCharacter = $x ])
				ifTrue: [ 
					self step.
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $F) or: [ currentCharacter between: $a and: $f ] ])
						ifTrue: [ 
							[ 
							self recordMatch: #(77).
							self step.
							(currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $F) or: [ currentCharacter between: $a and: $f ] ] ] whileTrue.
							(currentCharacter = $L or: [ currentCharacter = $U or: [ currentCharacter = $l or: [ currentCharacter = $u ] ] ])
								ifTrue: [ ^ self recordAndReportMatch: #(77) ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			currentCharacter = $.
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(16).
			self step.
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(80) ].
			^ self reportLastMatch ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(60) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(18).
			self step.
			currentCharacter = $%
				ifTrue: [ ^ self recordAndReportMatch: #(81) ].
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(79) ].
			currentCharacter = $<
				ifTrue: [ 
					self recordMatch: #(33).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(37) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(7) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ 
			self recordMatch: #(17).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(3) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(6).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(8) ].
			currentCharacter = $>
				ifTrue: [ 
					self recordMatch: #(14).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(62) ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(15) ].
	currentCharacter = $L
		ifTrue: [ 
			self recordMatch: #IDENTIFIER.
			self step.
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #IDENTIFIER.
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			currentCharacter = $"
				ifTrue: [ ^ self scan6 ].
			currentCharacter = $'
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(79) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(80) ].
	currentCharacter = $^
		ifTrue: [ 
			self recordMatch: #(1).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(64) ].
			^ self reportLastMatch ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(81) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(2).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(59) ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(82) ].
	currentCharacter = $~
		ifTrue: [ ^ self recordAndReportMatch: #(31) ].
	^ self reportLastMatch