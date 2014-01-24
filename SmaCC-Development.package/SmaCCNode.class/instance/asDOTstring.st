accessing
asDOTstring
	| nodeStream mapStream |
	nodeStream := WriteStream on: String new.
	nodeStream
		nextPutAll: 'digraph finite_state_machine {
	rankdir=LR;
	size="100,100"';
		cr.
	mapStream := WriteStream on: String new.
	self allStates do: 
			[:each | 
			nodeStream
				nextPutAll: 'node [ style=filled, shape = circle, fillcolor = ';
				nextPutAll: (each action notNil ifTrue: ['green'] ifFalse: ['white']);
				nextPutAll: '];';
				nextPutAll: each id printString;
				nextPut: $;;
				cr.
			each transitions do: 
					[:trans | 
					| edge |
					mapStream
						nextPutAll: each id printString;
						nextPutAll: ' -> ';
						nextPutAll: trans to id printString;
						nextPutAll: '[ label = "'.
					edge := trans edgeLabel displayString.
					edge size > 100 ifTrue: [edge := '...'].
					mapStream
						nextPutAll: edge;
						nextPutAll: '"];';
						cr]].
	mapStream nextPut: $}.
	^nodeStream contents , mapStream contents