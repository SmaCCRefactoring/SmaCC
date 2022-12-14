Class {
	#name : #CSVParser,
	#superclass : #SmaCCParser,
	#category : 'SmaCC-CSV-Parser'
}

{ #category : #'generated-accessing' }
CSVParser class >> cacheId [
	^'2017-05-02T22:47:13.826803+02:00'
]

{ #category : #private }
CSVParser class >> dataValueFrom: aSmaCCToken [
	| string |
	string := aSmaCCToken value.
	string isEmpty
		ifTrue: [ ^ nil ].
	string first = $'
		ifTrue:
			[ ^ (string copyFrom: 2 to: string size - 1)
				copyReplaceAll: ''''''
				with: '''' ].
	string first = $"
		ifTrue:
			[ ^ (string copyFrom: 2 to: string size - 1)
				copyReplaceAll: '""'
				with: '"' ].
	^ string
]

{ #category : #generated }
CSVParser class >> definitionComment [
"%prefix CSV;
%suffix Node;

%root Parse;


<entry> 
	: [^\""\'\,\r\n] [^\,\r\n]*
	| (\"" [^\""]* \"") +
	| (\' [^\']* \') +
	;
<newline>
	: \r \n? | \n
	;

File
	: Lines {{}}
	;
Lines
	: Line 'line'
	| Lines <newline> 'eol' Line 'line'
	;
Line
	: Value 'value' {{}}
	| Line "","" 'comma' Value 'value' {{}}
	;
Value
	: <entry>
	| Missing
	;
Missing
	: {SmaCCToken value: '' start: self position ids: #()}
	;"
]

{ #category : #'file types' }
CSVParser class >> fileExtension [
	^ '.csv'
]

{ #category : #'file types' }
CSVParser class >> fileExtensionType [
	^ 'CSV files'
]

{ #category : #parsing }
CSVParser class >> parseFileWithHeader: aFilename [
	| lines headerLine headerNames |
	lines := self parseFileWithoutHeader: aFilename.
	lines isEmpty
		ifTrue: [ ^ lines ].
	headerLine := lines removeFirst.
	headerNames := (1 to: headerLine size)
		collect: [ :i | (headerLine at: i) ifNil: [ 'Column ' , i printString ] ].
	1 to: lines size do:
		[ :i | 
		| line dict |
		dict := Dictionary new: headerNames size.
		headerNames
			with: (lines at: i)
			do: [ :header :value | dict at: header put: value ].
		lines at: i put: dict ].
	^ lines
]

{ #category : #parsing }
CSVParser class >> parseFileWithoutHeader: aFilename [
	| file maxSize lines |
	file := self parseFile: aFilename.
	maxSize := file lines
		inject: 0
		into: [ :sum :each | sum max: each values size ].
	lines := file lines
		collect:
			[ :each | 
			| line |
			line := Array new: maxSize.
			1 to: each values size do: [ :i | line at: i put: (self dataValueFrom: (each values at: i)) ].
			line ].
	(file lines size > 0
		and:
			[ file lines last commas isEmpty
				and: [ (self dataValueFrom: file lines last values first) isNil ] ])
		ifTrue: [ lines removeLast ].
	^ lines
]

{ #category : #'generated-accessing' }
CSVParser class >> scannerClass [
	^CSVScanner
]

{ #category : #generated }
CSVParser class >> startingStateForFile [
	^ 1
]

{ #category : #'generated-reduction actions' }
CSVParser >> reduceActionForFile1: nodes [
	| result |
	result := CSVFileNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result lines.
	result addTokens: ((nodes at: 1) at: 2) to: result eols.
	^ result
]

{ #category : #'generated-reduction actions' }
CSVParser >> reduceActionForLine1: nodes [
	| result |
	result := CSVLineNode new.
	result addToken: (nodes at: 1) to: result values.
	^ result
]

{ #category : #'generated-reduction actions' }
CSVParser >> reduceActionForLine2: nodes [
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result commas.
	result addToken: (nodes at: 3) to: result values.
	^ result
]

{ #category : #'generated-reduction actions' }
CSVParser >> reduceActionForLines1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSVParser >> reduceActionForLines2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSVParser >> reduceActionForMissing1: nodes [
	^ SmaCCToken value: '' start: self position ids: #()
]

{ #category : #'generated-reduction actions' }
CSVParser >> reduceActionForValue1: nodes [
	^ nodes at: 1
]

{ #category : #generated }
CSVParser >> reduceTable [
^#(
	#(9 0 #reduceActionForMissing1:) 
	#(7 1 #reduceActionForValue1:) 
	#(8 1 #reduceActionForLines1:) 
	#(5 1 #reduceActionForLine1:) 
	#(6 1 #reduceActionForFile1:) 
	#(5 3 #reduceActionForLine2:) 
	#(8 3 #reduceActionForLines2:)
	).
]

{ #category : #generated }
CSVParser >> symbolNames [
	^ #('","' '<entry>' '<newline>' 'B e g i n' 'Line' 'File' 'Value' 'Lines' 'Missing' 'E O F' 'error')
]

{ #category : #generated }
CSVParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #CSVFileNode #CSVLineNode #CSVFileNode #SmaCCToken #OrderedCollection #SmaCCToken #SmaCCToken #SmaCCToken)
]

{ #category : #generated }
CSVParser >> transitionTable [
^#(
#[1 0 6 0 1 0 9 0 2 0 6 0 3 0 13 0 5 0 17 0 6 0 21 0 7 0 25 0 8 0 29 0 9 0 6 0 10] 
#[0 0 10 0 1 0 3 0 10] 
#[1 0 33 0 1 0 14 0 3 0 14 0 10] 
#[0 0 0 0 10] 
#[0 0 18 0 1 0 3 0 10] 
#[1 0 37 0 3 0 22 0 10] 
#[0 0 10 0 1 0 3 0 10] 
#[1 0 6 0 1 0 9 0 2 0 6 0 3 0 41 0 7 0 29 0 9 0 6 0 10] 
#[1 0 6 0 1 0 9 0 2 0 6 0 3 0 45 0 5 0 21 0 7 0 29 0 9 0 6 0 10] 
#[0 0 26 0 1 0 3 0 10] 
#[1 0 33 0 1 0 30 0 3 0 30 0 10]
	).
]
