accessing-properites
initializeGlobalProperty: aSymbol withValueFrom: aBlock
	(self class classPool at: aSymbol ifAbsent: [ nil ]) == SmaCCRewriteMatchContext uninitializedValue
		ifTrue: [ self class classPool at: aSymbol put: aBlock value ]