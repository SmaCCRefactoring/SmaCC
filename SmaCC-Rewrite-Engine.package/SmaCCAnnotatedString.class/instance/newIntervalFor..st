public
newIntervalFor: aString
	| interval |
	interval := super newIntervalFor: aString.
	self addAnnotationTo: interval.
	^ interval