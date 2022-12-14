Extension { #name : #Collection }

{ #category : #'*smacc-development' }
Collection >> smaccIntersect: aCollection [
	^ self select: [ :each | aCollection includes: each ]
]

{ #category : #'*smacc-development' }
Collection >> smaccRemoveAll: aCollection [
	aCollection do: [ :each | self remove: aCollection ifAbsent: [  ] ].
	^ aCollection
]
