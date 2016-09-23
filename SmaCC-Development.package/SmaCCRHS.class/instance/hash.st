comparing
hash
	^ self class hash bitXor: (collection hash bitShift: 14)