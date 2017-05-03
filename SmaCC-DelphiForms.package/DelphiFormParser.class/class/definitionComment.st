generated
definitionComment
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