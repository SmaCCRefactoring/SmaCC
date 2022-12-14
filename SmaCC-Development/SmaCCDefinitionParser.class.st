"
SmaCCDefinitionParser is a SmaCCParser that parses a parser's definition.

Instance Variables:
	grammar	<SmaCCGrammar>	we create the grammar object from the parser's definition
	scannerDefinition	<SmaCCScannerDefinition>	we also create the scanner definition object from the parser's definition
"
Class {
	#name : #SmaCCDefinitionParser,
	#superclass : #SmaCCParser,
	#instVars : [
		'scannerDefinition',
		'grammar',
		'defaultClasses'
	],
	#category : 'SmaCC-Development'
}

{ #category : #'generated-accessing' }
SmaCCDefinitionParser class >> cacheId [
	^'2018-06-28T18:53:20.270401+02:00'
]

{ #category : #generated }
SmaCCDefinitionParser class >> definitionComment [
"%states default scanner directives parser;

directives <states>
	: states 
	;
directives <parser>
	: parser
	;
directives <excludes> 
	: excludes 
	;
directives <root> 
	: root 
	;
directives <hierarchy> 
	: hierarchy 
	;
directives <attributes>
	: attributes
	;
directives <prefix> 
	: prefix 
	;
directives <suffix> 
	: suffix 
	;
directives <left> 
	: left 
	;
directives <right> 
	: right 
	;
directives <nonassoc> 
	: nonassoc 
	;
directives <id> 
	: id 
	;
directives <start> 
	: start 
	;
directives <glr>
	: glr
	;
directives <ignorecase>
	: ignorecase
	;
directives <ignorevariables>
	: ignore_variables
	;
directives <annotate_tokens>
	: annotate_tokens
	;
directives <unicode>
	: unicode
	;
<name> 
	: (<isLetter> | _) (<isLetter> | _ | <isDigit>)*
	;
<directive> 
	: \%
	;
<whitespace>
	: \s+ 
	;
<tokenname>
	: \< <name> \>
	;
<symbolname>
	: <name>
	 ;
<keyword>
	: (\"" [^\""]+ \"") + 
	;
<comment>
	: (\# [^\r\n]*) 
	| (\/\* [^\*]* \*+ ([^\/\*] [^\*]* \*+)* \/)
	;
<code>
	: \{ 
	;
<variablename>
	: \' <name> \' 
	;
<production>
	: \: (\: \=)? 
	;
<directive>
	: \% 
	;
<semicolon>
	: \; 
	;
scanner <backslashcharacter>
	: \\ [^cx] 
	| \\ c [A-Z] 
	| \\ x [0-9A-Fa-f]{1,4}
	;
scanner <characterblock>
	: \[ ([^\]\\] | <backslashcharacter> )+ \] 
	;
scanner <repeat>
	: \{ [0-9]* \, [0-9]* \}
	;
scanner <character>
	: [^\ \t\v\\\r\n\{\(\[\.\%\:\<]
	; 
scanner <anycharacter>
	: \.
	;
parser <optionalLeft>
	: \[
	;
parser <optionalRight>
	: \] 
	;
parser <classLeft> 
	: \{\{ 
	;
parser <classRight> 
	: \}\} 
	;

%id <code> <keyword> <symbolname> <tokenname> <variablename> <semicolon>
	<directive> <production> <classLeft> <classRight>;
%left	""|"";
%left ""("" <character> <backslashcharacter> <characterblock> <anycharacter> <tokenname> <symbolname> <directive>;
%left ""*"" ""+"" ""?"" <repeat> ;

File
	: Rules 
			{grammar 
				addExtraSymbols; 
				yourself}
	;
Rules
	: Rule
	| Rules Rule
	;
Rule 
	: ProductionRule 
			{grammar setStartSymbolIfNone: '1'}
	| DirectiveLine
	| RegexRule 
			{'1' states isEmpty ifTrue: ['1' addStates: scannerDefinition nonExcludeStates]}
	;
# Directives
DirectiveLine 
	: StartDirective <directive> Directive EndDirective <semicolon>
	;
Directive 
	: ExcludeStatesLine 
	| StatesLine
	| RootClassLine
	| SuperclassLine
	| AttributesLine
	| PrefixLine
	| SuffixLine
	| LeftLine 
	| RightLine 
	| NonAssociativeLine
	| IdMethodLine
	| StartLine 
	| GLR
	| Unicode
	| IgnoreCase
	| IgnoredVariables
	| AnnotateTokens
	| ParserType
	;
StartDirective 
	: 		{self state: #directives}
	;
EndDirective 
	: 		{self state: #default}
	;
StatesLine 
	: <states> States
	;
States 
	: 
	| States Symbol 
			{scannerDefinition addState: '2'}
	;
ExcludeStatesLine 
	: <excludes> ExcludeStates
	;
ExcludeStates 
:
	| ExcludeStates Symbol 
			{scannerDefinition addExcludeState: '2'}
	;
RootClassLine 
	: <root> <symbolname> 'root' 
			{(grammar classNamed: root value asSymbol) beRoot}
	;
SuperclassLine
	: <hierarchy> <symbolname> 'superclass' ""("" ClassList 'classes' "")""
			{classes do: [:each | (grammar classNamed: each) superclass: (grammar classNamed: superclass value asSymbol)]}
	;
AttributesLine
	: <attributes> <symbolname> 'aClass' ""("" IvarList 'ivars' "")""
			{(grammar classNamed: aClass value asSymbol)  extraAttributes: (ivars collect: [:each | SmaCCVariableDefinition variableName: each ])} ;
IvarList	
	:		{OrderedCollection new}
	| IvarList 'list' <symbolname> 'name'	
			{list add: name value; yourself} 
	;
ClassList 
	: 		{OrderedCollection new}
	| ClassList 'list' <symbolname> 'name' 
			{list 
				add: name value asSymbol; 
				yourself}
	;
PrefixLine
	: <prefix> <symbolname> 'prefix' 
			{grammar prefix: prefix value}
	;
SuffixLine
	: <suffix> <symbolname> 'suffix' 
			{grammar suffix: suffix value}
	;
LeftLine
	: <left> TokenList 'tokens' 
			{tokens 
				do: 
					[:each | 
					grammar 
						leftPrecedenceFor: each; 
						setOperatorPrecedenceFor: each to: scanner lineNumber].
			nil}
	;
RightLine
	: <right> TokenList 'tokens' 
			{tokens 
				do: 
					[:each | 
					grammar 
						rightPrecedenceFor: each; 
						setOperatorPrecedenceFor: each to: scanner lineNumber].
			nil}
	;
NonAssociativeLine
	: <nonassoc> TokenList 'tokens'
			{tokens 
				do: 
					[:each | 
					grammar 
						nonAssociativePrecedenceFor: each; 
						setOperatorPrecedenceFor: each to: scanner lineNumber].
			nil}
	;
TokenList
	: Term
	| TokenList Term
	;
IdMethodLine
	: <id> IdTokens 'tokens' 
			{tokens do: [:each | grammar makeTokenIdMethodFor: each]. nil}
	;
IdTokens
	: <tokenname> 
			{OrderedCollection with: '1' value}
	| IdTokens <tokenname> 
			{'1' 
				add: '2' value; 
				yourself}
	;
StartLine
	: <start> StartingTokens
	;
StartingTokens
	: <symbolname> 'symbol' 
			{grammar addStartingSymbol: (grammar nonTerminalSymbolNamed: symbol value)}
	| StartingTokens <symbolname> 'symbol' 
			{grammar addStartingSymbol: (grammar nonTerminalSymbolNamed: symbol value)}
	;
GLR
	: <glr>
			{grammar parserType: #glr}
	;
ParserType:
	<parser> <symbolname> 'symbol' {grammar parserType: symbol value asSymbol}
	;
Unicode:
	<unicode>
			{SmaCCGrammar maximumCharacterValue: 16rE01EF}
	;
IgnoredVariables
	: EndDirective <ignorevariables> IgnoredVariableList 'variables'
			{grammar ignoredVariables: variables}
	;
IgnoredVariableList
	: <symbolname> 'name'
			{OrderedCollection with: name value}
	| IgnoredVariableList 'variables' <symbolname> 'name'
			{variables add: name value.
			variables}
	;
IgnoreCase
	: <ignorecase>
			{grammar ignoreCase: true}
	;
AnnotateTokens
	: <annotate_tokens>
			{grammar annotateTokens: true}
	;
# Scanner
RegexRule 
	: StartRegex <tokenname> 'token' <production> Regex 'regex' EndRegex <semicolon>
			{| symbol |
			regex position: token startPosition. 
			scannerDefinition addToken: regex withName: token value. 
			symbol := grammar findSymbolNamed: token value ifAbsent: [nil].
			symbol notNil ifTrue: [symbol regularExpression: regex].
			regex}
	| Symbol 'state' RegexRule 'rule'
			{rule
				addState: state; 
				yourself}
	;
StartRegex
	: 		{self state: #scanner}
	;
EndRegex
	: 		{self state: #default}
	;
Symbol 
	: <symbolname> 
			{'1' value asSymbol}
	;
Regex
	: RegexTerm 
			{'1'}
	| Regex ""|"" Regex 
			{'1' | '3'}
	| Regex RegexTerm 
			{'1' , '2'}
	;
RegexTerm
	: <character> 
			{SmaCCCharacterRENode characters: (SmaCCCharacterSet withAll: '1' value)}
	| <anycharacter> 
			{SmaCCCharacterRENode characters: self allCharacters}
	| <backslashcharacter> 
			{self nodeFor: (ReadStream on: ('1' value copyFrom: 2 to: '1' value size))} 
	| ""("" Regex "")"" 
			{'2'}
	| <characterblock> 
			{self parseCharacterBlock: '1'}
	| <tokenname> 
			{(scannerDefinition tokenNamed: '1' value ifAbsentPut: [self generateImplicitToken: '1']) copy}
	| <symbolname> 
			{SmaCCSequenceRENode nodes: ('1' value asOrderedCollection collect: [:each | SmaCCCharacterRENode characters: (SmaCCCharacterSet with: each)])}
	| RegexTerm ""*""	
			{'1' repeat}
	| RegexTerm ""+"" 
			{'1' repeatForAtLeast: 1}
	| RegexTerm ""?"" 
			{'1' repeatFor: 0 to: 1}
	| RegexTerm <repeat> 
			{| readStream start stop | 
			readStream := ReadStream on: ('2' value copyFrom: 2 to: '2' value size - 1). 
			start := readStream upTo: $,. 
			stop := readStream upToEnd.
			'1' repeatFor: (start isEmpty ifTrue: [0] ifFalse: [start asNumber]) to: (stop isEmpty ifTrue: [(1 bitShift: 31)] ifFalse: [stop asNumber])}
	;
# Parser 
ProductionRule
	: <symbolname> 'symbolName' StartProduction <production> ParserRules 'rules' EndProduction <semicolon>
			{| symbol | 
			symbol := grammar nonTerminalSymbolNamed: symbolName value. 
			rules do: [:each | symbol addProduction: each]. 
			self createDefaultClassesForSymbol: symbolName value.
			symbol}
	;
StartProduction
	: 		{self state: #parser}
	;
EndProduction
	: 		{self state: #default}
	;
ParserRules
	: ParserRules ""|"" ParserRule 
			{'1' 
				add: '3'; 
				yourself}
	| ParserRule
	;
ParserRule 
	: Terms 'rhs' 
			{rhs}
	| Terms 'rhs' <code> 'code' 
			{self verifyCodeToken: code for: rhs} 
	| Terms 'rhs' <classLeft> <symbolname> 'className' <classRight>
			{self createClass: className value asSymbol for: rhs}
	| Terms 'rhs' <classLeft> <classRight>
			{self createDefaultClassFor: rhs}
	;
Terms 
	: 		{grammar newRHS}
	| Terms 'rhs' Term 'term'
			{rhs 
				add: term; 
				yourself}	
	| Terms 'rhs' Term 'term' <variablename> 'variableNameToken'
			{rhs 
				add: term; 
				nameLastItem: (variableNameToken value copyFrom: 2 to: variableNameToken value size - 1); 
				yourself}	
	;

Term
	: <keyword> 
			{grammar keywordTerminalNamed: '1' value}
	| <tokenname>
			{grammar
				findSymbolNamed: '1' value
				ifAbsentAdd: 
					[| node symbol |
					symbol := grammar newTerminalSymbolNamed: '1' value.
					(scannerDefinition includesTokenNamed: '1' value) 
						ifTrue: [symbol regularExpression: (scannerDefinition tokenNamed: '1' value)]
						ifFalse:
							[node := self generateImplicitToken: '1'.
							node notNil
								ifTrue: 
									[node addStates: scannerDefinition nonExcludeStates.
									symbol regularExpression: node]].
					symbol]}
	| <symbolname> 
			{grammar nonTerminalSymbolNamed: '1' value}
	| ""error"" 
			{grammar errorSymbol}
	| ""("" SimpleTerms "")""
			{grammar makeGroupFor: '2'}
	| ""["" SimpleTerms ""]""
			{grammar makeOptionalSymbolFor: (grammar makeGroupFor: '2')}
	| Term ""?""
			{ grammar makeOptionalSymbolFor: '1' }
	| Term 'term' <variablename> 'variableNameToken' ""?""
			{ grammar makeOptionalSymbolFor: term named: (variableNameToken value copyFrom: 2 to: variableNameToken value size - 1) }
	| Term ""*""
			{ grammar makeRepeatSymbolFor: '1' }
	| Term 'term' <variablename> 'variableNameToken' ""*""
		{ grammar makeRepeatSymbolFor: term named: (variableNameToken value copyFrom: 2 to: variableNameToken value size - 1) }
	| Term ""+""
			{ grammar makeRepeatMultipleSymbolFor: '1' }
	| Term 'term' <variablename> 'variableNameToken' ""+""
			{ grammar makeRepeatMultipleSymbolFor: term named: (variableNameToken value copyFrom: 2 to: variableNameToken value size - 1) }	
	;

SimpleTerms
	: SimpleTerm
		{OrderedCollection with: '1'}
	| SimpleTerms 'terms' ""|"" SimpleTerm 'term'
		{terms add: term; yourself}
	;

SimpleTerm
	: { grammar newRHS }
	| SimpleTerm 'rhs' Term 'term' 
		{rhs
			add: term;
			yourself} 
	| SimpleTerm 'rhs' Term 'term'  <variablename> 'variableNameToken'
		{rhs
			add: term;
			nameLastItem: (variableNameToken value copyFrom: 2 to: variableNameToken value size - 1);
			yourself} 
	;"
]

{ #category : #'generated-accessing' }
SmaCCDefinitionParser class >> scannerClass [
	^SmaCCDefinitionScanner
]

{ #category : #generated }
SmaCCDefinitionParser class >> startingStateForFile [
	^ 1
]

{ #category : #'private-strings' }
SmaCCDefinitionParser >> allCharacters [
	^ SmaCCGrammar allCharacters
]

{ #category : #'private-strings' }
SmaCCDefinitionParser >> carriageReturnString [
	^ SmaCCCharacterSet with: (Character value: 13)
]

{ #category : #private }
SmaCCDefinitionParser >> charactersFor: aStream in: aToken [
	| characters char endCharacters |
	aStream atEnd
		ifTrue: [ self reportCharacterBlockErrorForToken: aToken ].
	char := aStream next.
	characters := char == $\
		ifTrue: [ (self nodeFor: aStream) characters ]
		ifFalse: [ OrderedCollection with: char ].
	(characters size = 1 and: [ aStream peekFor: $- ])
		ifFalse: [ ^ characters ].
	endCharacters := self charactersFor: aStream in: aToken.
	endCharacters size > 1
		ifTrue: [ self reportCharacterBlockErrorForToken: aToken ].
	^ (characters first asInteger to: endCharacters first asInteger)
		collect: [ :each | Character value: each ]
]

{ #category : #private }
SmaCCDefinitionParser >> createClass: aSymbol for: aSmaCCRHS [
	(grammar classNamed: aSymbol) addProduction: aSmaCCRHS.
	^ aSmaCCRHS
]

{ #category : #private }
SmaCCDefinitionParser >> createDefaultClassFor: aSmaCCRHS [
	defaultClasses add: aSmaCCRHS.
	^ aSmaCCRHS
]

{ #category : #private }
SmaCCDefinitionParser >> createDefaultClassesForSymbol: aString [
	| className index |
	className := aString capitalized.
	[ index := className indexOf: $_.
	index > 0 and: [ className size > 1 ] ]
		whileTrue:
			[ className := (className copyFrom: 1 to: index - 1)
				, (className copyFrom: index + 1 to: className size) capitalized ].
	className := className asSymbol.
	defaultClasses do: [ :each | self createClass: className for: each ].
	defaultClasses := OrderedCollection new
]

{ #category : #'private-strings' }
SmaCCDefinitionParser >> formFeedString [
	^ SmaCCCharacterSet with: (Character value: 12)
]

{ #category : #private }
SmaCCDefinitionParser >> generateImplicitToken: aSmaCCToken [
	^ (SmaCCGrammar implicitToken: aSmaCCToken value)
		ifNil: [ SmaCCParserError new
				messageText: 'Undefined token ' , aSmaCCToken value;
				tag: aSmaCCToken;
				signal ]
]

{ #category : #'initialize-release' }
SmaCCDefinitionParser >> grammar: aSmaCCGrammar [
	grammar := aSmaCCGrammar.
	scannerDefinition := SmaCCScannerDefinition new.
	grammar scannerDefinition: scannerDefinition
]

{ #category : #private }
SmaCCDefinitionParser >> hexStringFrom: aStream [
	^ SmaCCCharacterSet with: (Character value: (self hexValueFrom: aStream))
]

{ #category : #private }
SmaCCDefinitionParser >> hexValueFrom: aStream [
	| char value count |
	count := value := 0.
	[ aStream atEnd not
		and:
			[ count < 4
				and:
					[ char := aStream peek.
					(char between: $0 and: $9)
						or: [ (char between: $A and: $F) or: [ char between: $a and: $f ] ] ] ] ]
		whileTrue:
			[ count := count + 1.
			value := value * 16 + aStream next digitValue ].
	^ value
]

{ #category : #'initialize-release' }
SmaCCDefinitionParser >> initialize [
	super initialize.
	self grammar: SmaCCGrammar new.
	defaultClasses := OrderedCollection new
]

{ #category : #testing }
SmaCCDefinitionParser >> isDigit: each [
	^ each between: $0 and: $9
]

{ #category : #testing }
SmaCCDefinitionParser >> isLetterOrDigit: each [
	^ (each between: $a and: $z)
		or:
			[ (each between: $A and: $Z)
				or: [ (each between: $0 and: $9) or: [ each == $_ ] ] ]
]

{ #category : #testing }
SmaCCDefinitionParser >> isWhitespace: each [
	^ self whitespaceValues includes: each asInteger
]

{ #category : #'private-strings' }
SmaCCDefinitionParser >> newlineString [
	^ SmaCCCharacterSet with: (Character value: 10)
]

{ #category : #private }
SmaCCDefinitionParser >> nodeFor: aStream [
	| block char |
	block := nil.
	char := aStream next.
	char == $f
		ifTrue: [ ^ SmaCCCharacterRENode characters: self formFeedString ].
	char == $n
		ifTrue: [ ^ SmaCCCharacterRENode characters: self newlineString ].
	char == $r
		ifTrue: [ ^ SmaCCCharacterRENode characters: self carriageReturnString ].
	char == $t
		ifTrue: [ ^ SmaCCCharacterRENode characters: self tabString ].
	char == $v
		ifTrue: [ ^ SmaCCCharacterRENode characters: self verticalTabString ].
	char == $c
		ifTrue: [ ^ SmaCCCharacterRENode characters: (SmaCCCharacterSet with: (Character value: aStream next asInteger - $A asInteger)) ].
	char == $x
		ifTrue: [ ^ SmaCCCharacterRENode characters: (self hexStringFrom: aStream) ].
	char == $d
		ifTrue: [ block := [ :each | self isDigit: each ] ].
	char == $D
		ifTrue: [ block := [ :each | (self isDigit: each) not ] ].
	char == $s
		ifTrue: [ block := [ :each | self isWhitespace: each ] ].
	char == $S
		ifTrue: [ block := [ :each | (self isWhitespace: each) not ] ].
	char == $w
		ifTrue: [ block := [ :each | self isLetterOrDigit: each ] ].
	char == $W
		ifTrue: [ block := [ :each | (self isLetterOrDigit: each) not ] ].
	block isNil
		ifTrue: [ ^ SmaCCCharacterRENode characters: (SmaCCCharacterSet with: char) ].
	^ SmaCCCharacterRENode characters: (self allCharacters select: block)
]

{ #category : #private }
SmaCCDefinitionParser >> parseCharacterBlock: aToken [
	| characters aStream invert node |
	aStream := ReadStream on: (aToken value copyFrom: 2 to: aToken value size - 1).
	characters := OrderedCollection new.
	invert := aStream peekFor: $^.
	[ aStream atEnd ] whileFalse: [ characters addAll: (self charactersFor: aStream in: aToken) ].
	node := SmaCCCharacterRENode characters: (SmaCCCharacterSet withAll: characters).
	invert
		ifTrue: [ node := SmaCCNotRENode on: node ].
	^ node
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForAnnotateTokens1: nodes [
	^ grammar annotateTokens: true
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForAttributesLine1: nodes [
	^ (grammar classNamed: (nodes at: 2) value asSymbol)
		extraAttributes:
			((nodes at: 4)
				collect: [ :each | SmaCCVariableDefinition variableName: each ])
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForClassList1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForClassList2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2) value asSymbol;
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForEndDirective1: nodes [
	^ self state: #default
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForExcludeStates2: nodes [
	^ scannerDefinition addExcludeState: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForFile1: nodes [
	^ grammar
		addExtraSymbols;
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForGLR1: nodes [
	^ grammar parserType: #glr
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForIdMethodLine1: nodes [
	(nodes at: 2) do: [ :each | grammar makeTokenIdMethodFor: each ].
	^ nil
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForIdTokens1: nodes [
	^ OrderedCollection with: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForIdTokens2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2) value;
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForIgnoreCase1: nodes [
	^ grammar ignoreCase: true
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForIgnoredVariableList2: nodes [
	(nodes at: 1) add: (nodes at: 2) value.
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForIgnoredVariables1: nodes [
	^ grammar ignoredVariables: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForLeftLine1: nodes [
	(nodes at: 2)
		do: [ :each | 
			grammar
				leftPrecedenceFor: each;
				setOperatorPrecedenceFor: each to: scanner lineNumber ].
	^ nil
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForNonAssociativeLine1: nodes [
	(nodes at: 2)
		do: [ :each | 
			grammar
				nonAssociativePrecedenceFor: each;
				setOperatorPrecedenceFor: each to: scanner lineNumber ].
	^ nil
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForParserRule1: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForParserRule2: nodes [
	^ self verifyCodeToken: (nodes at: 2) for: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForParserRule3: nodes [
	^ self createClass: (nodes at: 3) value asSymbol for: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForParserRule4: nodes [
	^ self createDefaultClassFor: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForParserRules1: nodes [
	^ (nodes at: 1)
		add: (nodes at: 3);
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForParserType1: nodes [
	^ grammar parserType: (nodes at: 2) value asSymbol
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForPrefixLine1: nodes [
	^ grammar prefix: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForProductionRule1: nodes [
	| symbol |
	symbol := grammar nonTerminalSymbolNamed:
		(nodes at: 1) value.
	(nodes at: 4) do: [ :each | symbol addProduction: each ].
	self createDefaultClassesForSymbol:
		(nodes at: 1) value.
	^ symbol
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegex2: nodes [
	^ (nodes at: 1) | (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegex3: nodes [
	^ (nodes at: 1) , (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexRule1: nodes [
	| symbol |
	(nodes at: 4) position: (nodes at: 2) startPosition.
	scannerDefinition
		addToken: (nodes at: 4)
		withName:
			(nodes at: 2) value.
	symbol := grammar
		findSymbolNamed:
			(nodes at: 2) value
		ifAbsent: [ nil ].
	symbol notNil
		ifTrue: [ symbol regularExpression: (nodes at: 4) ].
	^ nodes at: 4
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexRule2: nodes [
	^ (nodes at: 2)
		addState: (nodes at: 1);
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexTerm10: nodes [
	^ (nodes at: 1) repeatFor: 0 to: 1
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexTerm11: nodes [
	| readStream start stop |
	readStream := ReadStream
		on:
			((nodes at: 2) value copyFrom: 2 to:
				(nodes at: 2) value size - 1).
	start := readStream upTo: $,.
	stop := readStream upToEnd.
	^ (nodes at: 1)
		repeatFor:
			(start isEmpty
				ifTrue: [ 0 ]
				ifFalse: [ start asNumber ])
		to:
			(stop isEmpty
				ifTrue: [ 1 bitShift: 31 ]
				ifFalse: [ stop asNumber ])
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexTerm1: nodes [
	^ SmaCCCharacterRENode
		characters:
			(SmaCCCharacterSet withAll:
				(nodes at: 1) value)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexTerm2: nodes [
	^ SmaCCCharacterRENode characters: self allCharacters
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexTerm3: nodes [
	^ self
		nodeFor:
			(ReadStream
				on:
					((nodes at: 1) value copyFrom: 2 to:
						(nodes at: 1) value size))
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexTerm5: nodes [
	^ self parseCharacterBlock: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexTerm6: nodes [
	^ (scannerDefinition
		tokenNamed: (nodes at: 1) value
		ifAbsentPut: [ self generateImplicitToken: (nodes at: 1) ]) copy
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexTerm7: nodes [
	^ SmaCCSequenceRENode
		nodes:
			((nodes at: 1) value asOrderedCollection
				collect:
					[ :each | SmaCCCharacterRENode characters: (SmaCCCharacterSet with: each) ])
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexTerm8: nodes [
	^ (nodes at: 1) repeat
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexTerm9: nodes [
	^ (nodes at: 1) repeatForAtLeast: 1
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRightLine1: nodes [
	(nodes at: 2)
		do: [ :each | 
			grammar
				rightPrecedenceFor: each;
				setOperatorPrecedenceFor: each to: scanner lineNumber ].
	^ nil
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRootClassLine1: nodes [
	^ (grammar classNamed: (nodes at: 2) value asSymbol) beRoot
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRule1: nodes [
	^ grammar setStartSymbolIfNone: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRule3: nodes [
	^ (nodes at: 1) states isEmpty
		ifTrue: [ (nodes at: 1) addStates: scannerDefinition nonExcludeStates ]
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForSimpleTerms1: nodes [
	^ OrderedCollection with: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForStartDirective1: nodes [
	^ self state: #directives
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForStartProduction1: nodes [
	^ self state: #parser
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForStartRegex1: nodes [
	^ self state: #scanner
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForStartingTokens1: nodes [
	^ grammar
		addStartingSymbol:
			(grammar nonTerminalSymbolNamed:
				(nodes at: 1) value)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForStartingTokens2: nodes [
	^ grammar
		addStartingSymbol:
			(grammar nonTerminalSymbolNamed:
				(nodes at: 2) value)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForStates2: nodes [
	^ scannerDefinition addState: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForSuffixLine1: nodes [
	^ grammar suffix: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForSuperclassLine1: nodes [
	^ (nodes at: 4)
		do: [ :each | 
			(grammar classNamed: each)
				superclass:
					(grammar classNamed:
						(nodes at: 2) value asSymbol) ]
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForSymbol1: nodes [
	^ (nodes at: 1) value asSymbol
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerm10: nodes [
	^ grammar
		makeRepeatSymbolFor: (nodes at: 1)
		named:
			((nodes at: 2) value copyFrom: 2 to:
				(nodes at: 2) value size - 1)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerm11: nodes [
	^ grammar makeRepeatMultipleSymbolFor: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerm12: nodes [
	^ grammar
		makeRepeatMultipleSymbolFor: (nodes at: 1)
		named:
			((nodes at: 2) value copyFrom: 2 to:
				(nodes at: 2) value size - 1)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerm1: nodes [
	^ grammar keywordTerminalNamed: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerm2: nodes [
	^ grammar
		findSymbolNamed: (nodes at: 1) value
		ifAbsentAdd: [ | node symbol |
			symbol := grammar newTerminalSymbolNamed:
				(nodes at: 1) value.
			(scannerDefinition includesTokenNamed:
				(nodes at: 1) value)
				ifTrue: [ symbol
						regularExpression:
							(scannerDefinition tokenNamed:
								(nodes at: 1) value) ]
				ifFalse: [ node := self generateImplicitToken: (nodes at: 1).
					node notNil
						ifTrue: [ node addStates: scannerDefinition nonExcludeStates.
							symbol regularExpression: node ] ].
			symbol ]
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerm3: nodes [
	^ grammar nonTerminalSymbolNamed: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerm4: nodes [
	^ grammar errorSymbol
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerm5: nodes [
	^ grammar makeGroupFor: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerm6: nodes [
	^ grammar
		makeOptionalSymbolFor: (grammar makeGroupFor: (nodes at: 2))
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerm7: nodes [
	^ grammar makeOptionalSymbolFor: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerm8: nodes [
	^ grammar
		makeOptionalSymbolFor: (nodes at: 1)
		named:
			((nodes at: 2) value copyFrom: 2 to:
				(nodes at: 2) value size - 1)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerm9: nodes [
	^ grammar makeRepeatSymbolFor: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerms1: nodes [
	^ grammar newRHS
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerms2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerms3: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		nameLastItem:
			((nodes at: 3) value copyFrom: 2 to:
				(nodes at: 3) value size - 1);
		yourself
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForUnicode1: nodes [
	^ SmaCCGrammar maximumCharacterValue: 16rE01EF
]

{ #category : #generated }
SmaCCDefinitionParser >> reduceTable [
^#(
	#(81 0 #reduceActionForStartRegex1:) 
	#(48 0 #reduceActionForStartDirective1:) 
	#(55 1 #reduceActionForSymbol1:) 
	#(85 0 #reduceActionForStartProduction1:) 
	#(59 1 #reduceActionForRule3:) 
	#(59 1 #reduceActionForRule1:) 
	#(64 1 #reduceFor:) 
	#(63 1 #reduceActionForFile1:) 
	#(59 1 #reduceFor:) 
	#(77 0 #reduceActionForEndDirective1:) 
	#(53 2 #reduceActionForRegexRule2:) 
	#(64 2 #reduceFor:) 
	#(89 0 #reduceActionForTerms1:) 
	#(54 0 #reduceFor:) 
	#(57 0 #reduceFor:) 
	#(47 1 #reduceActionForGLR1:) 
	#(49 1 #reduceActionForIgnoreCase1:) 
	#(51 1 #reduceActionForAnnotateTokens1:) 
	#(95 1 #reduceActionForUnicode1:) 
	#(94 1 #reduceFor:) 
	#(87 0 #reduceActionForEndDirective1:) 
	#(86 1 #reduceFor:) 
	#(88 1 #reduceActionForParserRule1:) 
	#(76 2 #reduceFor:) 
	#(52 2 #reduceActionForParserType1:) 
	#(79 2 #reduceFor:) 
	#(74 2 #reduceActionForRootClassLine1:) 
	#(70 2 #reduceActionForPrefixLine1:) 
	#(68 2 #reduceActionForSuffixLine1:) 
	#(91 0 #reduceActionForTerms1:) 
	#(69 1 #reduceActionForTerm4:) 
	#(69 1 #reduceActionForTerm2:) 
	#(69 1 #reduceActionForTerm3:) 
	#(69 1 #reduceActionForTerm1:) 
	#(67 2 #reduceActionForLeftLine1:) 
	#(66 1 #reduceFor:) 
	#(65 2 #reduceActionForRightLine1:) 
	#(56 2 #reduceActionForNonAssociativeLine1:) 
	#(71 1 #reduceActionForIdTokens1:) 
	#(45 2 #reduceActionForIdMethodLine1:) 
	#(73 1 #reduceActionForStartingTokens1:) 
	#(46 2 #reduceFor:) 
	#(84 1 #reduceActionForRegexTerm6:) 
	#(84 1 #reduceActionForRegexTerm7:) 
	#(84 1 #reduceActionForRegexTerm3:) 
	#(84 1 #reduceActionForRegexTerm5:) 
	#(84 1 #reduceActionForRegexTerm1:) 
	#(84 1 #reduceActionForRegexTerm2:) 
	#(83 0 #reduceActionForEndDirective1:) 
	#(82 1 #reduceActionForParserRule1:) 
	#(88 2 #reduceActionForParserRule2:) 
	#(89 2 #reduceActionForTerms2:) 
	#(54 2 #reduceActionForStates2:) 
	#(57 2 #reduceActionForExcludeStates2:) 
	#(60 0 #reduceActionForClassList1:) 
	#(62 0 #reduceActionForClassList1:) 
	#(90 1 #reduceActionForSimpleTerms1:) 
	#(66 2 #reduceFor:) 
	#(69 2 #reduceActionForTerm9:) 
	#(69 2 #reduceActionForTerm11:) 
	#(69 2 #reduceActionForTerm7:) 
	#(71 2 #reduceActionForIdTokens2:) 
	#(73 2 #reduceActionForStartingTokens2:) 
	#(78 1 #reduceActionForIdTokens1:) 
	#(50 3 #reduceActionForIgnoredVariables1:) 
	#(80 5 #reduceFor:) 
	#(82 2 #reduceActionForRegex3:) 
	#(84 2 #reduceActionForRegexTerm8:) 
	#(84 2 #reduceActionForRegexTerm9:) 
	#(84 2 #reduceActionForRegexTerm10:) 
	#(84 2 #reduceActionForRegexTerm11:) 
	#(86 3 #reduceActionForParserRules1:) 
	#(58 6 #reduceActionForProductionRule1:) 
	#(88 3 #reduceActionForParserRule4:) 
	#(89 3 #reduceActionForTerms3:) 
	#(69 3 #reduceActionForTerm5:) 
	#(91 2 #reduceActionForTerms2:) 
	#(69 3 #reduceActionForTerm6:) 
	#(69 3 #reduceActionForTerm10:) 
	#(69 3 #reduceActionForTerm12:) 
	#(69 3 #reduceActionForTerm8:) 
	#(78 2 #reduceActionForIgnoredVariableList2:) 
	#(84 3 #liftSecondValue:) 
	#(82 3 #reduceActionForRegex2:) 
	#(53 6 #reduceActionForRegexRule1:) 
	#(88 4 #reduceActionForParserRule3:) 
	#(75 5 #reduceActionForSuperclassLine1:) 
	#(60 2 #reduceActionForClassList2:) 
	#(72 5 #reduceActionForAttributesLine1:) 
	#(62 2 #reduceActionForIdTokens2:) 
	#(90 3 #reduceActionForParserRules1:) 
	#(91 3 #reduceActionForTerms3:)
	).
]

{ #category : #private }
SmaCCDefinitionParser >> reportCharacterBlockErrorForToken: aToken [
	currentToken := aToken.
	self reportErrorMessage: 'Invalid character block'
]

{ #category : #generated }
SmaCCDefinitionParser >> symbolNames [
	^ #('"*"' '"("' '"]"' '"+"' '"|"' '"?"' '"["' '"error"' '")"' '<states>' '<parser>' '<excludes>' '<root>' '<hierarchy>' '<attributes>' '<prefix>' '<suffix>' '<left>' '<right>' '<nonassoc>' '<id>' '<start>' '<glr>' '<ignorecase>' '<ignorevariables>' '<annotate_tokens>' '<unicode>' '<whitespace>' '<tokenname>' '<symbolname>' '<keyword>' '<comment>' '<code>' '<variablename>' '<production>' '<directive>' '<semicolon>' '<backslashcharacter>' '<characterblock>' '<repeat>' '<character>' '<anycharacter>' '<classLeft>' '<classRight>' 'IdMethodLine' 'StartLine' 'GLR' 'StartDirective' 'IgnoreCase' 'IgnoredVariables' 'AnnotateTokens' 'ParserType' 'RegexRule' 'States' 'Symbol' 'NonAssociativeLine' 'ExcludeStates' 'ProductionRule' 'Rule' 'ClassList' 'B e g i n' 'IvarList' 'File' 'Rules' 'RightLine' 'TokenList' 'LeftLine' 'SuffixLine' 'Term' 'PrefixLine' 'IdTokens' 'AttributesLine' 'StartingTokens' 'RootClassLine' 'SuperclassLine' 'StatesLine' 'EndDirective' 'IgnoredVariableList' 'ExcludeStatesLine' 'DirectiveLine' 'StartRegex' 'Regex' 'EndRegex' 'RegexTerm' 'StartProduction' 'ParserRules' 'EndProduction' 'ParserRule' 'Terms' 'SimpleTerms' 'SimpleTerm' 'E O F' 'error' 'Directive' 'Unicode')
]

{ #category : #'private-strings' }
SmaCCDefinitionParser >> tabString [
	^ SmaCCCharacterSet withAll: '	'
]

{ #category : #generated }
SmaCCDefinitionParser >> transitionTable [
^#(
#[1 0 6 0 29 0 9 0 30 0 10 0 36 0 13 0 48 0 17 0 53 0 21 0 55 0 25 0 58 0 29 0 59 0 33 0 63 0 37 0 64 0 41 0 80 0 45 0 81] 
#[1 0 14 0 29 0 14 0 30 0 18 0 35 0 49 0 85] 
#[0 0 53 0 36] 
#[0 0 22 0 29 0 30 0 36 0 92] 
#[1 0 6 0 29 0 57 0 30 0 61 0 53 0 21 0 55 0 45 0 81] 
#[0 0 26 0 29 0 30 0 36 0 92] 
#[0 0 30 0 29 0 30 0 36 0 92] 
#[0 0 0 0 92] 
#[1 0 6 0 29 0 9 0 30 0 10 0 36 0 13 0 48 0 17 0 53 0 21 0 55 0 25 0 58 0 65 0 59 0 41 0 80 0 45 0 81 0 34 0 92] 
#[0 0 38 0 29 0 30 0 36 0 92] 
#[0 0 69 0 29] 
#[0 0 73 0 35] 
#[1 0 77 0 10 0 81 0 11 0 85 0 12 0 89 0 13 0 93 0 14 0 97 0 15 0 101 0 16 0 105 0 17 0 109 0 18 0 113 0 19 0 117 0 20 0 121 0 21 0 125 0 22 0 129 0 23 0 133 0 24 0 42 0 25 0 137 0 26 0 141 0 27 0 145 0 45 0 149 0 46 0 153 0 47 0 157 0 49 0 161 0 50 0 165 0 51 0 169 0 52 0 173 0 56 0 177 0 65 0 181 0 67 0 185 0 68 0 189 0 70 0 193 0 72 0 197 0 74 0 201 0 75 0 205 0 76 0 209 0 77 0 213 0 79 0 217 0 94 0 221 0 95] 
#[0 0 14 0 29 0 30 0 37] 
#[0 0 46 0 29 0 30 0 36 0 92] 
#[0 0 50 0 29 0 30 0 36 0 92] 
#[0 0 225 0 35] 
#[1 0 54 0 2 0 54 0 5 0 54 0 7 0 54 0 8 0 54 0 29 0 54 0 30 0 54 0 31 0 54 0 33 0 54 0 37 0 54 0 43 0 229 0 86 0 233 0 88 0 237 0 89] 
#[1 0 58 0 30 0 58 0 37 0 241 0 54] 
#[0 0 245 0 30] 
#[1 0 62 0 30 0 62 0 37 0 249 0 57] 
#[0 0 253 0 30] 
#[0 1 1 0 30] 
#[0 1 5 0 30] 
#[0 1 9 0 30] 
#[0 1 13 0 30] 
#[1 1 17 0 2 1 21 0 7 1 25 0 8 1 29 0 29 1 33 0 30 1 37 0 31 1 41 0 66 1 45 0 69] 
#[1 1 17 0 2 1 21 0 7 1 25 0 8 1 29 0 29 1 33 0 30 1 37 0 31 1 49 0 66 1 45 0 69] 
#[1 1 17 0 2 1 21 0 7 1 25 0 8 1 29 0 29 1 33 0 30 1 37 0 31 1 53 0 66 1 45 0 69] 
#[1 1 57 0 29 1 61 0 71] 
#[1 1 65 0 30 1 69 0 73] 
#[0 0 66 0 37] 
#[0 0 70 0 37] 
#[0 0 74 0 37] 
#[0 0 78 0 37] 
#[0 0 82 0 37] 
#[0 0 82 0 37] 
#[0 0 82 0 37] 
#[0 0 82 0 37] 
#[0 0 82 0 37] 
#[0 0 82 0 37] 
#[0 0 82 0 37] 
#[0 0 82 0 37] 
#[0 0 82 0 37] 
#[0 0 82 0 37] 
#[0 0 82 0 37] 
#[0 0 82 0 37] 
#[0 0 82 0 37] 
#[0 0 82 0 37] 
#[0 0 82 0 37] 
#[0 0 82 0 37] 
#[0 1 73 0 25] 
#[0 0 82 0 37] 
#[1 0 42 0 37 1 77 0 77] 
#[0 0 82 0 37] 
#[1 1 81 0 2 1 85 0 29 1 89 0 30 1 93 0 38 1 97 0 39 1 101 0 41 1 105 0 42 1 109 0 82 1 113 0 84] 
#[1 1 117 0 5 0 86 0 37 1 121 0 87] 
#[0 0 90 0 5 0 37] 
#[1 1 17 0 2 0 94 0 5 1 21 0 7 1 25 0 8 1 29 0 29 1 33 0 30 1 37 0 31 1 125 0 33 0 94 0 37 1 129 0 43 1 133 0 69] 
#[1 0 57 0 30 0 98 0 37 1 137 0 55] 
#[0 0 102 0 37] 
#[1 0 57 0 30 0 106 0 37 1 141 0 55] 
#[0 0 110 0 37] 
#[0 1 145 0 2] 
#[0 1 149 0 2] 
#[0 0 114 0 37] 
#[0 0 118 0 37] 
#[1 0 122 0 2 0 122 0 5 0 122 0 7 0 122 0 8 0 122 0 9 0 122 0 29 0 122 0 30 0 122 0 31 1 153 0 90 1 157 0 91] 
#[1 0 122 0 2 0 122 0 3 0 122 0 5 0 122 0 7 0 122 0 8 0 122 0 29 0 122 0 30 0 122 0 31 1 161 0 90 1 157 0 91] 
#[0 0 126 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 29 0 30 0 31 0 33 0 34 0 37 0 43] 
#[0 0 130 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 29 0 30 0 31 0 33 0 34 0 37 0 43] 
#[0 0 134 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 29 0 30 0 31 0 33 0 34 0 37 0 43] 
#[0 0 138 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 29 0 30 0 31 0 33 0 34 0 37 0 43] 
#[1 1 17 0 2 1 21 0 7 1 25 0 8 1 29 0 29 1 33 0 30 1 37 0 31 0 142 0 37 1 165 0 69] 
#[1 1 169 0 1 0 146 0 2 1 173 0 4 1 177 0 6 0 146 0 7 0 146 0 8 0 146 0 29 0 146 0 30 0 146 0 31 1 181 0 34 0 146 0 37] 
#[1 1 17 0 2 1 21 0 7 1 25 0 8 1 29 0 29 1 33 0 30 1 37 0 31 0 150 0 37 1 165 0 69] 
#[1 1 17 0 2 1 21 0 7 1 25 0 8 1 29 0 29 1 33 0 30 1 37 0 31 0 154 0 37 1 165 0 69] 
#[0 0 158 0 29 0 37] 
#[1 1 185 0 29 0 162 0 37] 
#[0 0 166 0 30 0 37] 
#[1 1 189 0 30 0 170 0 37] 
#[1 1 193 0 30 1 197 0 78] 
#[0 1 201 0 37] 
#[1 1 81 0 2 1 85 0 29 1 89 0 30 1 93 0 38 1 97 0 39 1 101 0 41 1 105 0 42 1 205 0 82 1 113 0 84] 
#[0 0 174 0 1 0 2 0 4 0 5 0 6 0 9 0 29 0 30 0 37 0 38 0 39 0 40 0 41 0 42] 
#[0 0 178 0 1 0 2 0 4 0 5 0 6 0 9 0 29 0 30 0 37 0 38 0 39 0 40 0 41 0 42] 
#[0 0 182 0 1 0 2 0 4 0 5 0 6 0 9 0 29 0 30 0 37 0 38 0 39 0 40 0 41 0 42] 
#[0 0 186 0 1 0 2 0 4 0 5 0 6 0 9 0 29 0 30 0 37 0 38 0 39 0 40 0 41 0 42] 
#[0 0 190 0 1 0 2 0 4 0 5 0 6 0 9 0 29 0 30 0 37 0 38 0 39 0 40 0 41 0 42] 
#[0 0 194 0 1 0 2 0 4 0 5 0 6 0 9 0 29 0 30 0 37 0 38 0 39 0 40 0 41 0 42] 
#[1 1 81 0 2 1 209 0 5 1 85 0 29 1 89 0 30 0 198 0 37 1 93 0 38 1 97 0 39 1 101 0 41 1 105 0 42 1 213 0 83 1 217 0 84] 
#[1 1 221 0 1 0 202 0 2 1 225 0 4 0 202 0 5 1 229 0 6 0 202 0 9 0 202 0 29 0 202 0 30 0 202 0 37 0 202 0 38 0 202 0 39 1 233 0 40 0 202 0 41 0 202 0 42] 
#[1 0 54 0 2 0 54 0 5 0 54 0 7 0 54 0 8 0 54 0 29 0 54 0 30 0 54 0 31 0 54 0 33 0 54 0 37 0 54 0 43 1 237 0 88 0 237 0 89] 
#[0 1 241 0 37] 
#[0 0 206 0 5 0 37] 
#[1 1 245 0 30 1 249 0 44] 
#[1 1 169 0 1 0 210 0 2 1 173 0 4 0 210 0 5 1 177 0 6 0 210 0 7 0 210 0 8 0 210 0 29 0 210 0 30 0 210 0 31 0 210 0 33 1 253 0 34 0 210 0 37 0 210 0 43] 
#[0 0 214 0 30 0 37] 
#[0 0 218 0 30 0 37] 
#[1 0 222 0 9 0 222 0 30 2 1 0 60] 
#[1 0 226 0 9 0 226 0 30 2 5 0 62] 
#[1 2 9 0 5 2 13 0 9] 
#[1 1 17 0 2 0 230 0 3 0 230 0 5 1 21 0 7 1 25 0 8 0 230 0 9 1 29 0 29 1 33 0 30 1 37 0 31 2 17 0 69] 
#[1 2 21 0 3 2 9 0 5] 
#[1 1 169 0 1 0 234 0 2 1 173 0 4 1 177 0 6 0 234 0 7 0 234 0 8 0 234 0 29 0 234 0 30 0 234 0 31 1 181 0 34 0 234 0 37] 
#[0 0 238 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 29 0 30 0 31 0 33 0 34 0 37 0 43] 
#[0 0 242 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 29 0 30 0 31 0 33 0 34 0 37 0 43] 
#[0 0 246 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 29 0 30 0 31 0 33 0 34 0 37 0 43] 
#[1 2 25 0 1 2 29 0 4 2 33 0 6] 
#[0 0 250 0 29 0 37] 
#[0 0 254 0 30 0 37] 
#[0 1 2 0 30 0 37] 
#[1 2 37 0 30 1 6 0 37] 
#[0 1 10 0 29 0 30 0 36 0 92] 
#[1 1 81 0 2 1 209 0 5 2 41 0 9 1 85 0 29 1 89 0 30 1 93 0 38 1 97 0 39 1 101 0 41 1 105 0 42 1 217 0 84] 
#[1 1 81 0 2 1 85 0 29 1 89 0 30 1 93 0 38 1 97 0 39 1 101 0 41 1 105 0 42 2 45 0 82 1 113 0 84] 
#[0 2 49 0 37] 
#[1 1 221 0 1 1 14 0 2 1 225 0 4 1 14 0 5 1 229 0 6 1 14 0 9 1 14 0 29 1 14 0 30 1 14 0 37 1 14 0 38 1 14 0 39 1 233 0 40 1 14 0 41 1 14 0 42] 
#[0 1 18 0 1 0 2 0 4 0 5 0 6 0 9 0 29 0 30 0 37 0 38 0 39 0 40 0 41 0 42] 
#[0 1 22 0 1 0 2 0 4 0 5 0 6 0 9 0 29 0 30 0 37 0 38 0 39 0 40 0 41 0 42] 
#[0 1 26 0 1 0 2 0 4 0 5 0 6 0 9 0 29 0 30 0 37 0 38 0 39 0 40 0 41 0 42] 
#[0 1 30 0 1 0 2 0 4 0 5 0 6 0 9 0 29 0 30 0 37 0 38 0 39 0 40 0 41 0 42] 
#[0 1 34 0 5 0 37] 
#[0 1 38 0 29 0 30 0 36 0 92] 
#[0 2 53 0 44] 
#[0 1 42 0 5 0 37] 
#[1 2 25 0 1 1 46 0 2 2 29 0 4 1 46 0 5 2 33 0 6 1 46 0 7 1 46 0 8 1 46 0 29 1 46 0 30 1 46 0 31 1 46 0 33 1 46 0 37 1 46 0 43] 
#[1 2 57 0 9 2 61 0 30] 
#[1 2 65 0 9 2 69 0 30] 
#[1 0 122 0 2 0 122 0 3 0 122 0 5 0 122 0 7 0 122 0 8 0 122 0 9 0 122 0 29 0 122 0 30 0 122 0 31 2 73 0 91] 
#[0 1 50 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 29 0 30 0 31 0 33 0 34 0 37 0 43] 
#[1 1 169 0 1 1 54 0 2 1 54 0 3 1 173 0 4 1 54 0 5 1 177 0 6 1 54 0 7 1 54 0 8 1 54 0 9 1 54 0 29 1 54 0 30 1 54 0 31 2 77 0 34] 
#[0 1 58 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 29 0 30 0 31 0 33 0 34 0 37 0 43] 
#[0 1 62 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 29 0 30 0 31 0 33 0 34 0 37 0 43] 
#[0 1 66 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 29 0 30 0 31 0 33 0 34 0 37 0 43] 
#[0 1 70 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 29 0 30 0 31 0 33 0 34 0 37 0 43] 
#[0 1 74 0 30 0 37] 
#[0 1 78 0 1 0 2 0 4 0 5 0 6 0 9 0 29 0 30 0 37 0 38 0 39 0 40 0 41 0 42] 
#[1 1 81 0 2 1 82 0 5 1 82 0 9 1 85 0 29 1 89 0 30 1 82 0 37 1 93 0 38 1 97 0 39 1 101 0 41 1 105 0 42 1 217 0 84] 
#[0 1 86 0 29 0 30 0 36 0 92] 
#[0 1 90 0 5 0 37] 
#[0 1 94 0 37] 
#[0 1 98 0 9 0 30] 
#[0 1 102 0 37] 
#[0 1 106 0 9 0 30] 
#[1 1 17 0 2 1 110 0 3 1 110 0 5 1 21 0 7 1 25 0 8 1 110 0 9 1 29 0 29 1 33 0 30 1 37 0 31 2 17 0 69] 
#[1 2 25 0 1 1 114 0 2 1 114 0 3 2 29 0 4 1 114 0 5 2 33 0 6 1 114 0 7 1 114 0 8 1 114 0 9 1 114 0 29 1 114 0 30 1 114 0 31]
	).
]

{ #category : #testing }
SmaCCDefinitionParser >> tryAllTokens [
	^ true
]

{ #category : #private }
SmaCCDefinitionParser >> verifyCodeToken: codeToken for: aSmaCCRHS [
	| code |
	code := codeToken value copyFrom: 2 to: codeToken value size - 1.
	RBParser
		parseExpression: code
		onError:
			[ :string :position | 
			currentToken := nil.
			self position: codeToken startPosition + position.
			self reportErrorMessage: string ].
	aSmaCCRHS reduceActionSource: code.
	^ aSmaCCRHS
]

{ #category : #'private-strings' }
SmaCCDefinitionParser >> verticalTabString [
	^ SmaCCCharacterSet with: (Character value: 11)
]

{ #category : #private }
SmaCCDefinitionParser >> whitespaceValues [
	^ #[9 10 11 12 13 32]
]
