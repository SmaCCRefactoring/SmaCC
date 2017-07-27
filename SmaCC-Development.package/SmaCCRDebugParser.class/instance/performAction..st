private
performAction: action
	self announcer
		announce:
			(SmaCCRAnnounce new
				action:
					(SmaCCRTransition
						onAction: action
						for: currentToken id first
						in: decompiler);
				stack: self stateStack;
				nodeStack: self nodeStack).
	super performAction: action