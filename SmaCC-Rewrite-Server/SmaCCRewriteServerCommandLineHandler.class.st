Class {
	#name : #SmaCCRewriteServerCommandLineHandler,
	#superclass : #CommandLineHandler,
	#instVars : [
		'port'
	],
	#category : 'SmaCC-Rewrite-Server'
}

{ #category : #accessing }
SmaCCRewriteServerCommandLineHandler class >> commandName [
	^ 'SmaCCServer'
]

{ #category : #activation }
SmaCCRewriteServerCommandLineHandler >> activate [
	[ self startServer ] fork
]

{ #category : #activation }
SmaCCRewriteServerCommandLineHandler >> port [
	port isNil
		ifTrue:
			[ 
			port := 36rSM.
			self arguments notEmpty
				ifTrue:
					[ 
					[ port := self arguments last asNumber ]
						on: Error
						do: [ :ex |  ] ] ].
	^ port
]

{ #category : #activation }
SmaCCRewriteServerCommandLineHandler >> startServer [
	[ SmaCCServer startOn: self port ]
		on: Error
		do: [ :ex | self stderr nextPutAll: ex messageText ]
]
