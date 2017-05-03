compiling
compiledMethodFor: aString
	^ [ "Pharo"
	(self compiler
		source: aString;
		requestor: nil;
		failBlock: [ ^ nil ];
		compile) copyWithSource: aString ]
		on: Error
		do: [ :ex | 
			"Squeak version"
			ex
				return:
					(self
						compile: aString
						notifying: nil
						trailer: self defaultMethodTrailer
						ifFail: [ ^ nil ]) method ]