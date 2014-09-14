generated
scanForToken
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $%
		ifTrue: [ ^ self scan4 ].
	currentCharacter = $(
		ifTrue: [ ^ self scan5 ].
	currentCharacter = $)
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $*
		ifTrue: [ ^ self scan7 ].
	currentCharacter = $+
		ifTrue: [ ^ self scan8 ].
	currentCharacter = $,
		ifTrue: [ ^ self scan10 ].
	currentCharacter = $-
		ifTrue: [ ^ self scan11 ].
	currentCharacter = $.
		ifTrue: [ ^ self scan14 ].
	currentCharacter = $0
		ifTrue: [ ^ self scan15 ].
	currentCharacter = $<
		ifTrue: [ ^ self scan18 ].
	currentCharacter = $=
		ifTrue: [ ^ self scan19 ].
	currentCharacter = $>
		ifTrue: [ ^ self scan20 ].
	currentCharacter = $@
		ifTrue: [ ^ self scan21 ].
	currentCharacter = $[
		ifTrue: [ ^ self scan22 ].
	currentCharacter = $\
		ifTrue: [ ^ self scan23 ].
	currentCharacter = $]
		ifTrue: [ ^ self scan24 ].
	currentCharacter = $a
		ifTrue: [ ^ self scan25 ].
	currentCharacter = $b
		ifTrue: [ ^ self scan30 ].
	currentCharacter = $c
		ifTrue: [ ^ self scan32 ].
	currentCharacter = $d
		ifTrue: [ ^ self scan35 ].
	currentCharacter = $e
		ifTrue: [ ^ self scan41 ].
	currentCharacter = $f
		ifTrue: [ ^ self scan48 ].
	currentCharacter = $g
		ifTrue: [ ^ self scan54 ].
	currentCharacter = $h
		ifTrue: [ ^ self scan58 ].
	currentCharacter = $i
		ifTrue: [ ^ self scan59 ].
	currentCharacter = $l
		ifTrue: [ ^ self scan66 ].
	currentCharacter = $m
		ifTrue: [ ^ self scan68 ].
	currentCharacter = $n
		ifTrue: [ ^ self scan69 ].
	currentCharacter = $o
		ifTrue: [ ^ self scan72 ].
	currentCharacter = $p
		ifTrue: [ ^ self scan75 ].
	currentCharacter = $r
		ifTrue: [ ^ self scan78 ].
	currentCharacter = $s
		ifTrue: [ ^ self scan79 ].
	currentCharacter = $t
		ifTrue: [ ^ self scan89 ].
	currentCharacter = $u
		ifTrue: [ ^ self scan92 ].
	currentCharacter = $v
		ifTrue: [ ^ self scan98 ].
	currentCharacter = $w
		ifTrue: [ ^ self scan100 ].
	currentCharacter = $x
		ifTrue: [ ^ self scan101 ].
	currentCharacter = $z
		ifTrue: [ ^ self scan108 ].
	currentCharacter = ${
		ifTrue: [ ^ self scan113 ].
	currentCharacter = $}
		ifTrue: [ ^ self scan114 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan16 ].
	(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
		ifTrue: [ ^ self scan1 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch