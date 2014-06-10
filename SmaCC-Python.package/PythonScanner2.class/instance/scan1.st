generated
scan1
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan3 ].
	currentCharacter = Character cr
		ifTrue: [ ^ self scan4 ].
	currentCharacter = $!
		ifTrue: [ ^ self scan5 ].
	currentCharacter = $"
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $#
		ifTrue: [ ^ self scan10 ].
	currentCharacter = $%
		ifTrue: [ ^ self scan11 ].
	currentCharacter = $&
		ifTrue: [ ^ self scan12 ].
	currentCharacter = $'
		ifTrue: [ ^ self scan13 ].
	currentCharacter = $(
		ifTrue: [ ^ self scan17 ].
	currentCharacter = $)
		ifTrue: [ ^ self scan18 ].
	currentCharacter = $*
		ifTrue: [ ^ self scan19 ].
	currentCharacter = $+
		ifTrue: [ ^ self scan20 ].
	currentCharacter = $,
		ifTrue: [ ^ self scan21 ].
	currentCharacter = $-
		ifTrue: [ ^ self scan22 ].
	currentCharacter = $.
		ifTrue: [ ^ self scan23 ].
	currentCharacter = $/
		ifTrue: [ ^ self scan27 ].
	currentCharacter = $0
		ifTrue: [ ^ self scan28 ].
	currentCharacter = $:
		ifTrue: [ ^ self scan31 ].
	currentCharacter = $;
		ifTrue: [ ^ self scan32 ].
	currentCharacter = $<
		ifTrue: [ ^ self scan33 ].
	currentCharacter = $=
		ifTrue: [ ^ self scan34 ].
	currentCharacter = $>
		ifTrue: [ ^ self scan35 ].
	currentCharacter = $@
		ifTrue: [ ^ self scan36 ].
	currentCharacter = $R
		ifTrue: [ ^ self scan39 ].
	currentCharacter = $[
		ifTrue: [ ^ self scan40 ].
	currentCharacter = $\
		ifTrue: [ ^ self scan41 ].
	currentCharacter = $]
		ifTrue: [ ^ self scan42 ].
	currentCharacter = $^
		ifTrue: [ ^ self scan43 ].
	currentCharacter = $`
		ifTrue: [ ^ self scan44 ].
	currentCharacter = $a
		ifTrue: [ ^ self scan45 ].
	currentCharacter = $b
		ifTrue: [ ^ self scan46 ].
	currentCharacter = $c
		ifTrue: [ ^ self scan47 ].
	currentCharacter = $d
		ifTrue: [ ^ self scan48 ].
	currentCharacter = $e
		ifTrue: [ ^ self scan49 ].
	currentCharacter = $f
		ifTrue: [ ^ self scan50 ].
	currentCharacter = $g
		ifTrue: [ ^ self scan51 ].
	currentCharacter = $i
		ifTrue: [ ^ self scan52 ].
	currentCharacter = $l
		ifTrue: [ ^ self scan53 ].
	currentCharacter = $n
		ifTrue: [ ^ self scan54 ].
	currentCharacter = $o
		ifTrue: [ ^ self scan55 ].
	currentCharacter = $p
		ifTrue: [ ^ self scan56 ].
	currentCharacter = $r
		ifTrue: [ ^ self scan57 ].
	currentCharacter = $t
		ifTrue: [ ^ self scan58 ].
	currentCharacter = $w
		ifTrue: [ ^ self scan59 ].
	currentCharacter = $y
		ifTrue: [ ^ self scan60 ].
	currentCharacter = ${
		ifTrue: [ ^ self scan61 ].
	currentCharacter = $|
		ifTrue: [ ^ self scan62 ].
	currentCharacter = $}
		ifTrue: [ ^ self scan63 ].
	currentCharacter = $~
		ifTrue: [ ^ self scan64 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan30 ].
	(currentCharacter = Character tab or: [ currentCharacter = Character space ])
		ifTrue: [ ^ self scan2 ].
	('BUu' includes: currentCharacter)
		ifTrue: [ ^ self scan38 ].
	currentCharacter isSafeForHTTP
		ifTrue: [ ^ self scan37 ].
	^ self reportLastMatch