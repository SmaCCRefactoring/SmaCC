tests
testMoveAfter
	| string |
	string := SmaCCString on: '123456'.
	string moveFrom: 1 to: 2 after: 3.
	self assert: string asString = '312456'.
	string deleteFrom: 1 to: 4.
	self assert: string asString = '356'.
	string := SmaCCString on: '123456'.
	string moveFrom: 1 to: 3 after: 6.
	self assert: string asString = '456123'