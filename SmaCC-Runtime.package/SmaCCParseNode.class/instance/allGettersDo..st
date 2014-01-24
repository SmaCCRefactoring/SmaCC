iterating
allGettersDo: aBlock
	self allVariableSelectors do: [ :sel | (self perform: sel) do: aBlock ]