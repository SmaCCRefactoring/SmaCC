activation
port
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