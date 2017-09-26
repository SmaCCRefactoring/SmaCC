generated
definitionComment
"%states default scanner directives parser;

directives <states>
	: states 
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
			{grammar isGLR: true}
	;
Unicode:
	<unicode>
			{SmaCCGrammar maximumCharacterValue: 16rFFFF}
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
			{SmaCCCharacterRENode characters: '1' value}
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
			{SmaCCSequenceRENode nodes: ('1' value asOrderedCollection collect: [:each | SmaCCCharacterRENode characters: (String with: each)])}
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
	| Terms 'rhs' Term 'term' ""?""
			{rhs
				add: (grammar makeOptionalSymbolFor: term);
				yourself}
	| Terms 'rhs' Term 'term' <variablename> 'variableNameToken' ""?"" 
			{rhs
				add: (grammar makeOptionalSymbolFor: term);
				nameLastItem: (variableNameToken value copyFrom: 2 to: variableNameToken value size - 1);
				yourself}	
	| Terms 'rhs' Term 'term' ""*""
			{rhs
				add: (grammar makeRepeatSymbolFor: term);
				yourself}
	| Terms 'rhs' Term 'term' <variablename> 'variableNameToken' ""*"" 
			{rhs
				add: (grammar makeRepeatSymbolFor: term);
				nameLastItem: (variableNameToken value copyFrom: 2 to: variableNameToken value size - 1);
				yourself}		
	| Terms 'rhs' Term 'term' ""+""
			{rhs
				add: (grammar makeRepeatMultipleSymbolFor: term);
				yourself}
	| Terms 'rhs' Term 'term' <variablename> 'variableNameToken' ""+"" 
			{rhs
				add: (grammar makeRepeatMultipleSymbolFor: term);
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
	| SimpleTerm 'rhs' Term 'term' ""?""
		{rhs
			add: (grammar makeOptionalSymbolFor: term);
			yourself}
	| SimpleTerm 'rhs' Term 'term' <variablename> 'variableNameToken' ""?"" 
		{rhs
			add: (grammar makeOptionalSymbolFor: term);
			nameLastItem: (variableNameToken value copyFrom: 2 to: variableNameToken value size - 1);
			yourself}	
	| SimpleTerm 'rhs' Term 'term' ""*""
		{rhs
			add: (grammar makeRepeatSymbolFor: term);
			yourself}
	| SimpleTerm 'rhs' Term 'term'  <variablename> 'variableNameToken'  ""*""
		{rhs
			add: (grammar makeRepeatSymbolFor: term);
			nameLastItem: (variableNameToken value copyFrom: 2 to: variableNameToken value size - 1);
			yourself}
	| SimpleTerm 'rhs' Term 'term' ""+""
		{rhs
			add: (grammar makeRepeatMultipleSymbolFor: term);
			yourself}	
	| SimpleTerm 'rhs' Term 'term'  <variablename> 'variableNameToken'  ""+""
		{rhs
			add: (grammar makeRepeatMultipleSymbolFor: term);
			nameLastItem: (variableNameToken value copyFrom: 2 to: variableNameToken value size - 1);
			yourself}	
	;"