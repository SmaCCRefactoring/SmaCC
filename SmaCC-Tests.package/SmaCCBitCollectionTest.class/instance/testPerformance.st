tests
testPerformance
	| myTime setTime |
	myTime := Time
		millisecondsToRun: [ self newCollection addAll: self largeCollection ].
	setTime := Time
		millisecondsToRun: [ Set new addAll: self largeCollection ].
	setTime := setTime max: 1000.	"Some implementations of Set don't have performance problems"
	self assert: myTime < (setTime // 2)