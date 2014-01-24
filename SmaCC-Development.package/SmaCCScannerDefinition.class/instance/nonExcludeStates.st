accessing
nonExcludeStates
	| nonExcludeStates |
	nonExcludeStates := states reject: [:each | self isExcludeState: each].
	nonExcludeStates add: self defaultState.
	^nonExcludeStates