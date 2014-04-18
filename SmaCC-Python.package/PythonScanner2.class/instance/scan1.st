generated
scan1
	self step.
	currentCharacter = $!
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $"
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $%
		ifTrue: [ ^ self scan8 ].
	currentCharacter = $&
		ifTrue: [ ^ self scan9 ].
	currentCharacter = $'
		ifTrue: [ ^ self scan10 ].
	currentCharacter = $(
		ifTrue: [ ^ self scan15 ].
	currentCharacter = $)
		ifTrue: [ ^ self scan16 ].
	currentCharacter = $*
		ifTrue: [ ^ self scan17 ].
	currentCharacter = $+
		ifTrue: [ ^ self scan18 ].
	currentCharacter = $,
		ifTrue: [ ^ self scan19 ].
	currentCharacter = $-
		ifTrue: [ ^ self scan20 ].
	currentCharacter = $.
		ifTrue: [ ^ self scan21 ].
	currentCharacter = $/
		ifTrue: [ ^ self scan22 ].
	currentCharacter = $0
		ifTrue: [ ^ self scan23 ].
	currentCharacter = $:
		ifTrue: [ ^ self scan28 ].
	currentCharacter = $;
		ifTrue: [ ^ self scan29 ].
	currentCharacter = $<
		ifTrue: [ ^ self scan30 ].
	currentCharacter = $=
		ifTrue: [ ^ self scan31 ].
	currentCharacter = $>
		ifTrue: [ ^ self scan32 ].
	currentCharacter = $@
		ifTrue: [ ^ self scan33 ].
	currentCharacter = $R
		ifTrue: [ ^ self scan36 ].
	currentCharacter = $[
		ifTrue: [ ^ self scan37 ].
	currentCharacter = $]
		ifTrue: [ ^ self scan38 ].
	currentCharacter = $^
		ifTrue: [ ^ self scan39 ].
	currentCharacter = $`
		ifTrue: [ ^ self scan40 ].
	currentCharacter = $a
		ifTrue: [ ^ self scan41 ].
	currentCharacter = $b
		ifTrue: [ ^ self scan42 ].
	currentCharacter = $c
		ifTrue: [ ^ self scan43 ].
	currentCharacter = $d
		ifTrue: [ ^ self scan44 ].
	currentCharacter = $e
		ifTrue: [ ^ self scan45 ].
	currentCharacter = $f
		ifTrue: [ ^ self scan46 ].
	currentCharacter = $g
		ifTrue: [ ^ self scan47 ].
	currentCharacter = $i
		ifTrue: [ ^ self scan48 ].
	currentCharacter = $l
		ifTrue: [ ^ self scan49 ].
	currentCharacter = $n
		ifTrue: [ ^ self scan50 ].
	currentCharacter = $o
		ifTrue: [ ^ self scan51 ].
	currentCharacter = $p
		ifTrue: [ ^ self scan52 ].
	currentCharacter = $r
		ifTrue: [ ^ self scan53 ].
	currentCharacter = $t
		ifTrue: [ ^ self scan54 ].
	currentCharacter = $w
		ifTrue: [ ^ self scan55 ].
	currentCharacter = $y
		ifTrue: [ ^ self scan56 ].
	currentCharacter = ${
		ifTrue: [ ^ self scan57 ].
	currentCharacter = $|
		ifTrue: [ ^ self scan58 ].
	currentCharacter = $}
		ifTrue: [ ^ self scan59 ].
	currentCharacter = $~
		ifTrue: [ ^ self scan60 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan27 ].
	('BUu' includes: currentCharacter)
		ifTrue: [ ^ self scan35 ].
	currentCharacter isSafeForHTTP
		ifTrue: [ ^ self scan34 ].
	^ self reportLastMatch