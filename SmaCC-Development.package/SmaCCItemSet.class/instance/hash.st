comparing
hash
	^self inject: self class hash into: [:sum :each | sum bitXor: each hash]