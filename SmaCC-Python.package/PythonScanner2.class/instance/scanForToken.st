generated
scanForToken
	state == #lineBegin
		ifTrue: [ ^ self scanSplit19 ].
	state == #default
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(80) ].
			currentCharacter = Character cr
				ifTrue: [ 
					self recordMatch: #(80).
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(80) ].
					^ self reportLastMatch ].
			currentCharacter = $!
				ifTrue: [ 
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(42) ].
					^ self reportLastMatch ].
			currentCharacter = $"
				ifTrue: [ ^ self scan1 ].
			currentCharacter = $#
				ifTrue: [ 
					[ 
					self recordMatch: #(78).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			currentCharacter = $%
				ifTrue: [ 
					self recordMatch: #(51).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(31) ].
					^ self reportLastMatch ].
			currentCharacter = $&
				ifTrue: [ 
					self recordMatch: #(38).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(28) ].
					^ self reportLastMatch ].
			currentCharacter = $'
				ifTrue: [ ^ self scan5 ].
			currentCharacter = $(
				ifTrue: [ ^ self recordAndReportMatch: #(81) ].
			currentCharacter = $)
				ifTrue: [ ^ self recordAndReportMatch: #(82) ].
			currentCharacter = $*
				ifTrue: [ ^ self scanSplit23 ].
			currentCharacter = $+
				ifTrue: [ 
					self recordMatch: #(44).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(35) ].
					^ self reportLastMatch ].
			currentCharacter = $,
				ifTrue: [ ^ self recordAndReportMatch: #(22) ].
			currentCharacter = $-
				ifTrue: [ 
					self recordMatch: #(53).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(32) ].
					^ self reportLastMatch ].
			currentCharacter = $.
				ifTrue: [ 
					self recordMatch: #(13).
					self step.
					currentCharacter isDigit
						ifTrue: [ ^ self scan9 ].
					^ self reportLastMatch ].
			currentCharacter = $/
				ifTrue: [ ^ self scanSplit22 ].
			currentCharacter = $0
				ifTrue: [ ^ self scanSplit17 ].
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(21) ].
			currentCharacter = $;
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			currentCharacter = $<
				ifTrue: [ ^ self scanSplit21 ].
			currentCharacter = $=
				ifTrue: [ 
					self recordMatch: #(25).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(56) ].
					^ self reportLastMatch ].
			currentCharacter = $>
				ifTrue: [ 
					self recordMatch: #(65).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(54) ].
					currentCharacter = $>
						ifTrue: [ 
							self recordMatch: #(4).
							self step.
							currentCharacter = $=
								ifTrue: [ ^ self recordAndReportMatch: #(9) ] ].
					^ self reportLastMatch ].
			currentCharacter = $@
				ifTrue: [ ^ self recordAndReportMatch: #(23) ].
			currentCharacter = $R
				ifTrue: [ ^ self scan13 ].
			currentCharacter = $[
				ifTrue: [ ^ self recordAndReportMatch: #(83) ].
			currentCharacter = $\
				ifTrue: [ 
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(79) ].
					currentCharacter = Character cr
						ifTrue: [ 
							self recordMatch: #(79).
							self step.
							currentCharacter = Character lf
								ifTrue: [ ^ self recordAndReportMatch: #(79) ] ].
					^ self reportLastMatch ].
			currentCharacter = $]
				ifTrue: [ ^ self recordAndReportMatch: #(84) ].
			currentCharacter = $^
				ifTrue: [ 
					self recordMatch: #(37).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(34) ].
					^ self reportLastMatch ].
			currentCharacter = $`
				ifTrue: [ ^ self recordAndReportMatch: #(46) ].
			currentCharacter = $a
				ifTrue: [ ^ self scanSplit5 ].
			currentCharacter = $b
				ifTrue: [ ^ self scanSplit12 ].
			currentCharacter = $c
				ifTrue: [ ^ self scanSplit2 ].
			currentCharacter = $d
				ifTrue: [ ^ self scanSplit14 ].
			currentCharacter = $e
				ifTrue: [ ^ self scanSplit9 ].
			currentCharacter = $f
				ifTrue: [ ^ self scanSplit1 ].
			currentCharacter = $g
				ifTrue: [ ^ self scanSplit10 ].
			currentCharacter = $i
				ifTrue: [ ^ self scanSplit4 ].
			currentCharacter = $l
				ifTrue: [ ^ self scanSplit11 ].
			currentCharacter = $n
				ifTrue: [ ^ self scanSplit15 ].
			currentCharacter = $o
				ifTrue: [ ^ self scanSplit18 ].
			currentCharacter = $p
				ifTrue: [ ^ self scanSplit7 ].
			currentCharacter = $r
				ifTrue: [ ^ self scanSplit3 ].
			currentCharacter = $t
				ifTrue: [ ^ self scanSplit16 ].
			currentCharacter = $w
				ifTrue: [ ^ self scanSplit6 ].
			currentCharacter = $y
				ifTrue: [ ^ self scanSplit13 ].
			currentCharacter = ${
				ifTrue: [ ^ self recordAndReportMatch: #(85) ].
			currentCharacter = $|
				ifTrue: [ 
					self recordMatch: #(40).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(29) ].
					^ self reportLastMatch ].
			currentCharacter = $}
				ifTrue: [ ^ self recordAndReportMatch: #(86) ].
			currentCharacter = $~
				ifTrue: [ ^ self recordAndReportMatch: #(49) ].
			currentCharacter isDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(73).
					self step.
					currentCharacter = $.
						ifTrue: [ ^ self scan9 ].
					currentCharacter isDigit ] whileTrue.
					('Ee' includes: currentCharacter)
						ifTrue: [ ^ self scan10 ].
					('Ljl' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(73) ].
					^ self reportLastMatch ].
			(currentCharacter = Character tab or: [ currentCharacter = Character space ])
				ifTrue: [ 
					[ 
					self recordMatch: #(79).
					self step.
					currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
					^ self reportLastMatch ].
			('BUu' includes: currentCharacter)
				ifTrue: [ ^ self scanSplit20 ].
			currentCharacter isSafeForHTTP
				ifTrue: [ 
					[ 
					self recordMatch: #(71).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ] ].
	^ self reportLastMatch