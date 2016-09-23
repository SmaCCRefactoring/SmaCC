accessing
allTokensInto: aCollection
	self tokenVariables
		do:
			[ :each | (self perform: each) ifNotNil: [ :token | aCollection add: token ] ].
	self compositeTokenVariables
		do:
			[ :each | 
			(self perform: each)
				ifNotNil: [ :tokens | aCollection addAll: tokens ] ].
	self nodesDo: [ :each | each allTokensInto: aCollection ]