private
startingStateIndex
	startingState isNil
		ifTrue: [ ^ 1 ].
	^ self parserClass
		perform: ('startingStateFor' , startingState) asSymbol