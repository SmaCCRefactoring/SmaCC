generated
scanForToken
	self step.
	currentCharacter = $!
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $"
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $%
		ifTrue: [ ^ self scan5 ].
	currentCharacter = $(
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $)
		ifTrue: [ ^ self scan7 ].
	currentCharacter = $*
		ifTrue: [ ^ self scan8 ].
	currentCharacter = $+
		ifTrue: [ ^ self scan9 ].
	currentCharacter = $,
		ifTrue: [ ^ self scan11 ].
	currentCharacter = $-
		ifTrue: [ ^ self scan12 ].
	currentCharacter = $.
		ifTrue: [ ^ self scan15 ].
	currentCharacter = $0
		ifTrue: [ ^ self scan16 ].
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
	currentCharacter = $\
		ifTrue: [ ^ self scan25 ].
	currentCharacter = $]
		ifTrue: [ ^ self scan26 ].
	currentCharacter = $a
		ifTrue: [ ^ self scan27 ].
	currentCharacter = $b
		ifTrue: [ ^ self scan32 ].
	currentCharacter = $c
		ifTrue: [ ^ self scan34 ].
	currentCharacter = $d
		ifTrue: [ ^ self scan37 ].
	currentCharacter = $e
		ifTrue: [ ^ self scan43 ].
	currentCharacter = $f
		ifTrue: [ ^ self scan50 ].
	currentCharacter = $g
		ifTrue: [ ^ self scan56 ].
	currentCharacter = $h
		ifTrue: [ ^ self scan60 ].
	currentCharacter = $i
		ifTrue: [ ^ self scan61 ].
	currentCharacter = $l
		ifTrue: [ ^ self scan68 ].
	currentCharacter = $m
		ifTrue: [ ^ self scan70 ].
	currentCharacter = $n
		ifTrue: [ ^ self scan72 ].
	currentCharacter = $o
		ifTrue: [ ^ self scan75 ].
	currentCharacter = $p
		ifTrue: [ ^ self scan78 ].
	currentCharacter = $r
		ifTrue: [ ^ self scan81 ].
	currentCharacter = $s
		ifTrue: [ ^ self scan82 ].
	currentCharacter = $t
		ifTrue: [ ^ self scan92 ].
	currentCharacter = $u
		ifTrue: [ ^ self scan95 ].
	currentCharacter = $v
		ifTrue: [ ^ self scan101 ].
	currentCharacter = $w
		ifTrue: [ ^ self scan103 ].
	currentCharacter = $x
		ifTrue: [ ^ self scan104 ].
	currentCharacter = $z
		ifTrue: [ ^ self scan111 ].
	currentCharacter = ${
		ifTrue: [ ^ self scan116 ].
	currentCharacter = $}
		ifTrue: [ ^ self scan117 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan18 ].
	(currentCharacter isWhitespace or: [ currentCharacter = Character pageUp ])
		ifTrue: [ ^ self scan1 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch