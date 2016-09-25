comparing
hash
	^ self variableSelectors
		inject: self class hash
		into:
			[ :sum :symbol | 
			(self perform: symbol)
				inject: sum
				into:
					[ :hash :each | 
					| newHash |
					newHash := hash bitXor: (self perform: each) hash.
					((newHash bitShift: 1) bitAnd: SmallInteger maxVal)
						bitXor: (newHash bitShift: -29) ] ]