compiling-scanner
acceptStateEdge: aSmaCCStateEdge
	^ aSmaCCStateEdge transitionObjects size = 1
		ifTrue: [ 'state == #'
				, aSmaCCStateEdge transitionObjects asArray first ]
		ifFalse:
			[ '(' , aSmaCCStateEdge transitionObjects asArray storeString
				, ' includes: state)' ]