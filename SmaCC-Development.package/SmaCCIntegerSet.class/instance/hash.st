comparing
hash
	| hash |
	hash := self class hash.
	self
		do:
			[ :each | 
			hash := hash
				bitXor:
					((each hash bitShift: -8)
						bitOr: ((each hash bitAnd: 16rFF) bitShift: 8)) ].
	^ hash