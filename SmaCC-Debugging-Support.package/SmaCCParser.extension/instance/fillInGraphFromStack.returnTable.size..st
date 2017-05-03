*smacc-debugging-support
fillInGraphFromStack: nodeCollection returnTable: tableArray size: sizeInteger
	self
		allActionsAndSymbolsForState: nodeCollection last state
		do: [ :action :symbol | 
			| id type next name entry top stream reduction |
			id := action bitShift: -2.
			type := action bitAnd: self actionMask.
			type = self acceptAction
				ifTrue: [ nodeCollection last success: true ].
			type = self shiftAction
				ifTrue: [ ((tableArray at: id) > sizeInteger or: [ self isAcceptState: id ])
						ifTrue: [ name := self symbolNameFor: symbol.
							next := nodeCollection last addDirectLinkToNodeNamed: name state: id.
							nodeCollection add: next.
							[ self fillInGraphFromStack: nodeCollection returnTable: tableArray size: sizeInteger + 1 ]
								ensure: [ nodeCollection removeLast ] ] ].
			type = self reduceAction
				ifTrue: [ entry := self reduceTable at: id.
					(entry at: 2) >= sizeInteger
						ifTrue: [ name := self symbolNameFor: entry first.
							stream := WriteStream on: String new.
							stream
								nextPutAll: name;
								nextPutAll: ' :'.
							nodeCollection size - (entry at: 2) + 1 to: nodeCollection size do: [ :i | 
								stream
									nextPut: $ ;
									nextPutAll: (nodeCollection at: i) name ].
							stream nextPut: $;.
							reduction := stream contents.
							top := nodeCollection at: nodeCollection size - (entry at: 2).
							nodeCollection size - (entry at: 2) + 1 to: nodeCollection size do: [ :i | (nodeCollection at: i) addReduction: reduction ].
							next := top addDirectLinkToNodeNamed: name state: ((self actionForState: top state and: entry first) bitShift: -2) ] ] ]