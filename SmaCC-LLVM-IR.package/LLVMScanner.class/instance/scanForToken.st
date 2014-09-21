generated
scanForToken
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan2 ].
	currentCharacter = Character cr
		ifTrue: [ ^ self scan5 ].
	currentCharacter = $!
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $"
		ifTrue: [ ^ self scan7 ].
	currentCharacter = $#
		ifTrue: [ ^ self scan8 ].
	currentCharacter = $%
		ifTrue: [ ^ self scan10 ].
	currentCharacter = $(
		ifTrue: [ ^ self scan11 ].
	currentCharacter = $)
		ifTrue: [ ^ self scan12 ].
	currentCharacter = $*
		ifTrue: [ ^ self scan13 ].
	currentCharacter = $+
		ifTrue: [ ^ self scan14 ].
	currentCharacter = $,
		ifTrue: [ ^ self scan17 ].
	currentCharacter = $-
		ifTrue: [ ^ self scan18 ].
	currentCharacter = $.
		ifTrue: [ ^ self scan20 ].
	currentCharacter = $0
		ifTrue: [ ^ self scan21 ].
	currentCharacter = $;
		ifTrue: [ ^ self scan23 ].
	currentCharacter = $<
		ifTrue: [ ^ self scan24 ].
	currentCharacter = $=
		ifTrue: [ ^ self scan25 ].
	currentCharacter = $>
		ifTrue: [ ^ self scan26 ].
	currentCharacter = $@
		ifTrue: [ ^ self scan27 ].
	currentCharacter = $[
		ifTrue: [ ^ self scan28 ].
	currentCharacter = $]
		ifTrue: [ ^ self scan29 ].
	currentCharacter = $a
		ifTrue: [ ^ self scan30 ].
	currentCharacter = $b
		ifTrue: [ ^ self scan55 ].
	currentCharacter = $c
		ifTrue: [ ^ self scan58 ].
	currentCharacter = $d
		ifTrue: [ ^ self scan63 ].
	currentCharacter = $e
		ifTrue: [ ^ self scan69 ].
	currentCharacter = $f
		ifTrue: [ ^ self scan76 ].
	currentCharacter = $g
		ifTrue: [ ^ self scan86 ].
	currentCharacter = $h
		ifTrue: [ ^ self scan88 ].
	currentCharacter = $i
		ifTrue: [ ^ self scan89 ].
	currentCharacter = $l
		ifTrue: [ ^ self scan104 ].
	currentCharacter = $m
		ifTrue: [ ^ self scan124 ].
	currentCharacter = $n
		ifTrue: [ ^ self scan128 ].
	currentCharacter = $o
		ifTrue: [ ^ self scan141 ].
	currentCharacter = $p
		ifTrue: [ ^ self scan144 ].
	currentCharacter = $r
		ifTrue: [ ^ self scan156 ].
	currentCharacter = $s
		ifTrue: [ ^ self scan160 ].
	currentCharacter = $t
		ifTrue: [ ^ self scan184 ].
	currentCharacter = $u
		ifTrue: [ ^ self scan191 ].
	currentCharacter = $v
		ifTrue: [ ^ self scan208 ].
	currentCharacter = $w
		ifTrue: [ ^ self scan210 ].
	currentCharacter = $x
		ifTrue: [ ^ self scan213 ].
	currentCharacter = $z
		ifTrue: [ ^ self scan224 ].
	currentCharacter = ${
		ifTrue: [ ^ self scan229 ].
	currentCharacter = $}
		ifTrue: [ ^ self scan230 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan22 ].
	(currentCharacter isWhitespace or: [ currentCharacter = Character pageUp ])
		ifTrue: [ ^ self scan1 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan9 ].
	^ self reportLastMatch