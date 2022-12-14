Class {
	#name : #DelphiFormParser,
	#superclass : #SmaCCGLRParser,
	#category : 'SmaCC-DelphiForms'
}

{ #category : #'generated-accessing' }
DelphiFormParser class >> cacheId [
	^'2017-05-03T19:29:17.325754+02:00'
]

{ #category : #generated }
DelphiFormParser class >> definitionComment [
"%glr;
%ignorecase;
%id <bytes>;
%prefix DelphiForm;
%suffix Node;
%root Parse;
%hierarchy Literal (Boolean Float Integer String);
%start Property Object Value Item;
<boolean>
	: true | false
	;
<LETTER> 
	: [a-zA-Z_üäöÜÄÖ] 
	;
<DIGIT> 
	: [0-9] 
	;
<name>
	: <LETTER> (<LETTER>|<DIGIT>)*
	;
<positive_integer>
	: \d+
	;
<integer>
	: \-? <positive_integer>
	;
<float>
	: <integer> (\. <positive_integer> | d | (\. <positive_integer>?)? e [\+\-]? <positive_integer>)
	;
<string>
	: (\' [^\']* \' | (\#\d+))+
	;
<bytes>
	: ([0-9a-f]{2,2})+
	;
<whitespace>
	: \s+
	;
<patternToken>
	: (\`  [^\`]* \`)+
	;
Form
	: Object
	;
Object
	: ObjectType 'objectTypeToken' <name> 'nameToken' "":"" 'colonToken' <name> 'typeToken' Index Properties ""end"" 'endToken' {{Object}}
	| ObjectType 'objectTypeToken' <name> 'typeToken' Index Properties ""end"" 'endToken' {{Object}}
	;
ObjectType
	: ""object""
	| ""inherited""
	| ""inline""
	;
Index
	:
	| ""["" 'left' <integer> 'indexToken' ""]"" 'right'
	;
Properties
	:
	| Properties Property 'property'
	;
Property
	: Assignment
	| Object
	;
Assignment
	: QualifiedName 'name' ""="" 'equalsToken' Value 'value' {{Property}}
	;
Value
	: Number
	| String
	| Set
	| QualifiedName 'name' {{NamedValue}}
	| Array
	| ByteArray
	| Boolean
	| ObjectArray
	;
Number
	: <integer> 'value' {{Integer}}
	| <float> 'value' {{Float}}
	;
String
	: <string> 'value' {{String}}
	| String 'left' ""+"" 'plus' <string> 'right' {{CombinedString}}
	;
Set
	: ""["" 'left' SetItems_ ""]"" 'right' {{Set}}
	;
SetItems_
	:
	| SetItems
	;
SetItems
	: <name> 'item' 
	| SetItems "","" 'comma' <name> 'item' 
	;
Array
	: ""("" 'left' Values "")"" 'right' {{Array}}
	;
Values
	: 
	| Values Value 'value'
	;
ByteArray
	: ""{"" 'left' ByteData ""}"" 'right' {{ByteArray}}
	;
ByteData
	: 
	| ByteData <bytes> 'line'
	;
Boolean
	: <boolean> 'value' {{Boolean}}
	;
ObjectArray
	: ""<"" 'left' Items "">"" 'right' {{ObjectArray}}
	;
Items
	: 
	| Items Item 'item' 
	;
Item
	: ""item"" 'itemToken' Properties ""end"" 'endToken' {{Item}}
	;
QualifiedName
	: <name> 'name' {{QualifiedName}}
	| QualifiedName ""."" 'period' <name> 'name' {{QualifiedName}}
	;"
]

{ #category : #'file types' }
DelphiFormParser class >> fileExtension [
	^ '.dfm'
]

{ #category : #'file types' }
DelphiFormParser class >> fileExtensionType [
	^ 'Delphi form files'
]

{ #category : #'generated-accessing' }
DelphiFormParser class >> scannerClass [
	^DelphiFormScanner
]

{ #category : #generated }
DelphiFormParser class >> startingStateForForm [
	^ 1
]

{ #category : #generated }
DelphiFormParser class >> startingStateForItem [
	^ 5
]

{ #category : #generated }
DelphiFormParser class >> startingStateForObject [
	^ 3
]

{ #category : #generated }
DelphiFormParser class >> startingStateForProperty [
	^ 2
]

{ #category : #generated }
DelphiFormParser class >> startingStateForValue [
	^ 4
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForArray1: nodes [
	| result |
	result := DelphiFormArrayNode new.
	result left: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result values.
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForAssignment1: nodes [
	| result |
	result := DelphiFormPropertyNode new.
	result name: (nodes at: 1).
	result equalsToken: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForBoolean1: nodes [
	| result |
	result := DelphiFormBooleanNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForByteArray1: nodes [
	| result |
	result := DelphiFormByteArrayNode new.
	result left: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result lines.
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForIndex1: nodes [
	| result |
	result := Array new: 3.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForIndex2: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForItem1: nodes [
	| result |
	result := DelphiFormItemNode new.
	result itemToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result properties.
	result endToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForItems1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForItems2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForNumber1: nodes [
	| result |
	result := DelphiFormIntegerNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForNumber2: nodes [
	| result |
	result := DelphiFormFloatNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForObject1: nodes [
	| result |
	result := DelphiFormObjectNode new.
	result objectTypeToken: (nodes at: 1).
	result nameToken: (nodes at: 2).
	result colonToken: (nodes at: 3).
	result typeToken: (nodes at: 4).
	result left: ((nodes at: 5) at: 1).
	result indexToken: ((nodes at: 5) at: 2).
	result right: ((nodes at: 5) at: 3).
	result addNodes: (nodes at: 6) to: result properties.
	result endToken: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForObject2: nodes [
	| result |
	result := DelphiFormObjectNode new.
	result objectTypeToken: (nodes at: 1).
	result typeToken: (nodes at: 2).
	result left: ((nodes at: 3) at: 1).
	result indexToken: ((nodes at: 3) at: 2).
	result right: ((nodes at: 3) at: 3).
	result addNodes: (nodes at: 4) to: result properties.
	result endToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForObjectArray1: nodes [
	| result |
	result := DelphiFormObjectArrayNode new.
	result left: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result items.
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForObjectType2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForQualifiedName1: nodes [
	| result |
	result := DelphiFormQualifiedNameNode new.
	result addToken: (nodes at: 1) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForQualifiedName2: nodes [
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result periods.
	result addToken: (nodes at: 3) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForSet1: nodes [
	| result |
	result := DelphiFormSetNode new.
	result left: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result items.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForSetItems1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForSetItems2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForSetItems_1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForSetItems_2: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForString1: nodes [
	| result |
	result := DelphiFormStringNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForString2: nodes [
	| result |
	result := DelphiFormCombinedStringNode new.
	result left: (nodes at: 1).
	result plus: (nodes at: 2).
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiFormParser >> reduceActionForValue4: nodes [
	| result |
	result := DelphiFormNamedValueNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #generated }
DelphiFormParser >> reduceTable [
^#(
	#(51 1 #reduceActionForObjectType2:) 
	#(27 1 #reduceActionForObjectType2:) 
	#(32 1 #reduceActionForQualifiedName1:) 
	#(46 1 #reduceActionForObjectType2:) 
	#(42 0 #reduceActionForSetItems_1:) 
	#(47 0 #reduceActionForItems1:) 
	#(44 0 #reduceActionForItems1:) 
	#(45 0 #reduceActionForItems1:) 
	#(38 1 #reduceActionForBoolean1:) 
	#(33 1 #reduceActionForNumber1:) 
	#(33 1 #reduceActionForNumber2:) 
	#(34 1 #reduceActionForString1:) 
	#(40 1 #reduceActionForValue4:) 
	#(40 1 #reduceActionForObjectType2:) 
	#(29 0 #reduceActionForItems1:) 
	#(28 0 #reduceActionForIndex1:) 
	#(43 1 #reduceActionForSetItems1:) 
	#(42 1 #reduceActionForSetItems_2:) 
	#(32 3 #reduceActionForQualifiedName2:) 
	#(31 3 #reduceActionForAssignment1:) 
	#(35 3 #reduceActionForSet1:) 
	#(39 3 #reduceActionForObjectArray1:) 
	#(47 2 #reduceActionForItems2:) 
	#(36 3 #reduceActionForArray1:) 
	#(44 2 #reduceActionForItems2:) 
	#(37 3 #reduceActionForByteArray1:) 
	#(45 2 #reduceActionForItems2:) 
	#(34 3 #reduceActionForString2:) 
	#(30 3 #reduceActionForItem1:) 
	#(29 2 #reduceActionForItems2:) 
	#(43 3 #reduceActionForSetItems2:) 
	#(28 3 #reduceActionForIndex2:) 
	#(41 5 #reduceActionForObject2:) 
	#(41 7 #reduceActionForObject1:)
	).
]

{ #category : #generated }
DelphiFormParser >> symbolNames [
	^ #('"."' '"]"' '"inherited"' '"inline"' '"="' '":"' '"end"' '"object"' '"["' '"+"' '">"' '","' '"item"' '"<"' '"}"' '"("' '")"' '"{"' '<boolean>' '<name>' '<integer>' '<float>' '<string>' '<bytes>' '<whitespace>' '<patternToken>' 'Form' 'Index' 'Properties' 'Item' 'Assignment' 'QualifiedName' 'Number' 'String' 'Set' 'Array' 'ByteArray' 'Boolean' 'ObjectArray' 'Value' 'Object' 'SetItems_' 'SetItems' 'Values' 'ByteData' 'Property' 'Items' 'E O F' 'error' 'B e g i n' 'ObjectType')
]

{ #category : #generated }
DelphiFormParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #DelphiFormObjectNode #OrderedCollection #OrderedCollection #DelphiFormItemNode #DelphiFormPropertyNode #DelphiFormQualifiedNameNode #DelphiFormLiteralNode #DelphiFormParseNode #DelphiFormSetNode #DelphiFormArrayNode #DelphiFormByteArrayNode #DelphiFormBooleanNode #DelphiFormObjectArrayNode #DelphiFormParseNode #DelphiFormObjectNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #DelphiFormParseNode #OrderedCollection #SmaCCToken #SmaCCToken #DelphiFormObjectNode #SmaCCToken)
]

{ #category : #generated }
DelphiFormParser >> transitionTable [
^#(
#[1 0 25 0 3 0 29 0 4 0 33 0 8 0 37 0 27 0 41 0 41 0 45 0 51] 
#[1 0 25 0 3 0 29 0 4 0 33 0 8 0 49 0 20 0 53 0 31 0 57 0 32 0 61 0 41 0 65 0 46 0 45 0 51] 
#[1 0 25 0 3 0 29 0 4 0 33 0 8 0 69 0 41 0 45 0 51] 
#[1 0 73 0 9 0 77 0 14 0 81 0 16 0 85 0 18 0 89 0 19 0 49 0 20 0 93 0 21 0 97 0 22 0 101 0 23 0 105 0 32 0 109 0 33 0 113 0 34 0 117 0 35 0 121 0 36 0 125 0 37 0 129 0 38 0 133 0 39 0 137 0 40] 
#[1 0 141 0 13 0 145 0 30] 
#[0 0 6 0 20] 
#[0 0 6 0 20] 
#[0 0 6 0 20] 
#[0 0 0 0 48] 
#[0 0 10 0 48] 
#[0 0 149 0 20] 
#[0 0 14 0 1 0 3 0 4 0 5 0 7 0 8 0 9 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 48] 
#[0 0 18 0 3 0 4 0 7 0 8 0 20 0 48] 
#[1 0 153 0 1 0 157 0 5] 
#[0 0 18 0 3 0 4 0 7 0 8 0 20 0 48] 
#[0 0 0 0 48] 
#[0 0 0 0 48] 
#[1 0 22 0 2 0 161 0 20 0 165 0 42 0 169 0 43] 
#[1 0 26 0 11 0 26 0 13 0 173 0 47] 
#[1 0 30 0 9 0 30 0 14 0 30 0 16 0 30 0 17 0 30 0 18 0 30 0 19 0 30 0 20 0 30 0 21 0 30 0 22 0 30 0 23 0 177 0 44] 
#[1 0 34 0 15 0 34 0 24 0 181 0 45] 
#[0 0 38 0 3 0 4 0 7 0 8 0 9 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 48] 
#[0 0 42 0 3 0 4 0 7 0 8 0 9 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 48] 
#[0 0 46 0 3 0 4 0 7 0 8 0 9 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 48] 
#[0 0 50 0 3 0 4 0 7 0 8 0 9 0 10 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 48] 
#[1 0 153 0 1 0 54 0 3 0 54 0 4 0 54 0 7 0 54 0 8 0 54 0 9 0 54 0 14 0 54 0 16 0 54 0 17 0 54 0 18 0 54 0 19 0 54 0 20 0 54 0 21 0 54 0 22 0 54 0 23 0 54 0 48] 
#[0 0 58 0 3 0 4 0 7 0 8 0 9 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 48] 
#[1 0 58 0 3 0 58 0 4 0 58 0 7 0 58 0 8 0 58 0 9 0 185 0 10 0 58 0 14 0 58 0 16 0 58 0 17 0 58 0 18 0 58 0 19 0 58 0 20 0 58 0 21 0 58 0 22 0 58 0 23 0 58 0 48] 
#[0 0 58 0 3 0 4 0 7 0 8 0 9 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 48] 
#[0 0 58 0 3 0 4 0 7 0 8 0 9 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 48] 
#[0 0 58 0 3 0 4 0 7 0 8 0 9 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 48] 
#[0 0 58 0 3 0 4 0 7 0 8 0 9 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 48] 
#[0 0 58 0 3 0 4 0 7 0 8 0 9 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 48] 
#[0 0 0 0 48] 
#[1 0 62 0 3 0 62 0 4 0 62 0 7 0 62 0 8 0 62 0 20 0 189 0 29] 
#[0 0 0 0 48] 
#[1 0 66 0 3 0 66 0 4 0 193 0 6 0 66 0 7 0 66 0 8 0 197 0 9 0 66 0 20 0 201 0 28] 
#[0 0 205 0 20] 
#[1 0 73 0 9 0 77 0 14 0 81 0 16 0 85 0 18 0 89 0 19 0 49 0 20 0 93 0 21 0 97 0 22 0 101 0 23 0 105 0 32 0 109 0 33 0 113 0 34 0 117 0 35 0 121 0 36 0 125 0 37 0 129 0 38 0 133 0 39 0 209 0 40] 
#[0 0 70 0 2 0 12] 
#[0 0 213 0 2] 
#[1 0 74 0 2 0 217 0 12] 
#[1 0 221 0 11 0 141 0 13 0 225 0 30] 
#[1 0 73 0 9 0 77 0 14 0 81 0 16 0 229 0 17 0 85 0 18 0 89 0 19 0 49 0 20 0 93 0 21 0 97 0 22 0 101 0 23 0 105 0 32 0 109 0 33 0 113 0 34 0 117 0 35 0 121 0 36 0 125 0 37 0 129 0 38 0 133 0 39 0 233 0 40] 
#[1 0 237 0 15 0 241 0 24] 
#[0 0 245 0 23] 
#[1 0 25 0 3 0 29 0 4 0 249 0 7 0 33 0 8 0 49 0 20 0 53 0 31 0 57 0 32 0 61 0 41 0 253 0 46 0 45 0 51] 
#[0 1 1 0 20] 
#[0 1 5 0 21] 
#[1 0 62 0 3 0 62 0 4 0 62 0 7 0 62 0 8 0 62 0 20 1 9 0 29] 
#[0 0 78 0 1 0 3 0 4 0 5 0 7 0 8 0 9 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 48] 
#[0 0 82 0 3 0 4 0 7 0 8 0 20 0 48] 
#[0 0 86 0 3 0 4 0 7 0 8 0 9 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 48] 
#[0 1 13 0 20] 
#[0 0 90 0 3 0 4 0 7 0 8 0 9 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 48] 
#[0 0 94 0 11 0 13] 
#[0 0 98 0 3 0 4 0 7 0 8 0 9 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 48] 
#[0 0 102 0 9 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23] 
#[0 0 106 0 3 0 4 0 7 0 8 0 9 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 48] 
#[0 0 110 0 15 0 24] 
#[0 0 114 0 3 0 4 0 7 0 8 0 9 0 10 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 48] 
#[0 0 118 0 11 0 13 0 48] 
#[0 0 122 0 3 0 4 0 7 0 8 0 20] 
#[1 0 66 0 3 0 66 0 4 0 66 0 7 0 66 0 8 0 197 0 9 0 66 0 20 1 17 0 28] 
#[0 1 21 0 2] 
#[1 0 25 0 3 0 29 0 4 1 25 0 7 0 33 0 8 0 49 0 20 0 53 0 31 0 57 0 32 0 61 0 41 0 253 0 46 0 45 0 51] 
#[0 0 126 0 2 0 12] 
#[1 0 62 0 3 0 62 0 4 0 62 0 7 0 62 0 8 0 62 0 20 1 29 0 29] 
#[0 0 130 0 3 0 4 0 7 0 8 0 20] 
#[0 0 134 0 3 0 4 0 7 0 8 0 20 0 48] 
#[1 0 25 0 3 0 29 0 4 1 33 0 7 0 33 0 8 0 49 0 20 0 53 0 31 0 57 0 32 0 61 0 41 0 253 0 46 0 45 0 51] 
#[0 0 138 0 3 0 4 0 7 0 8 0 20 0 48]
	).
]

{ #category : #testing }
DelphiFormParser >> tryAllTokens [
	^ currentToken ids includes: scanner bytesId
]
