private
unnamedSymbolsDo: aBlock
	self
		variablesAndSymbolsDo: [ :var :each | 
			var isNil
				ifTrue: [ aBlock value: each ] ]