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
		ifTrue: [ ^ self scan11 ].
	currentCharacter = $%
		ifTrue: [ ^ self scan12 ].
	currentCharacter = $&
		ifTrue: [ ^ self scan13 ].
	currentCharacter = $'
		ifTrue: [ ^ self scan14 ].
	currentCharacter = $(
		ifTrue: [ ^ self scan19 ].
	currentCharacter = $)
		ifTrue: [ ^ self scan20 ].
	currentCharacter = $*
		ifTrue: [ ^ self scan21 ].
	currentCharacter = $+
		ifTrue: [ ^ self scan22 ].
	currentCharacter = $,
		ifTrue: [ ^ self scan23 ].
	currentCharacter = $-
		ifTrue: [ ^ self scan24 ].
	currentCharacter = $.
		ifTrue: [ ^ self scan25 ].
	currentCharacter = $/
		ifTrue: [ ^ self scan26 ].
	currentCharacter = $0
		ifTrue: [ ^ self scan27 ].
	currentCharacter = $:
		ifTrue: [ ^ self scan32 ].
	currentCharacter = $;
		ifTrue: [ ^ self scan33 ].
	currentCharacter = $<
		ifTrue: [ ^ self scan34 ].
	currentCharacter = $=
		ifTrue: [ ^ self scan35 ].
	currentCharacter = $>
		ifTrue: [ ^ self scan36 ].
	currentCharacter = $@
		ifTrue: [ ^ self scan37 ].
	currentCharacter = $R
		ifTrue: [ ^ self scan40 ].
	currentCharacter = $[
		ifTrue: [ ^ self scan41 ].
	currentCharacter = $\
		ifTrue: [ ^ self scan42 ].
	currentCharacter = $]
		ifTrue: [ ^ self scan43 ].
	currentCharacter = $^
		ifTrue: [ ^ self scan44 ].
	currentCharacter = $`
		ifTrue: [ ^ self scan45 ].
	currentCharacter = $a
		ifTrue: [ ^ self scan46 ].
	currentCharacter = $b
		ifTrue: [ ^ self scan47 ].
	currentCharacter = $c
		ifTrue: [ ^ self scan48 ].
	currentCharacter = $d
		ifTrue: [ ^ self scan49 ].
	currentCharacter = $e
		ifTrue: [ ^ self scan50 ].
	currentCharacter = $f
		ifTrue: [ ^ self scan51 ].
	currentCharacter = $g
		ifTrue: [ ^ self scan52 ].
	currentCharacter = $i
		ifTrue: [ ^ self scan53 ].
	currentCharacter = $l
		ifTrue: [ ^ self scan54 ].
	currentCharacter = $n
		ifTrue: [ ^ self scan55 ].
	currentCharacter = $o
		ifTrue: [ ^ self scan56 ].
	currentCharacter = $p
		ifTrue: [ ^ self scan57 ].
	currentCharacter = $r
		ifTrue: [ ^ self scan58 ].
	currentCharacter = $t
		ifTrue: [ ^ self scan59 ].
	currentCharacter = $w
		ifTrue: [ ^ self scan60 ].
	currentCharacter = $y
		ifTrue: [ ^ self scan61 ].
	currentCharacter = ${
		ifTrue: [ ^ self scan62 ].
	currentCharacter = $|
		ifTrue: [ ^ self scan63 ].
	currentCharacter = $}
		ifTrue: [ ^ self scan64 ].
	currentCharacter = $~
		ifTrue: [ ^ self scan65 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan31 ].
	(currentCharacter = Character tab or: [ currentCharacter = Character space ])
		ifTrue: [ ^ self scan2 ].
	('BUu' includes: currentCharacter)
		ifTrue: [ ^ self scan39 ].
	currentCharacter isSafeForHTTP
		ifTrue: [ ^ self scan38 ].
	^ self reportLastMatch