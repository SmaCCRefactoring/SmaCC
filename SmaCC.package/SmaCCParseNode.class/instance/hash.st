comparing
hash
	^ self variableSelectors
		inject: self class hash
		into: [ :sum :symbol | (self perform: symbol) inject: sum into: [ :hash :each | hash bitXor: (self perform: each) hash ] ]