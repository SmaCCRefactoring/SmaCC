private
parserStack
	| states nodes items context reduceContext |
	states := self parser stateStack.
	nodes := self parser nodeStack.
	items := OrderedCollection new.
	1 to: states size - 1 do: [ :i | items addFirst: (Array with: (self symbolForTransitionFrom: (states at: i) to: (states at: i + 1)) with: (nodes at: i)) ].
	context := self session context
		findContextSuchThat: [ :each | (each receiver isKindOf: SmaCCParser) and: [ each selector = #performReduceMethod:with: ] ].
	context notNil
		ifTrue: [ items add: #('' '').
			reduceContext := context findContextSuchThat: [ :each | (each receiver isKindOf: SmaCCParser) and: [ each selector = #reduce: ] ].
			items addFirst: #('' '').
			(context tempAt: 2) size to: 1 by: -1 do: [ :i | items addFirst: (Array with: 'nodes at: ' , i printString with: ((context tempAt: 2) at: i)) ].
			items addFirst: (Array with: 'Reducing:' with: (self parser symbolNameFor: (reduceContext receiver reduceTable at: (reduceContext tempAt: 1)) first)) ].
	self parser currentToken
		ifNotNil: [ :token | 
			| stream |
			stream := WriteStream on: String new.
			token ids do: [ :each | stream nextPutAll: (self parser symbolNameFor: each) ] separatedBy: [ stream nextPut: $; ].
			items
				addFirst: #('' '');
				addFirst: (Array with: stream contents with: token);
				addFirst: (Array with: 'Lookahead:' with: '') ].
	^ items