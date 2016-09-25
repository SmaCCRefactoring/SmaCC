private
glrParserStates
	| states |
	states := self parser states.
	^ states isEmpty
		ifTrue: [ Array with: self parser currentGLRState ]
		ifFalse: [ states ]