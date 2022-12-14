Class {
	#name : #LineNumberStreamTest,
	#superclass : #TestCase,
	#category : 'SmaCC-Tests'
}

{ #category : #private }
LineNumberStreamTest >> addCRLFsTo: aString [
	^ aString
		copyReplaceAll: '\'
		with: (String with: Character cr with: Character lf)
]

{ #category : #private }
LineNumberStreamTest >> addCRsTo: aString [
	^ aString copyReplaceAll: '\' with: (String with: Character cr)
]

{ #category : #private }
LineNumberStreamTest >> addLFsTo: aString [
	^ aString copyReplaceAll: '\' with: (String with: Character lf)
]

{ #category : #tests }
LineNumberStreamTest >> testCRLFLines [
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addCRLFsTo: '1234\1234\1234\1234')).
	1 to: 4 do:
		[ :each | 
		self assert: stream lineNumber equals: each.
		4 timesRepeat: [ | ch |	
				ch := stream next.
				self assert: stream columnNumber equals: ch digitValue ].
		stream upTo: Character lf ]
]

{ #category : #tests }
LineNumberStreamTest >> testCRLines [
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addCRsTo: '1234\1234\1234\1234')).
	1 to: 4 do:
		[ :each | 
		self assert: stream lineNumber = each.
		4 timesRepeat: [ | ch |	
				ch := stream next.
				self assert: stream columnNumber equals: ch digitValue ].
		stream upTo: Character cr ]
]

{ #category : #tests }
LineNumberStreamTest >> testEmptyLines [
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addCRsTo: '\\\')).
	1 to: 4 do:
		[ :each | 
		self assert: stream lineNumber = each.
		stream upTo: Character cr ]
]

{ #category : #tests }
LineNumberStreamTest >> testForwardPositionCRLFLines [
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addCRLFsTo: '1\2\3\4')).
	self assert: stream next equals: $1.
	self assert: stream next equals: Character cr.
	self assert: stream next equals: Character lf.
	self assert: stream lineNumber equals: 2.
	self assert: stream columnNumber equals: 0
]

{ #category : #tests }
LineNumberStreamTest >> testLFLines [
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addLFsTo: '1234\1234\1234\1234')).
	1 to: 4 do:
		[ :each | 
		self assert: stream lineNumber = each.
		4 timesRepeat: [  | ch |
				ch := stream next.
				self assert: stream columnNumber equals: ch digitValue ].
		stream upTo: Character lf ]
]

{ #category : #tests }
LineNumberStreamTest >> testLineAndColPosition [
	"The point of this test is to confirm that lineAndColFor: corresponds
	to lineNUmberFor: and columnNumberFor:"
	| stream |
	stream := SmaCCLineNumberStream on: (ReadStream on: 
					(self addCRLFsTo: '123456789\123456789\123456789\123456789')).
	self assert: stream position equals: 0.
	self assert: stream columnNumber equals: 0.
	self assert: stream lineNumber equals: 1.
	1 to: stream size do: [ :each | 	| nextCh |
		nextCh := stream next.
		self assert: (stream lineAndCol) 
				equals: stream lineNumber @ stream columnNumber
	]
]

{ #category : #tests }
LineNumberStreamTest >> testPositionCRLFLines [
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addCRLFsTo: '1\2\3\4')).
	self assert: stream lineNumber equals: 1.
	stream upTo: $5.
	self assert: stream lineNumber equals: 4.
	stream skip: -1.
	self assert: stream peek equals: $4.
	self assert: stream lineNumber equals: 4.
	self assert: stream columnNumber equals: 0.
	self assert: stream next equals: $4.
	self assert: stream columnNumber equals: 1.
	stream position: 0.
	self assert: stream lineNumber equals: 1.
	self assert: stream columnNumber equals: 0.
	stream position: 3.
	self assert: stream peek equals: $2.
	self assert: stream lineNumber equals: 2.
	self assert: stream columnNumber equals: 0.
	self assert: stream next equals: $2.
	self assert: stream lineNumber equals: 2.
	self assert: stream columnNumber equals: 1
]

{ #category : #tests }
LineNumberStreamTest >> testPositionCRLines [
	"recall that the column number is that of the most-recently-read character.
	So, if we have just read the newline, and have not yet read the first character 
	of the following line, then the column number should be 0."
	| stream |
	stream := SmaCCLineNumberStream
		on: (ReadStream on: (self addCRsTo: '1\2\3\4')).
	self assert: stream lineNumber equals: 1.
	stream upTo: $5.
	self assert: stream lineNumber equals: 4.
	stream skip: -1.
	self assert: stream peek equals: $4.
	self assert: stream lineNumber equals: 4.
	self assert: stream columnNumber equals: 0.
	self assert: stream next equals: $4.
	self assert: stream columnNumber equals: 1.
	stream position: 0.
	self assert: stream lineNumber equals: 1.
	self assert: stream columnNumber equals: 0.
	stream position: 2.
	self assert: stream peek equals: $2.
	self assert: stream lineNumber equals: 2.
	self assert: stream columnNumber equals: 0.
	self assert: stream next equals: $2.
	self assert: stream lineNumber equals: 2.
	self assert: stream columnNumber equals: 1
]

{ #category : #tests }
LineNumberStreamTest >> testSingleLine [
	| stream |
	stream := SmaCCLineNumberStream on: (ReadStream on: 'this is a test').
	stream do: [ :each | 
		self assert: stream lineNumber = 1 description: 'line number should be 1'.
		self assert: stream columnNumber equals: stream position ]
]

{ #category : #tests }
LineNumberStreamTest >> testUnderstandingOfPosition [
	"The point of this test is to make clear that stream position answers the
	index of the character most-recently read from the stream.  Similarly, in
	the classToBeTested, stream columNumber is the column number of the most-
	recently read character."
	| stream |
	stream := ReadStream on: '123456789'.
	self assert: stream position equals: 0.
	1 to: stream size do: [ :each | 	| nextCh |
		nextCh := stream next.
		self assert: stream position equals: each.
		self assert: stream position equals: nextCh digitValue
	].
	stream := SmaCCLineNumberStream on: (ReadStream on: '123456789').
	self assert: stream position equals: 0.
	self assert: stream columnNumber equals: 0.
	1 to: stream size do: [ :each | 	| nextCh |
		nextCh := stream next.
		self assert: stream position equals: each.
		self assert: stream columnNumber equals: each.
		self assert: stream columnNumber equals: nextCh digitValue
	]
]
