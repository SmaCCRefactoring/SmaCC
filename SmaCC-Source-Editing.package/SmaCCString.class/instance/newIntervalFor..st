private
newIntervalFor: aString
	| newInterval |
	newInterval := self intervalClass
		from: 1
		to: aString size
		string: aString.
	currentId := currentId + 1.
	newInterval id: currentId.
	^newInterval