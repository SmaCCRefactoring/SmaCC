private
codeStream
	codeStream isNil
		ifTrue: [ codeStream := self outputStream ].
	^ codeStream