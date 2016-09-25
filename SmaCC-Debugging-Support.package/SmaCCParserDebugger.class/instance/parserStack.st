private
parserStack
	| states nodes items context reduceContext |
	states := self parser stateStack.
	nodes := self parser nodeStack.
	items := OrderedCollection new.
	(1 to: states size - 1)
		collect: [ :i | items add: (Array with: (self symbolForTransitionFrom: (states at: i) to: (states at: i + 1)) with: (nodes at: i)) ].
	context := self session context
		findContextSuchThat: [ :each | (each receiver isKindOf: SmaCCParser) and: [ each selector = #performReduceMethod:with: ] ].
	context notNil
		ifTrue: [ items add: #('' '').
			reduceContext := context findContextSuchThat: [ :each | (each receiver isKindOf: SmaCCParser) and: [ each selector = #reduce: ] ].
			items add: (Array with: 'Reducing' with: (self symbolLabelFor: (reduceContext receiver reduceTable at: (reduceContext tempAt: 1)) first)).
			1 to: (context tempAt: 2) size do: [ :i | items add: (Array with: 'nodes at: ' , i printString with: ((context tempAt: 2) at: i)) ] ].
	self parser currentToken
		ifNotNil: [ :token | 
			| stream |
			stream := WriteStream on: String new.
			token ids do: [ :each | stream nextPutAll: (self symbolLabelFor: each) ] separatedBy: [ stream nextPut: $; ].
			items
				add: #('' '');
				add: (Array with: 'Lookahead:' with: '');
				add: (Array with: stream contents with: token) ].
	^ items