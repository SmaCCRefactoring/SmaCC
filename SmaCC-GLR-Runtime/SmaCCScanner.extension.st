Extension { #name : #SmaCCScanner }

{ #category : #'*smacc-glr-runtime' }
SmaCCScanner >> currentState [
	"Return an object that can be used to restoreState: when switching between parses in a GLR parser.  This object should implement #= in such a way that if the state is restored, then calling #next will always return the same token. If you add state to your scanner you may want to override this method and #restoreState: to include that state."

		^ SmaCCScannerState position: self position state: self state
]

{ #category : #'*smacc-glr-runtime' }
SmaCCScanner >> patternToken [
	| token |
	token := SmaCCPatternToken
		value: outputStream contents
		start: start + 1
		ids: matchActions.
	outputStream reset.
	^ token
]

{ #category : #'*smacc-glr-runtime' }
SmaCCScanner >> restoreState: aSmaCCScannerState [
	"Restore the state using the object returned from #currentState."

	self setPosition: aSmaCCScannerState position.
	self state: aSmaCCScannerState state
]
