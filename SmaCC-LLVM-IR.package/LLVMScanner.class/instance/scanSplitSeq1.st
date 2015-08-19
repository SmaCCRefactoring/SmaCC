generated
scanSplitSeq1
	currentCharacter = $0
		ifTrue: [ 
			self recordMatch: #(252).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan2 ].
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(257) ].
			currentCharacter = $x
				ifTrue: [ 
					self step.
					(currentCharacter = $H or: [ currentCharacter between: $K and: $M ])
						ifTrue: [ self step ].
					currentCharacter isHexDigit
						ifTrue: [ 
							[ 
							self recordMatch: #(249).
							self step.
							currentCharacter isHexDigit ] whileTrue ].
					^ self reportLastMatch ].
			currentCharacter isDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(252).
					self step.
					currentCharacter = $.
						ifTrue: [ ^ self scan2 ].
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(257) ].
					currentCharacter isDigit ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $;
		ifTrue: [ 
			[ 
			self recordMatch: #(264).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $<
		ifTrue: [ ^ self recordAndReportMatch: #(106) ].
	currentCharacter = $=
		ifTrue: [ ^ self recordAndReportMatch: #(83) ].
	currentCharacter = $>
		ifTrue: [ ^ self recordAndReportMatch: #(105) ].
	currentCharacter = $@
		ifTrue: [ 
			self step.
			currentCharacter = $"
				ifTrue: [ 
					[ 
					self step.
					currentCharacter = $"
						ifTrue: [ ^ self recordAndReportMatch: #(255) ] ] repeat ].
			currentCharacter isDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(255).
					self step.
					currentCharacter isDigit ] whileTrue.
					^ self reportLastMatch ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(255).
					self step.
					currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(107) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(103) ].
	currentCharacter = $a
		ifTrue: [ ^ self scan7 ].
	currentCharacter = $b
		ifTrue: [ ^ self scan36 ].
	currentCharacter = $c
		ifTrue: [ ^ self scan40 ].
	currentCharacter = $d
		ifTrue: [ ^ self scan44 ].
	currentCharacter = $e
		ifTrue: [ ^ self scan48 ].
	currentCharacter = $f
		ifTrue: [ ^ self scan56 ].
	currentCharacter = $g
		ifTrue: [ ^ self scan61 ].
	currentCharacter = $h
		ifTrue: [ ^ self scan66 ].
	currentCharacter = $i
		ifTrue: [ ^ self scan67 ].
	currentCharacter = $l
		ifTrue: [ ^ self scan77 ].
	currentCharacter = $m
		ifTrue: [ ^ self scan101 ].
	currentCharacter = $n
		ifTrue: [ ^ self scan106 ].
	currentCharacter = $o
		ifTrue: [ ^ self scan116 ].
	currentCharacter = $p
		ifTrue: [ ^ self scan119 ].
	currentCharacter = $r
		ifTrue: [ ^ self scan133 ].
	currentCharacter = $s
		ifTrue: [ ^ self scan141 ].
	currentCharacter = $t
		ifTrue: [ ^ self scan164 ].
	currentCharacter = $u
		ifTrue: [ ^ self scan171 ].
	currentCharacter = $v
		ifTrue: [ ^ self scan183 ].
	currentCharacter = $w
		ifTrue: [ ^ self scan185 ].
	currentCharacter = $x
		ifTrue: [ ^ self scan187 ].
	currentCharacter = $z
		ifTrue: [ ^ self scan199 ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(79) ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(78) ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(245 252).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan2 ].
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(257) ].
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
		ifTrue: [ ^ self recordAndReportMatch: #(265) ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch