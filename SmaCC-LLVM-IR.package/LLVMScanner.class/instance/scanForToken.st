generated
scanForToken
	self step.
	currentCharacter = $!
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $"
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $%
		ifTrue: [ ^ self scan4 ].
	currentCharacter = $(
		ifTrue: [ ^ self scan5 ].
	currentCharacter = $)
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $*
		ifTrue: [ ^ self scan7 ].
	currentCharacter = $,
		ifTrue: [ ^ self scan8 ].
	currentCharacter = $-
		ifTrue: [ ^ self scan9 ].
	currentCharacter = $.
		ifTrue: [ ^ self scan10 ].
	currentCharacter = $;
		ifTrue: [ ^ self scan12 ].
	currentCharacter = $<
		ifTrue: [ ^ self scan13 ].
	currentCharacter = $=
		ifTrue: [ ^ self scan14 ].
	currentCharacter = $>
		ifTrue: [ ^ self scan15 ].
	currentCharacter = $@
		ifTrue: [ ^ self scan16 ].
	currentCharacter = $[
		ifTrue: [ ^ self scan17 ].
	currentCharacter = $]
		ifTrue: [ ^ self scan18 ].
	currentCharacter = $a
		ifTrue: [ ^ self scan19 ].
	currentCharacter = $b
		ifTrue: [ ^ self scan25 ].
	currentCharacter = $c
		ifTrue: [ ^ self scan26 ].
	currentCharacter = $d
		ifTrue: [ ^ self scan27 ].
	currentCharacter = $e
		ifTrue: [ ^ self scan29 ].
	currentCharacter = $f
		ifTrue: [ ^ self scan30 ].
	currentCharacter = $g
		ifTrue: [ ^ self scan33 ].
	currentCharacter = $h
		ifTrue: [ ^ self scan34 ].
	currentCharacter = $i
		ifTrue: [ ^ self scan35 ].
	currentCharacter = $l
		ifTrue: [ ^ self scan40 ].
	currentCharacter = $m
		ifTrue: [ ^ self scan42 ].
	currentCharacter = $n
		ifTrue: [ ^ self scan43 ].
	currentCharacter = $o
		ifTrue: [ ^ self scan48 ].
	currentCharacter = $p
		ifTrue: [ ^ self scan49 ].
	currentCharacter = $r
		ifTrue: [ ^ self scan52 ].
	currentCharacter = $s
		ifTrue: [ ^ self scan53 ].
	currentCharacter = $t
		ifTrue: [ ^ self scan60 ].
	currentCharacter = $u
		ifTrue: [ ^ self scan61 ].
	currentCharacter = $v
		ifTrue: [ ^ self scan64 ].
	currentCharacter = $w
		ifTrue: [ ^ self scan65 ].
	currentCharacter = $x
		ifTrue: [ ^ self scan66 ].
	currentCharacter = $z
		ifTrue: [ ^ self scan71 ].
	currentCharacter = ${
		ifTrue: [ ^ self scan72 ].
	currentCharacter = $}
		ifTrue: [ ^ self scan73 ].
	(currentCharacter between: $1 and: $9)
		ifTrue: [ ^ self scan11 ].
	(currentCharacter isWhitespace or: [ currentCharacter = Character pageUp ])
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch