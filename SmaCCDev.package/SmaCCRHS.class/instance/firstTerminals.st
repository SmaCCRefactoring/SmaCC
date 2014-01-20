accessing
firstTerminals
	| items |
	collection isEmpty ifTrue: [^Set with: SmaCCSymbol empty].
	items := Set new.
	1 to: collection size
		do: 
			[:index | 
			items addAll: (collection at: index) firstTerminals.
			(items includes: SmaCCSymbol empty) 
				ifTrue: [index < collection size ifTrue: [items remove: SmaCCSymbol empty]]
				ifFalse: [^items]].
	^items