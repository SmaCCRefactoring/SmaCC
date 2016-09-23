merging
mergeWith: aSmaCCAction prefer: aClass
	aSmaCCAction isReject
		ifTrue: [ ^ self ].
	aSmaCCAction isAmbiguous
		ifTrue: [ actions addAll: aSmaCCAction actions ]
		ifFalse: [ actions add: aSmaCCAction ].
	^ self