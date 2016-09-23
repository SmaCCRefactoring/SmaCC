private
removeCommentedPartOf: aString
	| inStream outStream |
	inStream := ReadStream on: aString.
	outStream := WriteStream with: String new.
	inStream upTo: $".
	[ inStream atEnd ]
		whileFalse: [ (inStream peekFor: $")
				ifTrue: [ outStream nextPut: $" ].
			outStream nextPutAll: (inStream upTo: $") ].
	^ outStream contents