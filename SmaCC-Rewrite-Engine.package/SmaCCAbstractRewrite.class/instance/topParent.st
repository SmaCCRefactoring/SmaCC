accessing
topParent
	^ parent ifNil: [ self ] ifNotNil: [ :value | value topParent ]