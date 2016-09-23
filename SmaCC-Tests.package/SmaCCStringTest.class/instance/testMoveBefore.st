tests
testMoveBefore
	| string |
	string := SmaCCString on: '123456'.
	string moveFrom: 4 to: 6 before: 3.
	self assert: string asString = '124563'.
	string deleteFrom: 5 to: 5.
	self assert: string asString = '12463'.
	string := SmaCCString on: '123456'.
	string moveFrom: 4 to: 6 before: 1.
	self assert: string asString = '456123'