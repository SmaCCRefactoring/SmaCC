private
stepUntil: aBlock
	[ aBlock value: debugger currentContext ]
		whileFalse: [ debugger session stepInto: debugger currentContext.
			debugger updateSession ].
	debugger updateSession