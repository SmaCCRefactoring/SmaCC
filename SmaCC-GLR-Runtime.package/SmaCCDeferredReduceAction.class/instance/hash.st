comparing
hash
	^ self class hash bitXor: (selector hash bitXor: arguments hash)