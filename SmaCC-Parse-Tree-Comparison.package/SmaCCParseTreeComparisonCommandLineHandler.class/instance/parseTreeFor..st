public
parseTreeFor: aString
	| parserClass stream |
	parserClass := self parserClassFor: aString asFileReference extension.
	stream := self openFile: aString.
	^ [ [ parserClass parseStream: stream ]
		on: Error
		do: [ :ex | self exitFailure: ex description ] ]
		ensure: [ stream close ]