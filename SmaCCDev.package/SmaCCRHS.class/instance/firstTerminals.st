private
firstTerminals
	| items |
	collection isEmpty ifTrue: [^Set with: self grammar emptySymbol].
	items := Set new.
	1
		to: collection size
		do:
			[:index | 
			items addAll: (collection at: index) firstTerminals.
			(items includes: self grammar emptySymbol) ifTrue: [index < collection size ifTrue: [items remove: self grammar emptySymbol]] ifFalse: [^items]].
	^items