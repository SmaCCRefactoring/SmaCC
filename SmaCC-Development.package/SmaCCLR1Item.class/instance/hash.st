comparing
hash
	^ (self symbol identityHash bitXor: (location bitShift: 14))
		bitXor: rhs identityHash