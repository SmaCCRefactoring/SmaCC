Class {
	#name : #SmaCCRewriteServerWorkerCommandLineHandler,
	#superclass : #CommandLineHandler,
	#instVars : [
		'server',
		'port'
	],
	#category : 'SmaCC-Rewrite-Server-Worker'
}

{ #category : #accessing }
SmaCCRewriteServerWorkerCommandLineHandler class >> commandName [
	^ 'SmaCCServerWorker'
]

{ #category : #public }
SmaCCRewriteServerWorkerCommandLineHandler >> activate [
	[ self startServer ] fork
]

{ #category : #public }
SmaCCRewriteServerWorkerCommandLineHandler >> port [
	^ port
		ifNil:
			[ 
			| arg parts |
			arg := 'localhost'.
			self arguments notEmpty
				ifTrue: [ arg := self arguments last ].
			parts := (arg substrings: ':') last.
			port := (parts size = 2
				and:
					[ 
					parts last notEmpty
						and: [ parts last allSatisfy: [ :each | each isDigit ] ] ])
				ifTrue: [ parts last asNumber ]
				ifFalse: [ 36rSM ] ]
]

{ #category : #public }
SmaCCRewriteServerWorkerCommandLineHandler >> server [
	^ server
		ifNil:
			[ 
			| arg |
			arg := 'localhost'.
			self arguments notEmpty
				ifTrue: [ arg := self arguments last ].
			server := (arg substrings: ':') first ]
]

{ #category : #public }
SmaCCRewriteServerWorkerCommandLineHandler >> startServer [
	[ 
	| worker |
	worker := SmaCCRewriteServerWorker new.
	self arguments
		do:
			[ :each | 
			(each beginsWith: 'remote=')
				ifTrue: [ worker remotePrefix: (each copyFrom: 8 to: each size) ].
			(each beginsWith: 'local=')
				ifTrue: [ worker localPrefix: (each copyFrom: 7 to: each size) ] ].
	worker startConnectingTo: self server onPort: self port ]
		on: Error
		do: [ :ex | self stderr nextPutAll: ex messageText ]
]
