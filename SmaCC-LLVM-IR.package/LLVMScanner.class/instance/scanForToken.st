generated
scanForToken
	self step.
	currentCharacter = $!
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $"
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $#
		ifTrue: [ ^ self scan4 ].
	currentCharacter = $%
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $(
		ifTrue: [ ^ self scan7 ].
	currentCharacter = $)
		ifTrue: [ ^ self scan8 ].
	currentCharacter = $*
		ifTrue: [ ^ self scan9 ].
	currentCharacter = $+
		ifTrue: [ ^ self scan10 ].
	currentCharacter = $,
		ifTrue: [ ^ self scan13 ].
	currentCharacter = $-
		ifTrue: [ ^ self scan14 ].
	currentCharacter = $.
		ifTrue: [ ^ self scan16 ].
	currentCharacter = $0
		ifTrue: [ ^ self scan17 ].
	currentCharacter = $;
		ifTrue: [ ^ self scan19 ].
	currentCharacter = $<
		ifTrue: [ ^ self scan20 ].
	currentCharacter = $=
		ifTrue: [ ^ self scan21 ].
	currentCharacter = $>
		ifTrue: [ ^ self scan22 ].
	currentCharacter = $@
		ifTrue: [ ^ self scan23 ].
	currentCharacter = $[
		ifTrue: [ ^ self scan24 ].
	currentCharacter = $]
		ifTrue: [ ^ self scan25 ].
	currentCharacter = $a
		ifTrue: [ ^ self scan26 ].
	currentCharacter = $b
		ifTrue: [ ^ self scan51 ].
	currentCharacter = $c
		ifTrue: [ ^ self scan54 ].
	currentCharacter = $d
		ifTrue: [ ^ self scan59 ].
	currentCharacter = $e
		ifTrue: [ ^ self scan65 ].
	currentCharacter = $f
		ifTrue: [ ^ self scan72 ].
	currentCharacter = $g
		ifTrue: [ ^ self scan82 ].
	currentCharacter = $h
		ifTrue: [ ^ self scan84 ].
	currentCharacter = $i
		ifTrue: [ ^ self scan85 ].
	currentCharacter = $l
		ifTrue: [ ^ self scan100 ].
	currentCharacter = $m
		ifTrue: [ ^ self scan119 ].
	currentCharacter = $n
		ifTrue: [ ^ self scan123 ].
	currentCharacter = $o
		ifTrue: [ ^ self scan136 ].
	currentCharacter = $p
		ifTrue: [ ^ self scan139 ].
	currentCharacter = $r
		ifTrue: [ ^ self scan151 ].
	currentCharacter = $s
		ifTrue: [ ^ self scan155 ].
	currentCharacter = $t
		ifTrue: [ ^ self scan179 ].
	currentCharacter = $u
		ifTrue: [ ^ self scan186 ].
	currentCharacter = $v
		ifTrue: [ ^ self scan203 ].
	currentCharacter = $w
		ifTrue: [ ^ self scan205 ].
	currentCharacter = $x
		ifTrue: [ ^ self scan208 ].
	currentCharacter = $z
		ifTrue: [ ^ self scan219 ].
	currentCharacter = ${
		ifTrue: [ ^ self scan224 ].
	currentCharacter = $}
		ifTrue: [ ^ self scan225 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan18 ].
	(currentCharacter isWhitespace or: [ currentCharacter = Character pageUp ])
		ifTrue: [ ^ self scan1 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch