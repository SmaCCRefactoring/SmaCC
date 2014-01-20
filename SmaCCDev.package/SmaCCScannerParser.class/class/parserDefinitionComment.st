generated-comments
parserDefinitionComment

	"%left	""|"";
%left ""("" <character> <backslashcharacter> <characterblock> <anycharacter> <tokenname> <symbol>;
%left ""*"" ""+"" ""?"" <repeat> ;

File: Rules	 {scannerDefinition} 
	|  {scannerDefinition};

Rules: Rule "";""
	| Rules Rule "";"" ;

Rule: RegexRule {'1' states isEmpty ifTrue: ['1' addStates: scannerDefinition nonExcludeStates]}
	| ExcludeStatesLine 
	| StatesLine ;

RegexRule : <tokenname> "":"" Regex {'3' position: '1' startPosition. scannerDefinition addToken: '3' withName: '1' value. '3'}
	| Symbol RegexRule {'2' addState: '1'; yourself};

StatesLine : ""%states"" States ;
States :
	| States Symbol {scannerDefinition addState: '2'};

ExcludeStatesLine : ""%excludes"" ExcludeStates ;
ExcludeStates : 
	| ExcludeStates Symbol {scannerDefinition addExcludeState: '2'};

Symbol : <symbol> {'1' value asSymbol};

Regex: RegexTerm {'1'}
	| Regex ""|"" Regex {'1' | '3'}
	| Regex RegexTerm {'1' , '2'};

RegexTerm:	<character> {SmaCCCharacterRENode characters: '1' value}
	| <anycharacter> {SmaCCCharacterRENode characters: self allCharacters}
	| <backslashcharacter> {self nodeFor: (ReadStream on: ('1' value copyFrom: 2 to: '1' value size))} 
	| ""("" Regex "")"" {'2'}
	| <characterblock> {SmaCCCharacterRENode characters: (self parseCharacterBlock: '1')}
	| <tokenname> {(scannerDefinition tokenNamed: '1' value ifAbsentPut: [self generateImplicitToken: '1']) copy}
	| <symbol> {SmaCCSequenceRENode nodes: ('1' value asOrderedCollection collect: [:each | SmaCCCharacterRENode characters: (String with: each)])}
	| RegexTerm ""*""	{'1' repeat}
	| RegexTerm ""+"" {'1' repeatForAtLeast: 1}
	| RegexTerm ""?"" {'1' repeatFor: 0 to: 1}
	| RegexTerm <repeat> {| readStream start stop | 
					readStream := ReadStream on: ('2' value copyFrom: 2 to: '2' value size - 1). 
					start := readStream upTo: $,. 
					stop := readStream upToEnd.
					'1' repeatFor: (start isEmpty ifTrue: [0] ifFalse: [start asNumber]) to: (stop isEmpty ifTrue: [(1 bitShift: 31)] ifFalse: [stop asNumber])} ;"