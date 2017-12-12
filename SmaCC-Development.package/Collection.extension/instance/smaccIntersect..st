*smacc-development
smaccIntersect: aCollection
	^ self select: [ :each | aCollection includes: each ]