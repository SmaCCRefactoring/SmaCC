accessing-methods
addGlobalProperty: aSymbol withValueFrom: aBlock
	rewriteEngine rewriteRule propertyAt: aSymbol ifAbsentPut: aBlock.
	self
		addMethodNamed: aSymbol
		as: [ rewriteEngine rewriteRule propertyAt: aSymbol ].
	self
		addMethodNamed: (aSymbol , ':') asSymbol
		as: [ :value | rewriteEngine rewriteRule propertyAt: aSymbol put: value ]