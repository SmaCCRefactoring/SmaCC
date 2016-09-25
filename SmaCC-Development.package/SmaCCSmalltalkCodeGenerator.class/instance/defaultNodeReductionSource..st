reduction table
defaultNodeReductionSource: aReduction
	aReduction index = 0
		ifTrue: [ ^ 'nil' ].
	^ '''' , aReduction index printString , ''''