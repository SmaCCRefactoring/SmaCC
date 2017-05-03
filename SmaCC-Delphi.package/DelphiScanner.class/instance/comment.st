private
comment
	| comment |
	comment := outputStream contents.
	(optDepths includes: ifDefCount)
		ifTrue:
			[ ('{$ELSE*' match: comment)
				ifTrue:
					[ optComments add: (Array with: start + 1 with: matchEnd).
					^ super comment ].
			(('{$ENDIF*' match: comment) or: [ '{$IFEND*' match: comment ])
				ifTrue:
					[ optComments add: (Array with: start + 1 with: matchEnd).
					optDepths remove: ifDefCount.
					^ super comment ] ].
	ifDefCount > 0
		ifTrue:
			[ ((('{$ELSE*' match: comment) and: [ ifDefCount = 1 ])
				or: [ ('{$ENDIF*' match: comment) or: [ '{$IFEND*' match: comment ] ])
				ifTrue:
					[ ifDefCount := ifDefCount - 1.
					ifDefCount = 0
						ifTrue: [ ifDefs last at: 2 put: start + comment size ] ]
				ifFalse: [ ('{$IF*' match: comment)
						ifTrue: [ ifDefCount := ifDefCount + 1 ] ] ]
		ifFalse:
			[ ('{$IF*' match: comment)
				ifTrue: [ ^ self processIfMacro: comment ].
			('{$ELSE*' match: comment)
				ifTrue: [ ^ self skipUntilEndDef ] ].
	^ super comment