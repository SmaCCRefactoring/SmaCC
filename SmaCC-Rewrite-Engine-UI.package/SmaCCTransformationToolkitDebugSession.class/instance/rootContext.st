accessing
rootContext
	^ rootContext
		ifNil: [ rootContext := interruptedContext findContextSuchThat: [ :each | SmaCCTransformationToolkitDebugger isTransformationContext: each ] ]