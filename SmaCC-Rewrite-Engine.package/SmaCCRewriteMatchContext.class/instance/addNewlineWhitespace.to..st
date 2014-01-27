private
addNewlineWhitespace: aString to: source
	| outputStream inputStream |
	(aString notNil and: [aString notEmpty]) ifFalse: [^source].
	outputStream := WriteStream on: String new.
	inputStream := ReadStream on: source asString.
	[inputStream atEnd]
		whileFalse:
			[| char endOfLine |
			endOfLine := false.
			char := inputStream next.
			char = Character lf ifTrue: [endOfLine := true].
			char = Character cr
				ifTrue:
					[endOfLine := true.
					inputStream peek = Character lf
						ifTrue:
							[outputStream nextPut: char.
							char := inputStream next]].
			outputStream nextPut: char.
			endOfLine ifTrue: [outputStream nextPutAll: aString]].
	^outputStream contents