initialize-release
on: aString
	| firstInterval |
	firstInterval := self intervalClass
		from: 1
		to: aString size
		string: aString.
	firstInterval id: 1.
	currentId := 1.
	firstSentinel next: firstInterval.
	firstInterval next: lastSentinel