accessing
rootContext
	^ rootContext
		ifNil: [ rootContext := interruptedContext
				findContextSuchThat:
					[ :each | each selector = #parse and: [ each receiver isKindOf: SmaCCParser ] ] ]