private
variablesAndSymbolsDo: aBlock
	collection
		keysAndValuesDo: [:key :value | aBlock value: (self variableNameForIndex: key) value: value]