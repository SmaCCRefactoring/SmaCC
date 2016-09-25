running
processRequests
	[ 
	[ 
	| bytes |
	bytes := self readBytes.
	self processRequest: bytes asString ] repeat ]
		on: Error
		do:
			[ :ex | 
			((Smalltalk options select: [ :each | '-/' includes: each first ])
				collect: [ :each | each copyFrom: 2 to: each size ])
				do: [ :each | 
					(each sameAs: 'error')
						ifTrue: [ ex pass ] ].
			Exit signalFailure: ex messageText ]