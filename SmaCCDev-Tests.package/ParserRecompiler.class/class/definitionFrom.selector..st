private
definitionFrom: aClass selector: aSymbol
	| source input output |
	source := aClass class sourceCodeAt: aSymbol.
	input := ReadStream on: source.
	output := WriteStream with: String new.
	input upTo: $".
	[ input atEnd ] whileFalse: [
		(input peekFor: $")
			ifTrue: [ output nextPut: $" ].
		output nextPutAll: (input upTo: $") ].
	^ output contents