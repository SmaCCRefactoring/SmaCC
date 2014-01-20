generated-comments
parserDefinitionComment

	"File:	Parser {grammar addEmptySymbol; yourself};

Parser:	Rule
	| Parser Rule ;

Rule : ProductionRule {grammar setStartSymbolIfNone: '1'. nil}
	| LeftLine 
	| RightLine 
	| NonAssociativeLine
	| IdMethodLine
	| StartLine ;

LeftLine:	""%left"" TokenList 'tokens' "";"" { tokens do: [:each | grammar leftPrecedenceFor: each; setOperatorPrecedenceFor: each to: scanner lineNumber]. nil };
RightLine:	""%right"" TokenList 'tokens' "";"" { tokens do: [:each | grammar rightPrecedenceFor: each; setOperatorPrecedenceFor: each to: scanner lineNumber]. nil };
NonAssociativeLine: ""%nonassoc"" TokenList 'tokens' "";"" { tokens do: [:each | grammar nonAssociativePrecedenceFor: each; setOperatorPrecedenceFor: each to: scanner lineNumber]. nil };
IdMethodLine: ""%id"" IdTokens 'tokens' "";"" {tokens do: [:each | grammar makeTokenIdMethodFor: each]. nil};
StartLine: ""%start"" StartingTokens "";"";

IdTokens: <tokenname> {OrderedCollection with: '1' value}
	| IdTokens <tokenname> {'1' add: '2' value; yourself};
TokenList:	Term
	| TokenList Term	;
StartingTokens: <symbolname> 'symbol' {grammar addStartingSymbol: (grammar nonTerminalSymbolNamed: symbol value)}
	| StartingTokens <symbolname> 'symbol' {grammar addStartingSymbol: (grammar nonTerminalSymbolNamed: symbol value)};

ProductionRule: <symbolname> <production> ParserRules "";"" {| symbol | symbol := grammar nonTerminalSymbolNamed: '1' value. '3' do: [:each | symbol addProduction: each]. symbol};

ParserRules:	ParserRules ""|"" ParserRule {'1' add: '3'; yourself}
	| ParserRule	 ;

ParserRule : Terms 'rhs' {rhs}
	| Terms 'rhs' <code> 'code' {self verifyCodeToken: code for: rhs} ;

Terms :	{SmaCCRHS new}
	| Terms 'rhs' Term 'term'	{rhs add: term; yourself}	
	| Terms 'rhs' Term 'term' <variablename> 'variableNameToken'	{rhs add: term; nameLastItem: (variableNameToken value copyFrom: 2 to: variableNameToken value size - 1); yourself}	
	| Terms 'rhs' Term 'term' ""?"" {rhs add: (grammar makeOptionalSymbolFor: term); yourself}
	| Terms 'rhs' Term 'term' ""?"" <variablename> 'variableNameToken' {rhs add: (grammar makeOptionalSymbolFor: term); nameLastItem: (variableNameToken value copyFrom: 2 to: variableNameToken value size - 1); yourself}	
	| Terms 'rhs' Term 'term' ""*"" {rhs add: (grammar makeRepeatSymbolFor: term); yourself}
	| Terms 'rhs' Term 'term' ""*"" <variablename> 'variableNameToken' {rhs add: (grammar makeRepeatSymbolFor: term); nameLastItem: (variableNameToken value copyFrom: 2 to: variableNameToken value size - 1); yourself}		
	| Terms 'rhs' Term 'term' ""+"" {rhs add: (grammar makeRepeatMultipleSymbolFor: term); yourself}
	| Terms 'rhs' Term 'term' ""+"" <variablename> 'variableNameToken' {rhs add: (grammar makeRepeatMultipleSymbolFor: term); nameLastItem: (variableNameToken value copyFrom: 2 to: variableNameToken value size - 1); yourself}	;

Term:	<keyword> {grammar keywordTerminalNamed: '1' value}
	| <tokenname> {grammar terminalSymbolNamed: '1' value ifAbsent: [currentToken := '1'. self reportErrorMessage: 'Token not specified']}
	| <symbolname> {grammar nonTerminalSymbolNamed: '1' value}
	| ""error"" {SmaCCSymbol error}
	| ""("" SimpleTerms "")"" {grammar makeGroupFor: '2'}
	| ""<%"" SimpleTerms ""%>"" {grammar makeRepeatSymbolFor: (grammar makeGroupFor: '2')}
	| ""["" SimpleTerms ""]"" {grammar makeOptionalSymbolFor: (grammar makeGroupFor: '2')};

SimpleTerms :
	SimpleTerm {OrderedCollection with: '1'}
	| SimpleTerms 'terms' ""|"" SimpleTerm 'term' {terms add: term; yourself};

SimpleTerm :
	{ SmaCCRHS new }
	| SimpleTerm 'rhs' Term 'term' {rhs add: term; yourself} 
	| SimpleTerm 'rhs' Term 'term' ""?"" {rhs add: (grammar makeOptionalSymbolFor: term); yourself}
	| SimpleTerm 'rhs' Term 'term' ""*"" {rhs add: (grammar makeRepeatSymbolFor: term); yourself}
	| SimpleTerm 'rhs' Term 'term' ""+"" {rhs add: (grammar makeRepeatMultipleSymbolFor: term); yourself}	;"