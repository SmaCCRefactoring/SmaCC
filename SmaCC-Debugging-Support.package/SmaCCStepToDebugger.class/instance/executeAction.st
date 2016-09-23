accessing
executeAction
	self stepUntil: [ :context | self debuggerClass isParseContext: context ].
	(self debuggerClass isParseContext: self interruptedContext)
		ifTrue: [ self debugger debug: self interruptedContext using: self debuggerClass ]