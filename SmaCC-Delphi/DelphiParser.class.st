Class {
	#name : #DelphiParser,
	#superclass : #SmaCCGLRParser,
	#instVars : [
		'lastInsertPosition'
	],
	#category : 'SmaCC-Delphi'
}

{ #category : #'generated-accessing' }
DelphiParser class >> cacheId [
	^'2017-05-03T19:24:11.577511+02:00'
]

{ #category : #generated }
DelphiParser class >> definitionComment [
"%start File Statement SimpleDefinedType NamedDefinedType;

%glr;
%ignorecase;

%ignore_variables leftParen rightParen semicolon comma;

%id <number> <minus> <plus> <identifier> <constantIdentifier> <semicolon> <upArrow> <controlCharacter> <at>;

%prefix Delphi ;
%suffix Node;
%root Program;

%hierarchy MethodModifier ( 
	ExternalMethodModifier
	MessageMethodModifier
);
%hierarchy Expression (
	AddressExpression 
	ArrayExpression 
	AssignmentExpression 
	BinaryExpression 
	ConstantArrayExpression 
	InheritedFunctionCall 
	LiteralExpression 
	MemExpression
	MethodCallExpression 
	MinusExpression 
	PlusExpression
	NotExpression
	PointerExpression 
	PropertyExpression 
	RecordExpression
	SetExpression 
	VariableExpression 
) ;
%hierarchy VariableExpression (
	InstantiatedGenericVariableExpression
);
%hierarchy AnonymousMethodType (
	AnonymousFunctionType 
	AnonymousProcedureType
);
%hierarchy SetType (
	ExpressionSetType 
	RangeSetType 
	ValuesSetType
);
%hierarchy Type (
	AbsoluteType
	AnonymousMethodType 
	ArrayType 
	ClassOrInterfaceType
	EnumType
	FileType
	InstantiatedGenericType 
	MetaclassType 
	NamedType 
	PointerType 
	RangeType 
	RecordType 
	SetType 
	SimpleArrayType 
);
%hierarchy ClassOrInterfaceType (
	ClassType
	InterfaceType
);
%hierarchy ClassSection (
	ImplicitClassSection
	PrivateClassSection 
	ProtectedClassSection 
	PublicClassSection 
	PublishedClassSection 
);
%hierarchy Statement (
	AsmBlock 
	EmptyStatement 
	Expression 
	ForStatement 
	ForInStatement
	GotoStatement
	IfStatement 
	LabeledStatement
	MultiStatement
	RaiseStatement 
	WhileStatement 
	WithStatement 
);
%hierarchy MultiStatement (
	CaseStatement 
	TryStatement 
	StatementBlock 
	RepeatStatement 
);
%hierarchy ClassType (
	NewClassType
	OldClassType 
	ClassHelperType
) ;
%hierarchy SetValue (
	RangeSetValue 
	SingleSetValue
) ;
%hierarchy MethodHeader (
	ClassOperatorHeader
	ConstructorHeader 
	DestructorHeader
	FunctionHeader 
	ProcedureHeader 
);
%hierarchy FunctionHeader (
	ClassFunctionHeader
);
%hierarchy ProcedureHeader (
	ClassProcedureHeader
);
%hierarchy MethodDefinition ( 
	ConstructorDefinition 
	DestructorDefinition
	FunctionDefinition 
	ProcedureDefinition 
);
%hierarchy FunctionDefinition (
	ClassFunctionDefinition
	ClassOperatorDefinition
);
%hierarchy ProcedureDefinition (
	ClassProcedureDefinition
);
%hierarchy PropertyHeader (
	ClassPropertyHeader
);
%hierarchy CodeSection (
	FinalizationSection 
	ImplementationCode
	InitializationSection 
);
%hierarchy Vars (
	ClassVars
);


<at>
	: AT
	;
<minus> 
	: \- 
	;
<plus> 
	: \+ 
	;
<semicolon> 
	: \; 
	;
<upArrow> 
	: \^ 
	;
 <LETTER> 
	: [a-zA-Z_üäöÜÄÖ] 
	;
<DIGIT> 
	: [0-9] 
	;
<H>
	: [a-fA-F0-9]
	;
<D>
	: [0-9]
	;
<E>
	: [Ee][\+\-]?<D>+
	;
<identifier> 
	: <LETTER> (<LETTER>|<DIGIT>)*
	;
<constantIdentifier> 
	: <identifier> 
	;
<unsignedInt> 
	: (\$<H>+) 
	| (<D>+) 
	;
<unsignedReal> 
	: <D>+<E> 
	| (<D>+\.<D>* | \.<D>+)<E>?
	;
<number> 
	: [\-\+]? (<unsignedInt> | <unsignedReal>) 
	;
<integerWithRange> 
	: [\-\+]? <D>+\.\. 
	;
<char> 
	: \# <unsignedInt>
	;
<control_character>
	: \^ [a-z] 
	;
<string> 
	: (<char> | <control_character>)* (\' [^\']* \' (<char> | <control_character>)*)+
	| <char>+  
	;
<comment>
	: \{[^\}]*\} 
	| \(\*([^*]|[\r\n]|(\*+([^*)]|[\r\n])))*\*+\) 
	| \/\/ [^\r\n]* [\r\n] 
	;
<whitespace>
	: (\s|\x1A)+
	;
<patternToken>
	: (\`  [^\`]* \`)+
	;

<multiple_control_chars>
	: <control_character> <control_character>+
	;

#These below are probably wrong

<labelID> 
	: <identifier> 
	; 
#<unitName> : <identifier> ;
<immCharID> 
	: \\\@ 
	;

# Binary precedence handled by parser -- this grammar is ambiguous
%right ""ELSE"" ""OF"" <identifier>;
%right "":="";
%left ""OR"";
%left ""AND"";
%left ""XOR"" ;
#%left "","" ;
#%nonassoc ""<>"" "">"" ""<"" ""="" ""<="" "">="" ""IN"" ;
%nonassoc ""AS"" ""IS"" ""ABSOLUTE"" ;
%left <plus> <minus> ;
%left ""DIV"" ""MOD"" ""SHL"" ""SHR"" ""*"" ""/"";
%left ""@"";
%left ""."" <upArrow> ;
%left ""["" ""("";


File 
	: UnitFile {{UnitFile}}
	| ProgramFile {{ProgramFile}}
	| LibraryFile {{LibraryFile}}
	;
ProgramFile
	: ProgramLine UsesList MainMethod 'main' ""."" 'period'
	| UsesList MainMethod 'main' ""."" 'period'
	;
ProgramLine
	: ""PROGRAM"" 'programToken' <identifier> 'programName' OptionalPlatform <semicolon> 'semicolon' 
	;
LibraryFile
	: LibraryLine UsesList Exports MainMethod 'main' ""."" 'period'
	;
LibraryLine
	: ""LIBRARY"" 'libraryToken' <identifier> 'libraryName' OptionalPlatform <semicolon> 'semicolon' 
	;
Exports
	: 
	| Exports LibraryExport 'export'
	;
LibraryExport
	: ""EXPORTS"" 'exportsToken' <identifier> 'name' <semicolon> 'semicolon' {{LibraryExport}}
	;
MainMethod
	: MethodComponents {{MainMethodDefinition}}
	;
UnitFile 
	: UnitLine InterfaceSection 'interfaceSection' ImplementationSection 'implementationSection' InitializationSection 'initializationSection' FinalizationSection 'finalizationSection' EndFile
	| UnitLine
	;
UnitLine
	: ""UNIT"" 'unitToken' FullModuleName 'unitName' OptionalPlatform <semicolon> 'semicolon' 
	;
InterfaceSection
	: 
	| ""INTERFACE"" 'interfaceToken' UsesList InterfaceSectionValueList {{InterfaceSection}}
	;
UsesList
	: 
	| ""USES"" 'usesToken' UsesModuleList <semicolon> 'semicolon'
	;
UsesModuleList
	: UsesModule
	| UsesModuleList "","" 'comma' UsesModule
	;
UsesModule
	: FullModuleName 'moduleName'
	| FullModuleName 'moduleName' ""IN"" 'inToken' <string> 'filename'
	;
FullModuleName
	: <identifier> 'name' {{ModuleName}}
	| FullModuleName ""."" 'period' <identifier> 'name' {{ModuleName}}
	;
InterfaceSectionValueList
	: 
	| InterfaceSectionValueList InterfaceSectionValue 'value'
	;
InterfaceSectionValue
	: DefinedTypeList
	| ResourceStringList
	| ConstantValueList
	| ProcedureHeader
	| FunctionHeader
	| Vars
	;
ConstantValueList
	: ""CONST"" 'constToken' ConstantValues {{ConstantList}}
	;
ConstantValues
	: ConstantValue 'definition'
	| ConstantValues ConstantValue 'definition'
	;
ConstantValue
	: <identifier> 'name' OptionalType ""="" 'equalToken' ConstantExpression 'expression' OptionalPlatform OptionalDeprecated <semicolon> 'semicolon' {{ConstantDefinition}} 
	;
ResourceStringList
	: ""RESOURCESTRING"" 'resourceStringToken' Resources {{ResourceStringList}}
	;
Resources
	: Resource 'definition'
	| Resources Resource 'definition'
	;
Resource
	: <identifier> 'name' ""="" 'equalToken' ConstantExpression 'value' OptionalDeprecated <semicolon> 'semicolon' {{ResourceStringDefinition}} 
	;
DefinedTypeList
	: ""TYPE"" 'typeToken' NamedDefinedTypes {{DefinedTypeList}}
	;
NamedDefinedTypes
	: NamedDefinedType 'definition'
	| NamedDefinedTypes NamedDefinedType 'definition'
	;
NamedDefinedType
	: <identifier> 'name'  OptionalGenericTypeArguments ""="" 'equalToken' DefinedType {{NamedDefinedType}}
	;
OptionalGenericTypeArguments
	:
	| ""<"" 'left' GenericTypeArgumentList "">"" 'right'
	;
GenericTypeArgumentList
	: <identifier> 'genericTypeArgument'
	|  GenericTypeArgumentList "","" 'comma' <identifier> 'genericTypeArgument'
	;
DefinedType 
	: SimpleDefinedType 'type' OptionalPlatform <semicolon> 'semicolon'
	| EnumType 'type' <semicolon> 'semicolon'
	| AnonymousProcedureType 'type'
	| AnonymousFunctionType 'type'
	| ClassOrInterfaceType 'type' OptionalPlatform <semicolon> 'semicolon'
	;
EnumType
	: ""("" 'left' EnumList "")"" 'right' {{}}
	;
EnumList
	: EnumName 'name'
	| EnumList "","" 'comma' EnumName 'name'
	;
EnumName
	: <identifier> 'name' {{}}
	| <identifier> 'name' ""="" 'equal' ConstantExpression 'value' {{}}
	;
ClassOrInterfaceType
	: NewClassType
	| OldClassType
	| InterfaceType
	| MetaclassType
	| ClassHelperType
	;
SimpleDefinedType
	: NamedType 'typeExpression' {{NamedType}}
	| <upArrow> 'upArrowToken' Type 'type' {{PointerType}}
	| ArrayType
	| RecordType
	| Type 'type' InstantiatedGenericTypeArguments {{InstantiatedGenericType}}
	| Type 'type' ""["" 'left' ConstantExpression 'bounds' ""]"" 'right' {{SimpleArrayType}} 
	| FileType
	| Type 'type' ""ABSOLUTE"" 'absoluteToken' Type 'variable' {{AbsoluteType}}
	| SetType
	| RangeType
	| ""TYPE"" 'typeToken' QualifiedName 'typeName' {{TypeType}}
	;
InstantiatedGenericTypeArguments
	: ""<"" 'left' InstantiatedGenericTypeArgumentList "">"" 'right'
	;
InstantiatedGenericTypeArgumentList
	: SimpleDefinedType 'typeArgument'
	| InstantiatedGenericTypeArgumentList "","" 'comma' SimpleDefinedType 'typeArgument'
	;
NamedType
	: | <constantIdentifier> 'name' {{VariableExpression}}
	| NamedType 'expression' ""."" 'period' <constantIdentifier> 'name' {{PropertyExpression}} 
	#: ConstantExpression 'typeExpression' {{NamedType}} #should be check if we have a valid type
	;
OptionalPlatform
	:
	| ""PLATFORM"" 'modifier'
	| ""DEPRECATED"" 'modifier'
	;
AnonymousProcedureType
	: ""PROCEDURE"" 'procedureToken' OptionalArguments OptionalOfObject <semicolon> 'semicolon' MethodModifiers {{AnonymousProcedureType}}
	;
AnonymousFunctionType
	: ""FUNCTION"" 'functionToken' OptionalArguments "":"" 'colon' Type 'type' OptionalOfObject  <semicolon> 'semicolon' MethodModifiers {{AnonymousFunctionType}}
	;
OptionalArguments
	:
	| ""("" 'left' ArgumentList "")"" 'right'
	;
SetType
	: ""SET"" 'setToken' ""OF"" 'ofToken' ConstantExpression 'setValue' {{ExpressionSetType}} 
	| ""SET"" 'setToken' ""OF"" 'ofToken' RangeType 'setValue' {{RangeSetType}}
	| ""SET"" 'setToken' ""OF"" 'ofToken' ""("" 'left' TwoItemSetNameList "")"" 'right' {{ValuesSetType}} ###
	;
TwoItemSetNameList	#hacked for two items since one item conflicts with constant expression set
	: <constantIdentifier> 'name' "","" 'comma' SetNameList
	;
SetNameList
	: <constantIdentifier> 'name'
	| SetNameList "","" 'comma' <constantIdentifier> 'name'
	;
MetaclassType
	: ""CLASS"" 'classToken' ""OF"" 'ofToken' <identifier> 'name' {{MetaclassType}}
	;
RecordType
	: OptionalPacked ""RECORD"" 'recordToken' RecordFieldList ""END"" 'endToken' {{RecordType}}
	;
RecordFieldList
	: ImplicitClassSection 'section' ClassSections
	| ImplicitClassSection 'section' ClassSections VariantRecordPart
	;
OptionalPacked
	: 
	| ""PACKED"" 'packedToken'
	;
VariantRecordPart
	: ""CASE"" 'caseToken' <identifier> 'value' OptionalType ""OF"" 'ofToken' VariantTypes OptionalSemicolon #{{VariantRecordPart}}
	;
VariantTypes
	: VariantType 'variantType'
	| VariantTypes <semicolon> 'semicolon' VariantType 'variantType' 
	;
VariantType
	: VariantNames "":"" 'colon' ""("" 'left' RecordFieldList "")"" 'right' {{VariantType}}
	;
VariantNames
	: VariantName 'name'
	| VariantNames "","" 'comma' VariantName 'name'
	;
VariantName
	: ConstantExpression
	;
RangeType
	: RangeValue 'startValue' "".."" 'dots' RangeValue 'endValue' {{RangeType}}
	;
RangeValue
	: ConstantExpression	#should really be numbers
	;
Number
	: <number>
	;
ConstantExpression
	: Number 'value' {{LiteralExpression}}
	| <controlCharacter> 'value' {{LiteralExpression}}
	| <constantIdentifier> 'name' {{VariableExpression}}
	| ConstantExpression 'expression' ""."" 'period' <constantIdentifier> 'name' {{PropertyExpression}}
	| ConstantExpression 'leftExpression' ConstantOperator 'operator' ConstantExpression 'rightExpression' {{BinaryExpression}}
	| String 'value' {{LiteralExpression}}
	| <multiple_control_chars> 'value' {{LiteralExpression}}
	| ConstantExpression 'receiver' ""("" 'left' ConstantArguments "")"" 'right' {{MethodCallExpression}}
	| SetConstructor
	| ""("" 'left' ConstantRecord OptionalSemicolon "")"" 'right' {{RecordExpression}}
	| ""("" 'left' ConstantArray "")"" 'right' {{ConstantArrayExpression}}
	| ""NOT"" 'notToken' ConstantExpression 'expression' {{NotExpression}}
	| <minus> 'minus' ConstantExpression 'expression' {{MinusExpression}}
	| <plus> 'plus' ConstantExpression 'expression' {{PlusExpression}}
	| ""@"" 'atToken' ConstantExpression 'expression' {{AddressExpression}}
	;
ConstantArray
	: ConstantExpressionList
	|
	;
ConstantExpressionList
	: EnumExpression # hacked -- need one value arrays but that conflicts with parened expressions
	| ConstantExpressionList "","" 'comma' EnumExpression 
	;
EnumExpression
	: ConstantExpression 'expression'
	| ConstantExpression 'expression' ""="" 'equalToken' ConstantExpression 'value'
	;
ConstantRecord
	: ConstantRecordFields
	;
ConstantRecordFields
	: ConstantRecordField 'field'
	| ConstantRecordFields <semicolon> 'semicolon' ConstantRecordField 'field'
	;
ConstantRecordField
	: <constantIdentifier> 'name' "":"" 'colon' ConstantExpression 'expression' {{ConstantRecordField}}
	;
ConstantArguments
	: ConstantExpression 'argument'
	| ConstantArguments "","" 'comma' ConstantExpression 'argument'
	;
NewClassType
	: ""CLASS"" 'classToken' ClassAttributes Superclass ImplicitClassSection 'implicitClassSection' ClassSections ""END"" 'endToken' {{NewClassType}}
	| ""CLASS"" 'classToken' ClassAttributes Superclass {{NewClassType}}
	;
ClassHelperType	# attributes and superclass are likely not used
	: ""CLASS""'classToken' ClassAttributes ""HELPER"" 'helperToken' ""FOR"" 'forToken' QualifiedName 'class' Superclass ImplicitClassSection 'implicitClassSection' ClassSections ""END"" 'endToken' {{ClassHelperType}}
	| ""CLASS""'classToken' ClassAttributes ""HELPER"" 'helperToken' ""FOR"" 'forToken' QualifiedName 'class' Superclass {{ClassHelperType}}
	;
ClassAttributes
	:
	| ClassAttributes ClassAttribute 'classAttribute'
	;
ClassAttribute
	: ""ABSTRACT""
	| ""SEALED""
	;
OldClassType
	: ""OBJECT"" 'objectToken' Superclass ImplicitClassSection 'implicitClassSection' ClassSections ""END"" 'endToken' {{OldClassType}} 
	;
OptionalDeprecated
	:
	| ""DEPRECATED"" 'deprecatedToken'
	;
ImplicitClassSection
	: NewClassComponents {{ImplicitClassSection}}
	;
ClassSections
	: 
	| ClassSections ClassSection 'section'
	;
ClassSection
	: PrivateClassSection
	| ProtectedClassSection
	| PublicClassSection
	| PublishedClassSection
	;
PrivateClassSection
	: ""STRICT"" 'strictToken' ""PRIVATE"" 'privateToken' NewClassComponents {{PrivateClassSection}}
	| ""PRIVATE"" 'privateToken' NewClassComponents {{PrivateClassSection}}
	;
ProtectedClassSection
	: ""STRICT"" 'strictToken' ""PROTECTED"" 'protectedToken' NewClassComponents {{ProtectedClassSection}}
	| ""PROTECTED"" 'protectedToken' NewClassComponents {{ProtectedClassSection}}
	;
PublicClassSection
	: ""PUBLIC"" 'publicToken' NewClassComponents {{PublicClassSection}}
	;
PublishedClassSection
	: ""PUBLISHED"" 'publishedToken' NewClassComponents {{PublishedClassSection}}
	;
Superclass
	: 
	| ""("" 'left' SuperclassList "")"" 'right' 
	;
SuperclassList
	: NamedType 'superclass'
	| SuperclassList "","" 'comma' NamedType 'superclass'
	;
QualifiedName
	: <identifier> 'name' OptionalGenericTypeArguments {{QualifiedName}}
	| <identifier> 'namespace' OptionalGenericTypeArguments ""."" 'period' <identifier> 'name'  {{QualifiedName}}
	;
NewClassComponents
	: 
	| NewClassComponents NewClassComponent 'component'
	;
NewClassComponent
	: VariableNames "":"" 'colon' Type 'type' OptionalPlatform <semicolon> 'semicolon' {{VariableDefinition}}
	| ""CLASS"" 'classToken' VarsVars {{ClassVars}}
	| Vars
	| ConstructorHeader
	| MethodAttribute 'attribute' ConstructorHeader {{ConstructorHeader}}
	| DestructorHeader
	| MethodAttribute 'attribute' DestructorHeader {{DestructorHeader}}
	| NewClassMethodComponent
	| InterfacePropertyComponent
	| InterfaceFunctionAssignment
	| InterfaceProcedureAssignment
	| ConstantValueList
	;
NewClassMethodComponent
	: MethodAttribute 'attribute' ProcedureHeader {{ProcedureHeader}}
	| MethodAttribute 'attribute' ClassProcedureHeader {{ClassProcedureHeader}}
	| MethodAttribute 'attribute' FunctionHeader {{FunctionHeader}}
	| MethodAttribute 'attribute' ClassFunctionHeader {{ClassFunctionHeader}}
	| MethodAttribute 'attribute' ClassOperatorHeader {{ClassOperatorHeader}}
	| InterfaceMethodComponent
	;
MethodAttribute
	: ""["" 'left' ConstantExpression 'expression' ""]"" 'right' {{MethodAttribute}}
	;
InterfaceFunctionAssignment
	: ""FUNCTION"" 'function' QualifiedName 'qualifiedName' ""="" 'equalToken' <identifier> 'name' <semicolon> 'semicolon' {{InterfaceFunctionAssignment}}
	;
InterfaceProcedureAssignment
	: ""PROCEDURE"" 'procedureToken' QualifiedName 'qualifiedName' ""="" 'equalToken' <identifier> 'name' <semicolon> 'semicolon' {{InterfaceProcedureAssignment}}
	;
Type
	: SimpleDefinedType
	| AnonymousProcedureType
	| AnonymousFunctionType
	;
FileType
	: ""FILE"" 'fileToken' ""OF"" 'ofToken' Type 'type' {{FileType}}
	| ""FILE"" 'fileToken' {{FileType}}
	;
ArrayType
	: OptionalPacked ""ARRAY"" 'arrayToken' ArrayBounds ""OF"" 'ofToken' Type 'type' {{ArrayType}}
	| OptionalPacked ""ARRAY"" 'arrayToken' ArrayBounds ""OF"" 'ofToken' ""CONST"" 'constToken' {{ArrayType}}
	;
ArrayBounds
	: ""["" 'left' ArrayBoundsIndices ""]"" 'right'
	| 
	;
ArrayBoundsIndices
	: ArrayBoundsIndex 'index'
	| ArrayBoundsIndices "","" 'comma' ArrayBoundsIndex 'index'
	;
ArrayBoundsIndex
	: ConstantExpression
	| RangeType
	;
InterfaceType
	: InterfaceKeyword 'interfaceToken' Superclass Guid 'guid' NewInterfaceComponents ""END"" 'endToken' {{InterfaceType}}
	| InterfaceKeyword 'interfaceToken' {{InterfaceType}}
	;
InterfaceKeyword
	: ""INTERFACE""
	| ""DISPINTERFACE""
	;
Guid
	:
	| ""["" 'left' ConstantExpression 'string' ""]"" 'right' {{Guid}}
	;
NewInterfaceComponents
	: 
	| NewInterfaceComponents NewInterfaceComponent 'component'
	;
NewInterfaceComponent
	: InterfaceMethodComponent
	| InterfacePropertyComponent
	;
InterfacePropertyComponent
	: PropertyHeader
	| ClassPropertyHeader
	;
InterfaceMethodComponent
	: ProcedureHeader
	| ClassProcedureHeader
	| FunctionHeader
	| ClassFunctionHeader
	| ClassOperatorHeader
	;
ConstructorHeader
	: ExternalConstructorHeader
	| NonExternalConstructorHeader
	;
DestructorHeader
	: ExternalDestructorHeader
	| NonExternalDestructorHeader
	;
ProcedureHeader
	: ExternalProcedureHeader
	| NonExternalProcedureHeader
	;
ClassProcedureHeader
	: ExternalClassProcedureHeader
	| NonExternalClassProcedureHeader
	;
OptionalOfObject # Don't know what this is
	:
	| ""OF"" 'ofToken' ""OBJECT"" 'objectToken'
	;
FunctionHeader
	: ExternalFunctionHeader
	| NonExternalFunctionHeader
	;
ClassFunctionHeader
	: ExternalClassFunctionHeader
	| NonExternalClassFunctionHeader
	;
ClassOperatorHeader
	: ExternalClassOperatorHeader
	| NonExternalClassOperatorHeader
	;
OptionalType
	: 
	| "":"" 'colon' Type 'type'
	;
PropertyHeader
	: PropertyHeaderVars {{PropertyHeader}}
	;
PropertyHeaderVars
	: ""PROPERTY"" 'propertyToken' <identifier> 'name' PropertyArrayAccessors 'arrayAccessors' OptionalType PropertyValues <semicolon> 'semicolon' PropertyModifiers 'modifier'
	;
ClassPropertyHeader
	: ""CLASS"" 'classToken' PropertyHeaderVars {{ClassPropertyHeader}}
	;
PropertyValues
	:
	| PropertyValues PropertyIndex 'index'
	| PropertyValues PropertyReader 'reader'
	| PropertyValues PropertyWriter 'writer'
	| PropertyValues PropertyDefault 'default'
	| PropertyValues PropertyStored 'stored'
	| PropertyValues PropertyImplements 'implements'
	| PropertyValues PropertyDispid 'dispid'
	;
PropertyArrayAccessors
	:
	| ""["" 'left' ArgumentList ""]"" 'right' {{PropertyArrayAccessors}}
	;
PropertyIndex
	: ""INDEX"" 'indexToken' ConstantExpression 'expression' {{PropertyIndex}}
	;
PropertyReader
	: ""READ"" 'readToken' Expression 'expression' {{PropertyReader}}
	;
PropertyWriter
	: ""WRITE"" 'writeToken' Expression 'expression' {{PropertyWriter}}
	;
PropertyDispid
	: ""DISPID"" 'dispidToken' ConstantExpression 'expression' {{PropertyDispid}}
	| ""READONLY"" 'readOnlyToken' ""DISPID"" 'dispidToken' ConstantExpression 'expression' {{PropertyDispid}}
	| ""WRITEONLY"" 'writeOnlyToken' ""DISPID"" 'dispidToken' ConstantExpression 'expression' {{PropertyDispid}}
	;
PropertyDefault
	: ""DEFAULT"" 'defaultToken' ConstantExpression 'expression' {{PropertyDefault}}
	| ""DEFAULT"" 'defaultToken' {{PropertyDefault}}
	| ""NODEFAULT"" 'nodefaultToken' {{PropertyDefault}}
	;
PropertyImplements
	: ""IMPLEMENTS"" 'implementsToken' PropertyImplementsList {{PropertyImplements}}
	;
PropertyImplementsList
	: <identifier> 'interface'
	| PropertyImplementsList "","" 'comma' <identifier> 'interface'
	;
PropertyStored
	: ""STORED"" 'storedToken' <identifier> 'isStored' {{PropertyStored}}
	;
PropertyModifiers
	: 
	| ""DEFAULT"" 'defaultToken' <semicolon> 'semicolon' {{PropertyModifier}}
	;
MethodModifiers
	: 
	| MethodModifiers MethodModifier 'modifier' 
	;
NonExternalMethodModifiers
	: 
	| NonExternalMethodModifiers NonExternalMethodModifier 'modifier'
	;
MethodModifier
	: NonExternalMethodModifier
	| ExternalMethodModifier
	;
NonExternalMethodModifier
	: ModifierKeyword 'modifier' <semicolon> 'semicolon' {{MethodModifier}}
	| ""MESSAGE"" 'modifier' ConstantExpression 'expression' <semicolon> 'semicolon' {{MessageMethodModifier}}
	| ""DISPID"" 'modifier' ConstantExpression 'expression' <semicolon> 'semicolon' {{MessageMethodModifier}}
	;
ExternalMethodModifier
	: ""EXTERNAL"" 'modifier' <semicolon> 'semicolon' {{ExternalMethodModifier}}
	| ""EXTERNAL"" 'modifier' <string> 'library' <semicolon> 'semicolon' {{ExternalMethodModifier}}
	| ""EXTERNAL"" 'modifier' <string> 'library' ""NAME"" 'nameToken' <string> 'methodName' <semicolon> 'semicolon' {{ExternalMethodModifier}}
	| ""EXTERNAL"" 'modifier' <identifier> 'library' <semicolon> 'semicolon' {{ExternalMethodModifier}}
	| ""EXTERNAL"" 'modifier' <identifier> 'library' ""NAME"" 'nameToken' <string> 'methodName' <semicolon> 'semicolon' {{ExternalMethodModifier}}
	| ""FORWARD"" 'modifier' <semicolon> 'semicolon' {{MethodModifier}}
	;
ModifierKeyword
	: ""OVERLOAD"" | ""OVERRIDE"" | ""STDCALL"" | ""REGISTER"" | ""ASSEMBLER"" | ""PASCAL"" | ""REINTRODUCE"" | ""VIRTUAL"" | ""DEPRECATED"" | ""UNSAFE""
	| ""ABSTRACT"" | ""NEAR"" | ""FAR"" | ""CDECL"" | ""DYNAMIC"" | ""STATIC"" | ""PLATFORM"" | ""EXPORT"" | ""LOCAL"" | ""INLINE"" | ""FINAL"" | ""SAFECALL""
	;
ArgumentList
	: 
	| Arguments
	;
Arguments
	: Argument 'argument'
	| Arguments <semicolon> 'semicolon' Argument 'argument'
	;
Argument
	: ArgumentType VariableNames "":"" 'colon' Type 'type' OptionalValue {{Argument}}
	| ArgumentType VariableNames {{Argument}}
	;
VariableNames
	: <identifier> 'name'
	| VariableNames "","" 'comma' <identifier> 'name'
	;
OptionalValue
	: 
	| ""="" 'equal' ConstantExpression 'value'
	;
ArgumentType
	: 
	| ""VAR"" 'typeToken'
	| ""CONST"" 'typeToken'
	| ""OUT"" 'typeToken'
	;
ImplementationSection
	:
	| ""IMPLEMENTATION"" 'implementationToken' UsesList Definitions ImplementationCode 'code' {{ImplementationSection}}
	;
ImplementationCode
	: 
	| ""BEGIN"" 'beginToken' Statements {{ImplementationCode}}
	;
Definitions
	: 
	| Definitions Definition 'definition'
	;
Definition
	: ConstructorDefinition
	| DestructorDefinition
	| ProcedureDefinition
	| ClassProcedureDefinition
	| FunctionDefinition
	| ClassFunctionDefinition
	| ClassOperatorDefinition
	| DefinedTypeList
	| Vars
	| ConstantValueList
	| ResourceStringList
	;
ConstructorDefinition
	: NonExternalConstructorHeader 'header' MethodComponents {{ConstructorDefinition}}
	| ExternalConstructorHeader 'header' {{ConstructorDefinition}}
	;
ExternalConstructorHeader
	: NonExternalConstructorHeader ExternalMethodModifier 'modifier' MethodModifiers {{ConstructorHeader}}
	;
NonExternalConstructorHeader
	: ""CONSTRUCTOR"" 'constructorToken' QualifiedName 'qualifiedName' OptionalArguments <semicolon> 'semicolon' NonExternalMethodModifiers {{ConstructorHeader}}
	;
DestructorDefinition
	: NonExternalDestructorHeader 'header' MethodComponents {{DestructorDefinition}}
	| ExternalDestructorHeader 'header' {{DestructorDefinition}}
	;
ExternalDestructorHeader
	: NonExternalDestructorHeader ExternalMethodModifier 'modifier' MethodModifiers {{DestructorHeader}}
	;
NonExternalDestructorHeader
	: ""DESTRUCTOR"" 'destructorToken' QualifiedName 'qualifiedName' OptionalParens <semicolon> 'semicolon' NonExternalMethodModifiers {{DestructorHeader}}
	;
OptionalParens
	:
	| ""("" 'left' "")"" 'right'
	;
ProcedureDefinition
	: NonExternalProcedureHeader 'header' MethodComponents {{ProcedureDefinition}}
	| ExternalProcedureHeader 'header' {{ProcedureDefinition}}
	;
ExternalProcedureHeader
	: ExternalProcedureHeaderVars {{ProcedureHeader}}
	;
ExternalProcedureHeaderVars
	: NonExternalProcedureHeaderVars ExternalMethodModifier 'modifier' MethodModifiers
	;
NonExternalProcedureHeader
	: NonExternalProcedureHeaderVars {{ProcedureHeader}}
	;
NonExternalProcedureHeaderVars
	: ""PROCEDURE"" 'procedureToken' QualifiedName 'qualifiedName' OptionalArguments <semicolon> 'semicolon' NonExternalMethodModifiers 
	;
ClassProcedureDefinition
	: NonExternalClassProcedureHeader 'header' MethodComponents {{ClassProcedureDefinition}}
	| ExternalClassProcedureHeader 'header' {{ClassProcedureDefinition}}
	;
ExternalClassProcedureHeader
	: ""CLASS"" 'classToken' ExternalProcedureHeaderVars {{ClassProcedureHeader}}
	;
NonExternalClassProcedureHeader
	: ""CLASS"" 'classToken' NonExternalProcedureHeaderVars {{ClassProcedureHeader}}
	;
FunctionDefinition
	: NonExternalFunctionHeader 'header' MethodComponents {{FunctionDefinition}}
	| ExternalFunctionHeader 'header' {{FunctionDefinition}}
	;
ExternalFunctionHeader
	: ExternalFunctionHeaderVars {{FunctionHeader}}
	;
ExternalFunctionHeaderVars
	: NonExternalFunctionHeaderVars ExternalMethodModifier 'modifier' MethodModifiers
	;
NonExternalFunctionHeader
	: NonExternalFunctionHeaderVars {{FunctionHeader}}
	;
NonExternalFunctionHeaderVars
	: ""FUNCTION"" 'functionToken' QualifiedName 'qualifiedName' OptionalArguments OptionalType <semicolon> 'semicolon' NonExternalMethodModifiers
	;
ClassFunctionDefinition
	: NonExternalClassFunctionHeader 'header' MethodComponents {{ClassFunctionDefinition}}
	| ExternalClassFunctionHeader 'header' {{ClassFunctionDefinition}}
	;
ExternalClassFunctionHeader
	: ""CLASS"" 'classToken' ExternalFunctionHeaderVars {{ClassFunctionHeader}}
	;
NonExternalClassFunctionHeader
	: ""CLASS"" 'classToken' NonExternalFunctionHeaderVars {{ClassFunctionHeader}}
	;
ClassOperatorDefinition
	: NonExternalClassOperatorHeader 'header' MethodComponents {{ClassOperatorDefinition}}
	| ExternalClassOperatorHeader 'header' {{ClassOperatorDefinition}}
	;
ExternalClassOperatorHeader
	: NonExternalClassOperatorHeader ExternalMethodModifier 'modifier' MethodModifiers {{ClassOperatorHeader}}
	;
NonExternalClassOperatorHeader
	: ""CLASS"" 'classToken' ""OPERATOR"" 'operatorToken' QualifiedName 'qualifiedName' OptionalArguments OptionalType <semicolon> 'semicolon' NonExternalMethodModifiers {{ClassOperatorHeader}}
	;
MethodComponents
	: MethodVariables StatementBlock 'block' <semicolon> 'semicolon'
	;
MethodVariables
	: MethodVariables MethodVariable 'definition'
	| 
	;
MethodVariable
	: Vars
	| DefinedTypeList
	| ConstantValueList
	| ProcedureDefinition
	| FunctionDefinition
	| Labels
	;
Labels
	: ""LABEL"" 'labelToken' VariableNames <semicolon> 'semicolon' {{LabelVariable}}
	;
Vars
	: VarsVars {{Vars}}
	;
VarsVars
	: ""VAR"" 'varToken' VariablesList
	| ""THREADVAR"" 'varToken' VariablesList
	;
VariablesList
	: Variable 'variableDefinition'
	| VariablesList Variable 'variableDefinition'
	;
Variable
	: VariableNames "":"" 'colon' Type 'type' OptionalPlatform OptionalValue <semicolon> 'semicolon' {{Variable}}
	;
Statements
	: Statement 'statement' 
	| Statements <semicolon> 'semicolon' Statement 'statement' 
	;
Statement
	: Expression
	| RepeatStatement {{RepeatStatement}}
	| IfStatement {{IfStatement}} 
	| WithStatement {{WithStatement}}
	| TryStatement {{TryStatement}} 
	| CaseStatement {{CaseStatement}} 
	| RaiseStatement {{RaiseStatement}}  
	| ForStatement {{ForStatement}}
	| ForInStatement {{ForInStatement}}
	| WhileStatement {{WhileStatement}}
	| GotoStatement {{GotoStatement}}
	| StatementBlock
	| LabeledStatement {{LabeledStatement}}
	| {{EmptyStatement}}
	;
LabeledStatement
	: <identifier> 'label' "":"" 'colon' Statement 'statement'
	| <number> 'label' "":"" 'colon' Statement 'statement'
	;
GotoStatement
	: ""GOTO"" 'gotoToken' <identifier> 'label'
	| ""GOTO"" 'gotoToken' <number> 'label'
	;
RepeatStatement
	: ""REPEAT"" 'repeatToken' Statements ""UNTIL"" 'untilToken' Expression 'expression'
	;
IfStatement
	: ""IF"" 'ifToken' Expression 'expression' ""THEN"" 'thenToken' Statement 'thenStatement'
	| ""IF"" 'ifToken' Expression 'expression' ""THEN"" 'thenToken' Statement 'thenStatement' ""ELSE"" 'elseToken' Statement 'elseStatement'
	;
WithStatement
	: ""WITH"" 'withToken' WithExpressions ""DO"" 'doToken' Statement 'statement'
	;
WithExpressions
	: Expression 'expression' 
	| WithExpressions "","" 'comma' Expression 'expression' 
	;
TryStatement
	: ""TRY"" 'tryToken' Statements Except 'except' Finally 'finally' ""END"" 'endToken'
	;
Except
	:
	| ""EXCEPT"" 'exceptToken' OnDos PossibleExceptElse 'else' {{Except}}
	| ""EXCEPT"" 'exceptToken' Statements PossibleExceptElse 'else' {{Except}}
	;
OnDos
	: OnDo 'exceptionCase'
	| OnDos OnDo 'exceptionCase'
	;
OnDo
	: ""ON"" 'onToken' QualifiedName 'exception' OptionalType ""DO"" 'doToken' Statements {{OnDo}}
	;
PossibleExceptElse
	: 
	| ""ELSE"" 'elseToken' Statements {{ExceptElse}}
	;
Finally
	: 
	| ""FINALLY"" 'finallyToken' Statements {{Finally}}
	;
CaseStatement
	: ""CASE"" 'caseToken' Expression 'expression' ""OF"" 'ofToken' CaseOptionList ElseCase ""END"" 'endToken'
	;
OptionalSemicolon
	:
	| <semicolon> 'semicolon'
	;
CaseOptionList
	: CaseOptions OptionalSemicolon
	;
CaseOptions
	: CaseOption 'option'
	| CaseOptions <semicolon> 'semicolon'  CaseOption 'option'  
	;
CaseOption
	: CaseLabel 'label' "":"" 'colon' Statement 'statement' {{CaseOption}}
	;
CaseLabel
	: BaseCaseLabel 
	| CaseLabels "","" 'comma' BaseCaseLabel 'label' {{MultiValueCaseLabel}}
	;
CaseLabels
	: BaseCaseLabel 'label'
	| CaseLabels "","" 'comma' BaseCaseLabel 'label'
	;
BaseCaseLabel
	: ConstantExpression 'value' {{CaseLabel}} 
	| ConstantExpression 'fromValue'  "".."" 'dots' ConstantExpression 'toValue' {{RangeCaseLabel}} 
	;
ElseCase
	: 
	| ""ELSE"" 'elseToken' Statements
	;
RaiseStatement
	: ""RAISE"" 'raiseToken' Expression 'expression' OptionalRaiseAt
	| ""RAISE"" 'raiseToken'
	;
OptionalRaiseAt
	: 
	| <at> 'atToken' QualifiedName 'location'
	;
ForStatement
	: ""FOR"" 'forToken' VariableExpression 'variable' "":="" 'assignmentToken' Expression 'fromExpr' ToDownTo  'toToken' Expression 'toExpr' ""DO"" 'doToken' Statement 'statement' 
	;
ForInStatement
	: ""FOR"" 'forToken' VariableExpression 'variable' ""IN"" 'inToken' Expression 'fromExpr' ""DO"" 'doToken' Statement 'statement' 
	;
ToDownTo
	: ""TO""
	| ""DOWNTO""
	;
WhileStatement
	: ""WHILE"" 'whileToken' Expression 'expression' ""DO"" 'doToken' Statement 'statement'
	;
StatementBlock
	: ""BEGIN"" 'beginToken' Statements ""END"" 'endToken' {{StatementBlock}} 
	| AsmBlock
	;
AsmBlock
	: BeforeAsm ""ASM"" 'asmToken' ""END"" 'endToken' {{AsmBlock}} 
	;
BeforeAsm
	: {parseAll ifFalse: [scanner skipToEndToken. currentState position: scanner position]. nil}
	;
Expression
	: VariableExpression
	| InstantiatedGenericVariableExpression
	| Expression 'expression' ""."" 'period' <identifier> 'name' {{PropertyExpression}}
	| Expression 'expression' ""."" 'period' ""&OPERATOR"" 'name' {{PropertyExpression}}
	| Expression 'receiver' ""("" 'left' MethodArguments "")"" 'right' {{MethodCallExpression}}
	| Expression 'receiver' ""("" 'left' "")"" 'right' {{MethodCallExpression}}
	| InheritedFunctionCall
	| Number 'value' {{LiteralExpression}}
	| String 'value' {{LiteralExpression}}
	| <multiple_control_chars> 'value' {{LiteralExpression}}
	| Expression 'leftExpression' Operator 'operator' Expression 'rightExpression' {{BinaryExpression}}
	| ""("" 'leftParen' Expression "")"" 'rightParen' {{Expression}}
	| Expression 'lhs' "":="" 'assignment' Expression 'value' {{AssignmentExpression}} # allows for non-sense assignments
	| Expression 'expression' ArrayIndex {{ArrayExpression}}
	| ""@"" 'atToken' Expression 'expression' {{AddressExpression}} # should only be variables
	| ""NOT"" 'notToken' Expression 'expression' {{NotExpression}} 
	| <minus> 'minus' Expression 'expression' {{MinusExpression}}
	| <plus> 'plus' Expression 'expression' {{PlusExpression}}
	| SetConstructor 
	| Expression 'expression' <upArrow> 'upArrow' {{PointerExpression}} 
	| <controlCharacter> 'value' {{LiteralExpression}}
	| MemExpression 
	;
MemExpression
	: ""MEM"" 'mem' ""["" 'leftBrace' Expression 'baseExpression' "":"" 'colon' Expression 'addressExpression' ""]"" 'rightBrace' {{}}
	| ""MEMW"" 'mem' ""["" 'leftBrace' Expression 'baseExpression' "":"" 'colon' Expression 'addressExpression' ""]"" 'rightBrace' {{}}
	;
VariableExpression
	: <identifier> 'name' {{VariableExpression}}
	;
InstantiatedGenericVariableExpression
	: <identifier> 'name' InstantiatedGenericTypeArguments {{}}
	;
SetConstructor
	: ""["" 'left' SetConstructorValues ""]"" 'right' {{SetExpression}}
	| ""["" 'left' ""]"" 'right' {{SetExpression}}
	;
SetConstructorValues
	: SetValue 'value' 
	| SetConstructorValues "","" 'comma' SetValue 'value'
	;
SetValue
	: Expression 'value' {{SingleSetValue}}
	| Expression 'fromValue' "".."" 'dots' Expression 'toValue' {{RangeSetValue}}
	;
ArrayIndex
	: ""["" 'left' ArrayIndices ""]"" 'right'
	;
ArrayIndices
	: Expression 'index'
	| ArrayIndices "","" 'comma' Expression 'index' 
	;
String
	: <string>
	;
InheritedFunctionCall
	: ""INHERITED"" 'inheritedToken' <identifier> 'name' ""("" 'left' MethodArguments "")"" 'right' {{InheritedFunctionCall}} 
	| ""INHERITED"" 'inheritedToken' <identifier> 'name' ""("" 'left' "")"" 'right' {{InheritedFunctionCall}} 
	| ""INHERITED"" 'inheritedToken' <identifier> 'name' {{InheritedFunctionCall}} 
	| ""INHERITED"" 'inheritedToken' {{InheritedFunctionCall}} 
	;
MethodArguments
	: MethodArgument 'argument'
	| MethodArguments "","" 'comma' MethodArgument 'argument'
	;
MethodArgument
	: Expression
	| MethodArgument 'argument' "":"" 'colon' Expression 'formatExpression' {{FormattedMethodArgument}}
	;
Operator
	: ""="" 'operator' 
	| ConstantOperator 'operator' 
	;
ConstantOperator
	: ""AND""
	| ""OR""
	| ""XOR""
	| ""<>""
	| ""DIV""
	| ""MOD""
	| ""*""
	| ""/""
	| <plus>
	| <minus>
	| ""SHL""
	| ""SHR""
	| ""AS""
	| "">""
	| ""<""
	| ""<=""
	| "">=""
	| ""IN""
	| ""IS""
	;
InitializationSection
	:
	| ""INITIALIZATION"" 'initializationToken' Statements {{InitializationSection}} 
	;
FinalizationSection
	: 
	| ""FINALIZATION"" 'finalizationToken' Statements {{FinalizationSection}} 
	;
EndFile
	: ""END"" 'endToken' ""."" 'period'
	;"
]

{ #category : #'file types' }
DelphiParser class >> fileExtension [
	^ '.pas'
]

{ #category : #'file types' }
DelphiParser class >> fileExtensionType [
	^ 'Delphi files'
]

{ #category : #'generated-accessing' }
DelphiParser class >> scannerClass [
	^DelphiScanner
]

{ #category : #generated }
DelphiParser class >> startingStateForFile [
	^ 1
]

{ #category : #generated }
DelphiParser class >> startingStateForNamedDefinedType [
	^ 4
]

{ #category : #generated }
DelphiParser class >> startingStateForSimpleDefinedType [
	^ 3
]

{ #category : #generated }
DelphiParser class >> startingStateForStatement [
	^ 2
]

{ #category : #private }
DelphiParser >> actionsForCurrentToken [
	| actions action ids newToken |
	actions := OrderedCollection new: 1.
	ids := currentToken ids.
	ids
		do: [ :anInteger | 
			self addActionsFor: anInteger to: actions.
			(anInteger = scanner atId or: [ currentToken value sameAs: 'on' ])
				ifTrue: [ self
						addActionsFor: scanner identifierId to: actions;
						addActionsFor: scanner constantIdentifierId to: actions ].
			actions notEmpty
				ifTrue: [ ^ actions ] ].
	((ids includes: scanner identifierId)
		and: [ (ids includes: scanner constantIdentifierId) not ])
		ifTrue: [ action := self actionFor: scanner constantIdentifierId.
			(action bitAnd: self actionMask) ~= self errorAction
				ifTrue: [ actions add: action.
					^ actions ] ].
	(ids includes: scanner upArrowId)
		ifTrue: [ newToken := scanner scanControlCharacter.
			newToken notNil
				ifTrue: [ currentToken := newToken.
					currentState position: scanner position.
					self addActionsFor: scanner controlCharacterId to: actions.
					actions notEmpty
						ifTrue: [ ^ actions ] ] ].
	action := self actionFor: scanner semicolonId.
	((action bitAnd: self actionMask) ~= self errorAction
		and: [ states size = 1 ])
		ifTrue: [ lastInsertPosition = currentToken startPosition
				ifTrue: [ ^ actions ].	"Don't get into a loop inserting ;'s"
			lastInsertPosition := currentToken startPosition.
			self position: currentToken startPosition - 1.
			currentToken := scanner tokenClass
				value: ';'
				start: nil
				ids: (Array with: scanner semicolonId).
			self addActionsFor: scanner semicolonId to: actions.
			actions notEmpty
				ifTrue: [ ^ actions ] ].
	^ actions
]

{ #category : #private }
DelphiParser >> addActionsFor: anInteger to: anOrderedCollection [
	| action |
	action := self actionForState: self currentState and: anInteger.
	action = self errorAction
		ifTrue:
			[ action := self actionFor: anInteger.
			(action bitAnd: self actionMask) = self errorAction
				ifFalse: [ ^ anOrderedCollection add: action ].
			(anInteger = scanner numberId
				and:
					[ currentToken value notEmpty
						and: [ '+-' includes: currentToken value first ] ])
				ifTrue:
					[ currentToken := scanner tokenClass
						value: (currentToken value copyFrom: 1 to: 1)
						start: currentToken startPosition
						ids:
							(Array
								with:
									(currentToken value first = $-
										ifTrue: [ scanner minusId ]
										ifFalse: [ scanner plusId ])).
					self position: currentToken stopPosition.
					^ self
						addActionsFor:
							(currentToken value first = $-
								ifTrue: [ scanner minusId ]
								ifFalse: [ scanner plusId ])
						to: anOrderedCollection ].
			^ self ].
	(action bitAnd: self actionMask) = 2r11
		ifTrue:
			[ self
				ambiguousTransitionsAt: (action bitShift: -2)
				into: anOrderedCollection ]
		ifFalse: [ anOrderedCollection add: action ]
]

{ #category : #generated }
DelphiParser >> ambiguousTransitions [
^#(
#[ 0 58 2 49] 
#[ 0 146 0 150] 
#[ 0 158 2 61] 
#[ 0 158 2 65] 
#[ 0 210 2 61] 
#[ 0 210 2 65] 
#[ 0 210 2 117] 
#[ 0 210 2 121] 
#[ 0 210 2 137] 
#[ 0 210 2 141] 
#[ 0 210 2 145] 
#[ 0 214 2 61] 
#[ 0 214 2 65] 
#[ 0 214 2 117] 
#[ 0 214 2 121] 
#[ 0 214 2 137] 
#[ 0 214 2 141] 
#[ 0 214 2 145] 
#[ 0 254 2 61] 
#[ 0 254 2 65] 
#[ 0 254 2 117] 
#[ 0 254 2 121] 
#[ 0 254 2 137] 
#[ 0 254 2 141] 
#[ 0 254 2 145] 
#[ 1 2 2 61] 
#[ 1 2 2 65] 
#[ 1 2 2 117] 
#[ 1 2 2 121] 
#[ 1 2 2 137] 
#[ 1 2 2 141] 
#[ 1 2 2 145] 
#[ 1 38 2 61] 
#[ 1 38 2 65] 
#[ 1 38 2 117] 
#[ 1 38 2 137] 
#[ 1 38 2 141] 
#[ 1 38 2 145] 
#[ 1 42 2 61] 
#[ 1 42 2 65] 
#[ 1 42 2 117] 
#[ 1 42 2 137] 
#[ 1 42 2 141] 
#[ 1 42 2 145] 
#[ 1 62 4 177] 
#[ 0 178 3 49] 
#[ 1 74 2 61] 
#[ 1 74 2 65] 
#[ 1 74 2 117] 
#[ 1 74 2 137] 
#[ 1 74 2 141] 
#[ 1 74 2 145] 
#[ 1 78 2 61] 
#[ 1 78 2 65] 
#[ 1 78 2 117] 
#[ 1 78 2 137] 
#[ 1 78 2 141] 
#[ 1 78 2 145] 
#[ 1 82 2 49] 
#[ 1 182 2 61] 
#[ 1 182 2 65] 
#[ 1 182 2 117] 
#[ 1 182 2 121] 
#[ 1 182 2 137] 
#[ 1 182 2 141] 
#[ 1 182 2 145] 
#[ 1 206 2 61] 
#[ 1 206 2 65] 
#[ 1 206 2 117] 
#[ 1 206 2 121] 
#[ 1 206 2 137] 
#[ 1 206 2 141] 
#[ 1 206 2 145] 
#[ 1 214 2 61] 
#[ 1 214 2 65] 
#[ 1 242 2 49] 
#[ 2 2 2 61] 
#[ 2 2 2 65] 
#[ 2 2 2 117] 
#[ 2 2 2 137] 
#[ 2 2 2 141] 
#[ 2 2 2 145] 
#[ 2 10 2 49] 
#[ 0 146 8 69] 
#[ 3 194 9 97] 
#[ 3 194 9 101] 
#[ 3 194 9 125] 
#[ 2 49 4 10] 
#[ 0 194 3 73] 
#[ 5 26 9 97] 
#[ 5 26 9 101] 
#[ 5 26 9 125]
	).
]

{ #category : #private }
DelphiParser >> parse [
	| node expressionVisitor result |
	expressionVisitor := DelphiBinaryExpressionVisitor new.	"Hack to handle the incorrect parsing of a * b + c as a * (b + c)"
	result := super parse.
	^ parseAll
		ifTrue:
			[ result
				collect:
					[ :each | 
					node := expressionVisitor accept: each.
					(node isKindOf: SmaCCParseNode)
						ifTrue:
							[ node
								attributeNamed: #ifDefs put: scanner ifDefs;
								attributeNamed: #opts put: scanner optComments ].
					node ] ]
		ifFalse:
			[ node := expressionVisitor accept: result.
			(node isKindOf: SmaCCParseNode)
				ifTrue:
					[ node
						attributeNamed: #ifDefs put: scanner ifDefs;
						attributeNamed: #opts put: scanner optComments ].
			node ]
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForAnonymousFunctionType1: nodes [
	| result |
	result := DelphiAnonymousFunctionTypeNode new.
	result functionToken: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result arguments.
	result addTokens: ((nodes at: 2) at: 3) to: result semicolons.
	result right: ((nodes at: 2) at: 4).
	result colon: (nodes at: 3).
	result type: (nodes at: 4).
	result ofToken: ((nodes at: 5) at: 1).
	result objectToken: ((nodes at: 5) at: 2).
	result addToken: (nodes at: 6) to: result semicolons.
	result addNodes: (nodes at: 7) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForAnonymousProcedureType1: nodes [
	| result |
	result := DelphiAnonymousProcedureTypeNode new.
	result procedureToken: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result arguments.
	result addTokens: ((nodes at: 2) at: 3) to: result semicolons.
	result right: ((nodes at: 2) at: 4).
	result ofToken: ((nodes at: 3) at: 1).
	result objectToken: ((nodes at: 3) at: 2).
	result addToken: (nodes at: 4) to: result semicolons.
	result addNodes: (nodes at: 5) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForArgument1: nodes [
	| result |
	result := DelphiArgumentNode new.
	result typeToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result names.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result colon: (nodes at: 3).
	result type: (nodes at: 4).
	result equal: ((nodes at: 5) at: 1).
	result value: ((nodes at: 5) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForArgument2: nodes [
	| result |
	result := DelphiArgumentNode new.
	result typeToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result names.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForArgumentList1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForArrayType1: nodes [
	| result |
	result := DelphiArrayTypeNode new.
	result packedToken: (nodes at: 1).
	result arrayToken: (nodes at: 2).
	result left: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result indexes.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result right: ((nodes at: 3) at: 4).
	result ofToken: (nodes at: 4).
	result type: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForArrayType2: nodes [
	| result |
	result := DelphiArrayTypeNode new.
	result packedToken: (nodes at: 1).
	result arrayToken: (nodes at: 2).
	result left: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result indexes.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result right: ((nodes at: 3) at: 4).
	result ofToken: (nodes at: 4).
	result constToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForAsmBlock1: nodes [
	| result |
	result := DelphiAsmBlockNode new.
	result asmToken: (nodes at: 2).
	result endToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForBaseCaseLabel1: nodes [
	| result |
	result := DelphiCaseLabelNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForBaseCaseLabel2: nodes [
	| result |
	result := DelphiRangeCaseLabelNode new.
	result fromValue: (nodes at: 1).
	result dots: (nodes at: 2).
	result toValue: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForBeforeAsm1: nodes [
	parseAll
		ifFalse: [ scanner skipToEndToken.
			currentState position: scanner position ].
	^ nil
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForCaseLabel2: nodes [
	| result |
	result := DelphiMultiValueCaseLabelNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result labels.
	result addTokens: ((nodes at: 1) at: 2) to: result commas.
	result addToken: (nodes at: 2) to: result commas.
	result addNode: (nodes at: 3) to: result labels.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForCaseOption1: nodes [
	| result |
	result := DelphiCaseOptionNode new.
	result label: (nodes at: 1).
	result colon: (nodes at: 2).
	result statement: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForCaseOptionList1: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForCaseStatement1: nodes [
	| result |
	result := Array new: 8.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	self addAll: ((nodes at: 4) at: 1) to: (result at: 4).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 5).
	result at: 6 put: ((nodes at: 5) at: 1).
	self addAll: ((nodes at: 5) at: 2) to: (result at: 7).
	self addAll: ((nodes at: 5) at: 3) to: (result at: 5).
	result at: 8 put: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForClassFunctionDefinition1: nodes [
	| result |
	result := DelphiClassFunctionDefinitionNode new.
	result header: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result definitions.
	result block: ((nodes at: 2) at: 2).
	result semicolon: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForClassFunctionDefinition2: nodes [
	| result |
	result := DelphiClassFunctionDefinitionNode new.
	result header: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForClassHelperType1: nodes [
	| result |
	result := DelphiClassHelperTypeNode new.
	result classToken: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result classAttributes.
	result helperToken: (nodes at: 3).
	result forToken: (nodes at: 4).
	result _class: (nodes at: 5).
	result left: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result superclasses.
	result addTokens: ((nodes at: 6) at: 3) to: result commas.
	result right: ((nodes at: 6) at: 4).
	result implicitClassSection: (nodes at: 7).
	result addNodes: (nodes at: 8) to: result sections.
	result endToken: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForClassHelperType2: nodes [
	| result |
	result := DelphiClassHelperTypeNode new.
	result classToken: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result classAttributes.
	result helperToken: (nodes at: 3).
	result forToken: (nodes at: 4).
	result _class: (nodes at: 5).
	result left: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result superclasses.
	result addTokens: ((nodes at: 6) at: 3) to: result commas.
	result right: ((nodes at: 6) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForClassOperatorDefinition1: nodes [
	| result |
	result := DelphiClassOperatorDefinitionNode new.
	result header: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result definitions.
	result block: ((nodes at: 2) at: 2).
	result semicolon: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForClassOperatorDefinition2: nodes [
	| result |
	result := DelphiClassOperatorDefinitionNode new.
	result header: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForClassProcedureDefinition1: nodes [
	| result |
	result := DelphiClassProcedureDefinitionNode new.
	result header: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result definitions.
	result block: ((nodes at: 2) at: 2).
	result semicolon: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForClassProcedureDefinition2: nodes [
	| result |
	result := DelphiClassProcedureDefinitionNode new.
	result header: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForClassPropertyHeader1: nodes [
	| result |
	result := DelphiClassPropertyHeaderNode new.
	result classToken: (nodes at: 1).
	result propertyToken: ((nodes at: 2) at: 1).
	result name: ((nodes at: 2) at: 2).
	result arrayAccessors: ((nodes at: 2) at: 3).
	result colon: ((nodes at: 2) at: 4).
	result type: ((nodes at: 2) at: 5).
	result addNodes: ((nodes at: 2) at: 6) to: result indexes.
	result addNodes: ((nodes at: 2) at: 7) to: result readers.
	result addNodes: ((nodes at: 2) at: 8) to: result writers.
	result addNodes: ((nodes at: 2) at: 9) to: result defaults.
	result addNodes: ((nodes at: 2) at: 10) to: result storeds.
	result addNodes: ((nodes at: 2) at: 11) to: result implementses.
	result addNodes: ((nodes at: 2) at: 12) to: result dispids.
	result semicolon: ((nodes at: 2) at: 13).
	result modifier: ((nodes at: 2) at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstantArray1: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstantArray2: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstantExpression10: nodes [
	| result |
	result := DelphiRecordExpressionNode new.
	result left: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result fields.
	result addTokens: ((nodes at: 2) at: 2) to: result semicolons.
	result addToken: (nodes at: 3) to: result semicolons.
	result right: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstantExpression11: nodes [
	| result |
	result := DelphiConstantArrayExpressionNode new.
	result left: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result expressions.
	result addTokens: ((nodes at: 2) at: 2) to: result equalTokens.
	result addNodes: ((nodes at: 2) at: 3) to: result values.
	result addTokens: ((nodes at: 2) at: 4) to: result commas.
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstantRecordField1: nodes [
	| result |
	result := DelphiConstantRecordFieldNode new.
	result name: (nodes at: 1).
	result colon: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstantValue1: nodes [
	| result |
	result := DelphiConstantDefinitionNode new.
	result name: (nodes at: 1).
	result colon: ((nodes at: 2) at: 1).
	result type: ((nodes at: 2) at: 2).
	result equalToken: (nodes at: 3).
	result expression: (nodes at: 4).
	result modifier: (nodes at: 5).
	result deprecatedToken: (nodes at: 6).
	result semicolon: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstantValueList1: nodes [
	| result |
	result := DelphiConstantListNode new.
	result constToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result definitions.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstantValues1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstructorDefinition1: nodes [
	| result |
	result := DelphiConstructorDefinitionNode new.
	result header: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result definitions.
	result block: ((nodes at: 2) at: 2).
	result semicolon: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForConstructorDefinition2: nodes [
	| result |
	result := DelphiConstructorDefinitionNode new.
	result header: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForDefinedType2: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	result at: 3 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForDefinedTypeList1: nodes [
	| result |
	result := DelphiDefinedTypeListNode new.
	result typeToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result definitions.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForDestructorDefinition1: nodes [
	| result |
	result := DelphiDestructorDefinitionNode new.
	result header: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result definitions.
	result block: ((nodes at: 2) at: 2).
	result semicolon: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForDestructorDefinition2: nodes [
	| result |
	result := DelphiDestructorDefinitionNode new.
	result header: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForElseCase1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForElseCase2: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForEnumName1: nodes [
	| result |
	result := DelphiEnumNameNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForEnumName2: nodes [
	| result |
	result := DelphiEnumNameNode new.
	result name: (nodes at: 1).
	result equal: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForEnumType1: nodes [
	| result |
	result := DelphiEnumTypeNode new.
	result left: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result names.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExcept2: nodes [
	| result |
	result := DelphiExceptNode new.
	result exceptToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result exceptionCases.
	result else: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExcept3: nodes [
	| result |
	result := DelphiExceptNode new.
	result exceptToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	result addTokens: ((nodes at: 2) at: 2) to: result semicolons.
	result else: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression10: nodes [
	| result |
	result := DelphiLiteralExpressionNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression11: nodes [
	| result |
	result := DelphiBinaryExpressionNode new.
	result leftExpression: (nodes at: 1).
	result operator: (nodes at: 2).
	result rightExpression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression12: nodes [
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result leftParens.
	result addToken: (nodes at: 3) to: result rightParens.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression13: nodes [
	| result |
	result := DelphiAssignmentExpressionNode new.
	result lhs: (nodes at: 1).
	result assignment: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression14: nodes [
	| result |
	result := DelphiArrayExpressionNode new.
	result expression: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result indexes.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result right: ((nodes at: 2) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression15: nodes [
	| result |
	result := DelphiAddressExpressionNode new.
	result atToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression16: nodes [
	| result |
	result := DelphiNotExpressionNode new.
	result notToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression17: nodes [
	| result |
	result := DelphiMinusExpressionNode new.
	result minus: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression18: nodes [
	| result |
	result := DelphiPlusExpressionNode new.
	result plus: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression20: nodes [
	| result |
	result := DelphiPointerExpressionNode new.
	result expression: (nodes at: 1).
	result upArrow: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression4: nodes [
	| result |
	result := DelphiPropertyExpressionNode new.
	result expression: (nodes at: 1).
	result period: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression5: nodes [
	| result |
	result := DelphiMethodCallExpressionNode new.
	result receiver: (nodes at: 1).
	result left: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result arguments.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result right: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExpression6: nodes [
	| result |
	result := DelphiMethodCallExpressionNode new.
	result receiver: (nodes at: 1).
	result left: (nodes at: 2).
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalClassFunctionHeader1: nodes [
	| result |
	result := DelphiClassFunctionHeaderNode new.
	result classToken: (nodes at: 1).
	result functionToken: ((nodes at: 2) at: 1).
	result qualifiedName: ((nodes at: 2) at: 2).
	result left: ((nodes at: 2) at: 3).
	result addNodes: ((nodes at: 2) at: 4) to: result arguments.
	result addTokens: ((nodes at: 2) at: 5) to: result semicolons.
	result right: ((nodes at: 2) at: 6).
	result colon: ((nodes at: 2) at: 7).
	result type: ((nodes at: 2) at: 8).
	result addNodes: ((nodes at: 2) at: 9) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalClassProcedureHeader1: nodes [
	| result |
	result := DelphiClassProcedureHeaderNode new.
	result classToken: (nodes at: 1).
	result procedureToken: ((nodes at: 2) at: 1).
	result qualifiedName: ((nodes at: 2) at: 2).
	result left: ((nodes at: 2) at: 3).
	result addNodes: ((nodes at: 2) at: 4) to: result arguments.
	result addTokens: ((nodes at: 2) at: 5) to: result semicolons.
	result right: ((nodes at: 2) at: 6).
	result addNodes: ((nodes at: 2) at: 7) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalConstructorHeader1: nodes [
	| result |
	result := nodes at: 1.
	result addNode: (nodes at: 2) to: result modifiers.
	result addNodes: (nodes at: 3) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalFunctionHeader1: nodes [
	| result |
	result := DelphiFunctionHeaderNode new.
	result functionToken: ((nodes at: 1) at: 1).
	result qualifiedName: ((nodes at: 1) at: 2).
	result left: ((nodes at: 1) at: 3).
	result addNodes: ((nodes at: 1) at: 4) to: result arguments.
	result addTokens: ((nodes at: 1) at: 5) to: result semicolons.
	result right: ((nodes at: 1) at: 6).
	result colon: ((nodes at: 1) at: 7).
	result type: ((nodes at: 1) at: 8).
	result addNodes: ((nodes at: 1) at: 9) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalFunctionHeaderVars1: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 9).
	self addAll: (nodes at: 3) to: (result at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalMethodModifier1: nodes [
	| result |
	result := DelphiExternalMethodModifierNode new.
	result modifier: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalMethodModifier4: nodes [
	| result |
	result := DelphiExternalMethodModifierNode new.
	result modifier: (nodes at: 1).
	result library: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalMethodModifier5: nodes [
	| result |
	result := DelphiExternalMethodModifierNode new.
	result modifier: (nodes at: 1).
	result library: (nodes at: 2).
	result nameToken: (nodes at: 3).
	result methodName: (nodes at: 4).
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalMethodModifier6: nodes [
	| result |
	result := DelphiMethodModifierNode new.
	result modifier: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalProcedureHeader1: nodes [
	| result |
	result := DelphiProcedureHeaderNode new.
	result procedureToken: ((nodes at: 1) at: 1).
	result qualifiedName: ((nodes at: 1) at: 2).
	result left: ((nodes at: 1) at: 3).
	result addNodes: ((nodes at: 1) at: 4) to: result arguments.
	result addTokens: ((nodes at: 1) at: 5) to: result semicolons.
	result right: ((nodes at: 1) at: 6).
	result addNodes: ((nodes at: 1) at: 7) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForExternalProcedureHeaderVars1: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 7).
	self addAll: (nodes at: 3) to: (result at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFile1: nodes [
	| result |
	result := DelphiUnitFileNode new.
	result unitToken: ((nodes at: 1) at: 1).
	result unitName: ((nodes at: 1) at: 2).
	result modifier: ((nodes at: 1) at: 3).
	result semicolon: ((nodes at: 1) at: 4).
	result interfaceSection: ((nodes at: 1) at: 5).
	result implementationSection: ((nodes at: 1) at: 6).
	result initializationSection: ((nodes at: 1) at: 7).
	result finalizationSection: ((nodes at: 1) at: 8).
	result endToken: ((nodes at: 1) at: 9).
	result period: ((nodes at: 1) at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFile2: nodes [
	| result |
	result := DelphiProgramFileNode new.
	result programToken: ((nodes at: 1) at: 1).
	result programName: ((nodes at: 1) at: 2).
	result modifier: ((nodes at: 1) at: 3).
	result addTokens: ((nodes at: 1) at: 4) to: result semicolons.
	result usesToken: ((nodes at: 1) at: 5).
	result addNodes: ((nodes at: 1) at: 6) to: result moduleNames.
	result addTokens: ((nodes at: 1) at: 7) to: result inTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result filenames.
	result addTokens: ((nodes at: 1) at: 9) to: result commas.
	result main: ((nodes at: 1) at: 10).
	result period: ((nodes at: 1) at: 11).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFile3: nodes [
	| result |
	result := DelphiLibraryFileNode new.
	result libraryToken: ((nodes at: 1) at: 1).
	result libraryName: ((nodes at: 1) at: 2).
	result modifier: ((nodes at: 1) at: 3).
	result addTokens: ((nodes at: 1) at: 4) to: result semicolons.
	result usesToken: ((nodes at: 1) at: 5).
	result addNodes: ((nodes at: 1) at: 6) to: result moduleNames.
	result addTokens: ((nodes at: 1) at: 7) to: result inTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result filenames.
	result addTokens: ((nodes at: 1) at: 9) to: result commas.
	result addNodes: ((nodes at: 1) at: 10) to: result exports.
	result main: ((nodes at: 1) at: 11).
	result period: ((nodes at: 1) at: 12).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFileType1: nodes [
	| result |
	result := DelphiFileTypeNode new.
	result fileToken: (nodes at: 1).
	result ofToken: (nodes at: 2).
	result type: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFileType2: nodes [
	| result |
	result := DelphiFileTypeNode new.
	result fileToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFinalizationSection2: nodes [
	| result |
	result := DelphiFinalizationSectionNode new.
	result finalizationToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	result addTokens: ((nodes at: 2) at: 2) to: result semicolons.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFinally2: nodes [
	| result |
	result := DelphiFinallyNode new.
	result finallyToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	result addTokens: ((nodes at: 2) at: 2) to: result semicolons.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForForInStatement1: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	result at: 6 put: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForForStatement1: nodes [
	| result |
	result := Array new: 8.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	result at: 6 put: (nodes at: 6).
	result at: 7 put: (nodes at: 7).
	result at: 8 put: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFullModuleName1: nodes [
	| result |
	result := DelphiModuleNameNode new.
	result addToken: (nodes at: 1) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFullModuleName2: nodes [
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result periods.
	result addToken: (nodes at: 3) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFunctionDefinition1: nodes [
	| result |
	result := DelphiFunctionDefinitionNode new.
	result header: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result definitions.
	result block: ((nodes at: 2) at: 2).
	result semicolon: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForFunctionDefinition2: nodes [
	| result |
	result := DelphiFunctionDefinitionNode new.
	result header: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForGotoStatement1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForGuid2: nodes [
	| result |
	result := DelphiGuidNode new.
	result left: (nodes at: 1).
	result string: (nodes at: 2).
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForIfStatement1: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForImplementationCode2: nodes [
	| result |
	result := DelphiImplementationCodeNode new.
	result beginToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	result addTokens: ((nodes at: 2) at: 2) to: result semicolons.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForImplementationSection2: nodes [
	| result |
	result := DelphiImplementationSectionNode new.
	result implementationToken: (nodes at: 1).
	result usesToken: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result moduleNames.
	result addTokens: ((nodes at: 2) at: 3) to: result inTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result filenames.
	result addTokens: ((nodes at: 2) at: 5) to: result commas.
	result semicolon: ((nodes at: 2) at: 6).
	result addNodes: (nodes at: 3) to: result definitions.
	result code: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForImplicitClassSection1: nodes [
	| result |
	result := DelphiImplicitClassSectionNode new.
	result addNodes: (nodes at: 1) to: result components.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInheritedFunctionCall1: nodes [
	| result |
	result := DelphiInheritedFunctionCallNode new.
	result inheritedToken: (nodes at: 1).
	result name: (nodes at: 2).
	result left: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result arguments.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result right: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInheritedFunctionCall2: nodes [
	| result |
	result := DelphiInheritedFunctionCallNode new.
	result inheritedToken: (nodes at: 1).
	result name: (nodes at: 2).
	result left: (nodes at: 3).
	result right: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInheritedFunctionCall3: nodes [
	| result |
	result := DelphiInheritedFunctionCallNode new.
	result inheritedToken: (nodes at: 1).
	result name: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInheritedFunctionCall4: nodes [
	| result |
	result := DelphiInheritedFunctionCallNode new.
	result inheritedToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInitializationSection2: nodes [
	| result |
	result := DelphiInitializationSectionNode new.
	result initializationToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	result addTokens: ((nodes at: 2) at: 2) to: result semicolons.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInstantiatedGenericTypeArguments1: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	result at: 4 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInstantiatedGenericVariableExpression1: nodes [
	| result |
	result := DelphiInstantiatedGenericVariableExpressionNode new.
	result name: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result typeArguments.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result right: ((nodes at: 2) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInterfaceFunctionAssignment1: nodes [
	| result |
	result := DelphiInterfaceFunctionAssignmentNode new.
	result function: (nodes at: 1).
	result qualifiedName: (nodes at: 2).
	result equalToken: (nodes at: 3).
	result name: (nodes at: 4).
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInterfaceProcedureAssignment1: nodes [
	| result |
	result := DelphiInterfaceProcedureAssignmentNode new.
	result procedureToken: (nodes at: 1).
	result qualifiedName: (nodes at: 2).
	result equalToken: (nodes at: 3).
	result name: (nodes at: 4).
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInterfaceSection2: nodes [
	| result |
	result := DelphiInterfaceSectionNode new.
	result interfaceToken: (nodes at: 1).
	result usesToken: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result moduleNames.
	result addTokens: ((nodes at: 2) at: 3) to: result inTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result filenames.
	result addTokens: ((nodes at: 2) at: 5) to: result commas.
	result semicolon: ((nodes at: 2) at: 6).
	result addNodes: (nodes at: 3) to: result values.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInterfaceType1: nodes [
	| result |
	result := DelphiInterfaceTypeNode new.
	result interfaceToken: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result superclasses.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result right: ((nodes at: 2) at: 4).
	result guid: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result components.
	result endToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForInterfaceType2: nodes [
	| result |
	result := DelphiInterfaceTypeNode new.
	result interfaceToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForLabeledStatement1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForLabels1: nodes [
	| result |
	result := DelphiLabelVariableNode new.
	result labelToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result names.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForLibraryExport1: nodes [
	| result |
	result := DelphiLibraryExportNode new.
	result exportsToken: (nodes at: 1).
	result name: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForLibraryFile1: nodes [
	| result |
	result := Array new: 12.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 3 put: ((nodes at: 1) at: 3).
	self add: ((nodes at: 1) at: 4) to: (result at: 4).
	result at: 5 put: ((nodes at: 2) at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 9).
	self add: ((nodes at: 2) at: 6) to: (result at: 4).
	self addAll: (nodes at: 3) to: (result at: 10).
	result at: 11 put: (nodes at: 4).
	result at: 12 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForMainMethod1: nodes [
	| result |
	result := DelphiMainMethodDefinitionNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result definitions.
	result block: ((nodes at: 1) at: 2).
	result semicolon: ((nodes at: 1) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForMemExpression2: nodes [
	| result |
	result := DelphiMemExpressionNode new.
	result mem: (nodes at: 1).
	result leftBrace: (nodes at: 2).
	result baseExpression: (nodes at: 3).
	result colon: (nodes at: 4).
	result addressExpression: (nodes at: 5).
	result rightBrace: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForMetaclassType1: nodes [
	| result |
	result := DelphiMetaclassTypeNode new.
	result classToken: (nodes at: 1).
	result ofToken: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForMethodArgument2: nodes [
	| result |
	result := DelphiFormattedMethodArgumentNode new.
	result argument: (nodes at: 1).
	result colon: (nodes at: 2).
	result formatExpression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForMethodAttribute1: nodes [
	| result |
	result := DelphiMethodAttributeNode new.
	result left: (nodes at: 1).
	result expression: (nodes at: 2).
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForMethodComponents1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	self addAll: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForMethodVariables1: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForMethodVariables2: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNamedDefinedType1: nodes [
	| result |
	result := DelphiNamedDefinedTypeNode new.
	result name: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result
		addTokens: ((nodes at: 2) at: 2)
		to: result genericTypeArguments.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result right: ((nodes at: 2) at: 4).
	result equalToken: (nodes at: 3).
	result type: ((nodes at: 4) at: 1).
	result modifier: ((nodes at: 4) at: 2).
	result semicolon: ((nodes at: 4) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNewClassComponent1: nodes [
	| result |
	result := DelphiVariableDefinitionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result names.
	result addTokens: ((nodes at: 1) at: 2) to: result commas.
	result colon: (nodes at: 2).
	result type: (nodes at: 3).
	result modifier: (nodes at: 4).
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNewClassComponent2: nodes [
	| result |
	result := DelphiClassVarsNode new.
	result classToken: (nodes at: 1).
	result varToken: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result variableDefinitions.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNewClassMethodComponent1: nodes [
	| result |
	result := nodes at: 2.
	result attribute: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNewClassType1: nodes [
	| result |
	result := DelphiNewClassTypeNode new.
	result classToken: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result classAttributes.
	result left: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result superclasses.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result right: ((nodes at: 3) at: 4).
	result implicitClassSection: (nodes at: 4).
	result addNodes: (nodes at: 5) to: result sections.
	result endToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNewClassType2: nodes [
	| result |
	result := DelphiNewClassTypeNode new.
	result classToken: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result classAttributes.
	result left: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result superclasses.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result right: ((nodes at: 3) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNonExternalClassOperatorHeader1: nodes [
	| result |
	result := DelphiClassOperatorHeaderNode new.
	result classToken: (nodes at: 1).
	result operatorToken: (nodes at: 2).
	result qualifiedName: (nodes at: 3).
	result left: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result arguments.
	result addTokens: ((nodes at: 4) at: 3) to: result semicolons.
	result right: ((nodes at: 4) at: 4).
	result colon: ((nodes at: 5) at: 1).
	result type: ((nodes at: 5) at: 2).
	result addToken: (nodes at: 6) to: result semicolons.
	result addNodes: (nodes at: 7) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNonExternalConstructorHeader1: nodes [
	| result |
	result := DelphiConstructorHeaderNode new.
	result constructorToken: (nodes at: 1).
	result qualifiedName: (nodes at: 2).
	result left: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result arguments.
	result addTokens: ((nodes at: 3) at: 3) to: result semicolons.
	result right: ((nodes at: 3) at: 4).
	result addToken: (nodes at: 4) to: result semicolons.
	result addNodes: (nodes at: 5) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNonExternalDestructorHeader1: nodes [
	| result |
	result := DelphiDestructorHeaderNode new.
	result destructorToken: (nodes at: 1).
	result qualifiedName: (nodes at: 2).
	result left: ((nodes at: 3) at: 1).
	result right: ((nodes at: 3) at: 2).
	result semicolon: (nodes at: 4).
	result addNodes: (nodes at: 5) to: result modifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNonExternalFunctionHeaderVars1: nodes [
	| result |
	result := Array new: 9.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: ((nodes at: 3) at: 1).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 5).
	result at: 6 put: ((nodes at: 3) at: 4).
	result at: 7 put: ((nodes at: 4) at: 1).
	result at: 8 put: ((nodes at: 4) at: 2).
	self add: (nodes at: 5) to: (result at: 5).
	self addAll: (nodes at: 6) to: (result at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNonExternalMethodModifier2: nodes [
	| result |
	result := DelphiMessageMethodModifierNode new.
	result modifier: (nodes at: 1).
	result expression: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNonExternalProcedureHeaderVars1: nodes [
	| result |
	result := Array new: 7.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: ((nodes at: 3) at: 1).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 5).
	result at: 6 put: ((nodes at: 3) at: 4).
	self add: (nodes at: 4) to: (result at: 5).
	self addAll: (nodes at: 5) to: (result at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForNumber1: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForOldClassType1: nodes [
	| result |
	result := DelphiOldClassTypeNode new.
	result objectToken: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result superclasses.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result right: ((nodes at: 2) at: 4).
	result implicitClassSection: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result sections.
	result endToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForOnDo1: nodes [
	| result |
	result := DelphiOnDoNode new.
	result onToken: (nodes at: 1).
	result exception: (nodes at: 2).
	result colon: ((nodes at: 3) at: 1).
	result type: ((nodes at: 3) at: 2).
	result doToken: (nodes at: 4).
	result addNodes: ((nodes at: 5) at: 1) to: result statements.
	result addTokens: ((nodes at: 5) at: 2) to: result semicolons.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForOptionalArguments1: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForOptionalRaiseAt1: nodes [
	| result |
	result := Array new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPossibleExceptElse2: nodes [
	| result |
	result := DelphiExceptElseNode new.
	result elseToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	result addTokens: ((nodes at: 2) at: 2) to: result semicolons.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPrivateClassSection1: nodes [
	| result |
	result := DelphiPrivateClassSectionNode new.
	result strictToken: (nodes at: 1).
	result privateToken: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result components.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPrivateClassSection2: nodes [
	| result |
	result := DelphiPrivateClassSectionNode new.
	result privateToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result components.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForProcedureDefinition1: nodes [
	| result |
	result := DelphiProcedureDefinitionNode new.
	result header: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result definitions.
	result block: ((nodes at: 2) at: 2).
	result semicolon: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForProcedureDefinition2: nodes [
	| result |
	result := DelphiProcedureDefinitionNode new.
	result header: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForProgramFile1: nodes [
	| result |
	result := Array new: 11.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 3 put: ((nodes at: 1) at: 3).
	self add: ((nodes at: 1) at: 4) to: (result at: 4).
	result at: 5 put: ((nodes at: 2) at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 9).
	self add: ((nodes at: 2) at: 6) to: (result at: 4).
	result at: 10 put: (nodes at: 3).
	result at: 11 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForProgramFile2: nodes [
	| result |
	result := Array new: 11.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 5 put: ((nodes at: 1) at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 9).
	self add: ((nodes at: 1) at: 6) to: (result at: 4).
	result at: 10 put: (nodes at: 2).
	result at: 11 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyArrayAccessors2: nodes [
	| result |
	result := DelphiPropertyArrayAccessorsNode new.
	result left: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result arguments.
	result addTokens: ((nodes at: 2) at: 2) to: result semicolons.
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyDefault1: nodes [
	| result |
	result := DelphiPropertyDefaultNode new.
	result defaultToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyDefault2: nodes [
	| result |
	result := DelphiPropertyDefaultNode new.
	result defaultToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyDefault3: nodes [
	| result |
	result := DelphiPropertyDefaultNode new.
	result nodefaultToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyDispid1: nodes [
	| result |
	result := DelphiPropertyDispidNode new.
	result dispidToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyDispid2: nodes [
	| result |
	result := DelphiPropertyDispidNode new.
	result readOnlyToken: (nodes at: 1).
	result dispidToken: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyDispid3: nodes [
	| result |
	result := DelphiPropertyDispidNode new.
	result writeOnlyToken: (nodes at: 1).
	result dispidToken: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyHeader1: nodes [
	| result |
	result := DelphiPropertyHeaderNode new.
	result propertyToken: ((nodes at: 1) at: 1).
	result name: ((nodes at: 1) at: 2).
	result arrayAccessors: ((nodes at: 1) at: 3).
	result colon: ((nodes at: 1) at: 4).
	result type: ((nodes at: 1) at: 5).
	result addNodes: ((nodes at: 1) at: 6) to: result indexes.
	result addNodes: ((nodes at: 1) at: 7) to: result readers.
	result addNodes: ((nodes at: 1) at: 8) to: result writers.
	result addNodes: ((nodes at: 1) at: 9) to: result defaults.
	result addNodes: ((nodes at: 1) at: 10) to: result storeds.
	result addNodes: ((nodes at: 1) at: 11) to: result implementses.
	result addNodes: ((nodes at: 1) at: 12) to: result dispids.
	result semicolon: ((nodes at: 1) at: 13).
	result modifier: ((nodes at: 1) at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyHeaderVars1: nodes [
	| result |
	result := Array new: 14.
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: ((nodes at: 4) at: 1).
	result at: 5 put: ((nodes at: 4) at: 2).
	self addAll: ((nodes at: 5) at: 1) to: (result at: 6).
	self addAll: ((nodes at: 5) at: 2) to: (result at: 7).
	self addAll: ((nodes at: 5) at: 3) to: (result at: 8).
	self addAll: ((nodes at: 5) at: 4) to: (result at: 9).
	self addAll: ((nodes at: 5) at: 5) to: (result at: 10).
	self addAll: ((nodes at: 5) at: 6) to: (result at: 11).
	self addAll: ((nodes at: 5) at: 7) to: (result at: 12).
	result at: 13 put: (nodes at: 6).
	result at: 14 put: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyImplements1: nodes [
	| result |
	result := DelphiPropertyImplementsNode new.
	result implementsToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result interfaces.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyIndex1: nodes [
	| result |
	result := DelphiPropertyIndexNode new.
	result indexToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyModifiers2: nodes [
	| result |
	result := DelphiPropertyModifierNode new.
	result defaultToken: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyReader1: nodes [
	| result |
	result := DelphiPropertyReaderNode new.
	result readToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyStored1: nodes [
	| result |
	result := DelphiPropertyStoredNode new.
	result storedToken: (nodes at: 1).
	result isStored: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyValues1: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyValues2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyValues4: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyValues5: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyValues6: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyValues7: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyValues8: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPropertyWriter1: nodes [
	| result |
	result := DelphiPropertyWriterNode new.
	result writeToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForProtectedClassSection1: nodes [
	| result |
	result := DelphiProtectedClassSectionNode new.
	result strictToken: (nodes at: 1).
	result protectedToken: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result components.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForProtectedClassSection2: nodes [
	| result |
	result := DelphiProtectedClassSectionNode new.
	result protectedToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result components.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPublicClassSection1: nodes [
	| result |
	result := DelphiPublicClassSectionNode new.
	result publicToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result components.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForPublishedClassSection1: nodes [
	| result |
	result := DelphiPublishedClassSectionNode new.
	result publishedToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result components.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForQualifiedName1: nodes [
	| result |
	result := DelphiQualifiedNameNode new.
	result name: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result
		addTokens: ((nodes at: 2) at: 2)
		to: result genericTypeArguments.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result right: ((nodes at: 2) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForQualifiedName2: nodes [
	| result |
	result := DelphiQualifiedNameNode new.
	result namespace: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result
		addTokens: ((nodes at: 2) at: 2)
		to: result genericTypeArguments.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result right: ((nodes at: 2) at: 4).
	result period: (nodes at: 3).
	result name: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForRaiseStatement1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: ((nodes at: 3) at: 1).
	result at: 4 put: ((nodes at: 3) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForRaiseStatement2: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForRangeType1: nodes [
	| result |
	result := DelphiRangeTypeNode new.
	result startValue: (nodes at: 1).
	result dots: (nodes at: 2).
	result endValue: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForRecordFieldList1: nodes [
	| result |
	result := Array new: 8.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: (nodes at: 2) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForRecordFieldList2: nodes [
	| result |
	result := Array new: 8.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: (nodes at: 2) to: (result at: 1).
	result at: 2 put: ((nodes at: 3) at: 1).
	result at: 3 put: ((nodes at: 3) at: 2).
	result at: 4 put: ((nodes at: 3) at: 3).
	result at: 5 put: ((nodes at: 3) at: 4).
	result at: 6 put: ((nodes at: 3) at: 5).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForRecordType1: nodes [
	| result |
	result := DelphiRecordTypeNode new.
	result packedToken: (nodes at: 1).
	result recordToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result sections.
	result caseToken: ((nodes at: 3) at: 2).
	result value: ((nodes at: 3) at: 3).
	result colon: ((nodes at: 3) at: 4).
	result type: ((nodes at: 3) at: 5).
	result ofToken: ((nodes at: 3) at: 6).
	result addNodes: ((nodes at: 3) at: 7) to: result variantTypes.
	result addTokens: ((nodes at: 3) at: 8) to: result semicolons.
	result endToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForResource1: nodes [
	| result |
	result := DelphiResourceStringDefinitionNode new.
	result name: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result value: (nodes at: 3).
	result deprecatedToken: (nodes at: 4).
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForResourceStringList1: nodes [
	| result |
	result := DelphiResourceStringListNode new.
	result resourceStringToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result definitions.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSetConstructor1: nodes [
	| result |
	result := DelphiSetExpressionNode new.
	result left: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result values.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSetConstructor2: nodes [
	| result |
	result := DelphiSetExpressionNode new.
	result left: (nodes at: 1).
	result right: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSetConstructorValues1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSetConstructorValues2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSetType1: nodes [
	| result |
	result := DelphiExpressionSetTypeNode new.
	result setToken: (nodes at: 1).
	result ofToken: (nodes at: 2).
	result setValue: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSetType2: nodes [
	| result |
	result := DelphiRangeSetTypeNode new.
	result setToken: (nodes at: 1).
	result ofToken: (nodes at: 2).
	result setValue: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSetType3: nodes [
	| result |
	result := DelphiValuesSetTypeNode new.
	result setToken: (nodes at: 1).
	result ofToken: (nodes at: 2).
	result left: (nodes at: 3).
	result addTokens: ((nodes at: 4) at: 1) to: result names.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result right: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSetValue1: nodes [
	| result |
	result := DelphiSingleSetValueNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSetValue2: nodes [
	| result |
	result := DelphiRangeSetValueNode new.
	result fromValue: (nodes at: 1).
	result dots: (nodes at: 2).
	result toValue: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSimpleDefinedType11: nodes [
	| result |
	result := DelphiTypeTypeNode new.
	result typeToken: (nodes at: 1).
	result typeName: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSimpleDefinedType1: nodes [
	| result |
	result := DelphiNamedTypeNode new.
	result typeExpression: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSimpleDefinedType2: nodes [
	| result |
	result := DelphiPointerTypeNode new.
	result upArrowToken: (nodes at: 1).
	result type: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSimpleDefinedType5: nodes [
	| result |
	result := DelphiInstantiatedGenericTypeNode new.
	result type: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result typeArguments.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result right: ((nodes at: 2) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSimpleDefinedType6: nodes [
	| result |
	result := DelphiSimpleArrayTypeNode new.
	result type: (nodes at: 1).
	result left: (nodes at: 2).
	result bounds: (nodes at: 3).
	result right: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForSimpleDefinedType8: nodes [
	| result |
	result := DelphiAbsoluteTypeNode new.
	result type: (nodes at: 1).
	result absoluteToken: (nodes at: 2).
	result variable: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement10: nodes [
	| result |
	result := DelphiWhileStatementNode new.
	result whileToken: ((nodes at: 1) at: 1).
	result expression: ((nodes at: 1) at: 2).
	result doToken: ((nodes at: 1) at: 3).
	result statement: ((nodes at: 1) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement11: nodes [
	| result |
	result := DelphiGotoStatementNode new.
	result gotoToken: ((nodes at: 1) at: 1).
	result label: ((nodes at: 1) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement13: nodes [
	| result |
	result := DelphiLabeledStatementNode new.
	result label: ((nodes at: 1) at: 1).
	result colon: ((nodes at: 1) at: 2).
	result statement: ((nodes at: 1) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement14: nodes [
	| result |
	result := DelphiEmptyStatementNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement2: nodes [
	| result |
	result := DelphiRepeatStatementNode new.
	result repeatToken: ((nodes at: 1) at: 1).
	result addNodes: ((nodes at: 1) at: 2) to: result statements.
	result addTokens: ((nodes at: 1) at: 3) to: result semicolons.
	result untilToken: ((nodes at: 1) at: 4).
	result expression: ((nodes at: 1) at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement3: nodes [
	| result |
	result := DelphiIfStatementNode new.
	result ifToken: ((nodes at: 1) at: 1).
	result expression: ((nodes at: 1) at: 2).
	result thenToken: ((nodes at: 1) at: 3).
	result thenStatement: ((nodes at: 1) at: 4).
	result elseToken: ((nodes at: 1) at: 5).
	result elseStatement: ((nodes at: 1) at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement4: nodes [
	| result |
	result := DelphiWithStatementNode new.
	result withToken: ((nodes at: 1) at: 1).
	result addNodes: ((nodes at: 1) at: 2) to: result expressions.
	result addTokens: ((nodes at: 1) at: 3) to: result commas.
	result doToken: ((nodes at: 1) at: 4).
	result statement: ((nodes at: 1) at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement5: nodes [
	| result |
	result := DelphiTryStatementNode new.
	result tryToken: ((nodes at: 1) at: 1).
	result addNodes: ((nodes at: 1) at: 2) to: result statements.
	result addTokens: ((nodes at: 1) at: 3) to: result semicolons.
	result except: ((nodes at: 1) at: 4).
	result finally: ((nodes at: 1) at: 5).
	result endToken: ((nodes at: 1) at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement6: nodes [
	| result |
	result := DelphiCaseStatementNode new.
	result caseToken: ((nodes at: 1) at: 1).
	result expression: ((nodes at: 1) at: 2).
	result ofToken: ((nodes at: 1) at: 3).
	result addNodes: ((nodes at: 1) at: 4) to: result options.
	result addTokens: ((nodes at: 1) at: 5) to: result semicolons.
	result elseToken: ((nodes at: 1) at: 6).
	result addNodes: ((nodes at: 1) at: 7) to: result statements.
	result endToken: ((nodes at: 1) at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement7: nodes [
	| result |
	result := DelphiRaiseStatementNode new.
	result raiseToken: ((nodes at: 1) at: 1).
	result expression: ((nodes at: 1) at: 2).
	result atToken: ((nodes at: 1) at: 3).
	result location: ((nodes at: 1) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement8: nodes [
	| result |
	result := DelphiForStatementNode new.
	result forToken: ((nodes at: 1) at: 1).
	result variable: ((nodes at: 1) at: 2).
	result assignmentToken: ((nodes at: 1) at: 3).
	result fromExpr: ((nodes at: 1) at: 4).
	result toToken: ((nodes at: 1) at: 5).
	result toExpr: ((nodes at: 1) at: 6).
	result doToken: ((nodes at: 1) at: 7).
	result statement: ((nodes at: 1) at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatement9: nodes [
	| result |
	result := DelphiForInStatementNode new.
	result forToken: ((nodes at: 1) at: 1).
	result variable: ((nodes at: 1) at: 2).
	result inToken: ((nodes at: 1) at: 3).
	result fromExpr: ((nodes at: 1) at: 4).
	result doToken: ((nodes at: 1) at: 5).
	result statement: ((nodes at: 1) at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForStatementBlock1: nodes [
	| result |
	result := DelphiStatementBlockNode new.
	result beginToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	result addTokens: ((nodes at: 2) at: 2) to: result semicolons.
	result endToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForTryStatement1: nodes [
	| result |
	result := Array new: 6.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	result at: 4 put: (nodes at: 3).
	result at: 5 put: (nodes at: 4).
	result at: 6 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForTwoItemSetNameList1: nodes [
	| result |
	result := nodes at: 3.
	self addFirst: (nodes at: 1) to: (result at: 1).
	self addFirst: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForUnitFile1: nodes [
	| result |
	result := Array new: 10.
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 3 put: ((nodes at: 1) at: 3).
	result at: 4 put: ((nodes at: 1) at: 4).
	result at: 5 put: (nodes at: 2).
	result at: 6 put: (nodes at: 3).
	result at: 7 put: (nodes at: 4).
	result at: 8 put: (nodes at: 5).
	result at: 9 put: ((nodes at: 6) at: 1).
	result at: 10 put: ((nodes at: 6) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForUnitFile2: nodes [
	| result |
	result := Array new: 10.
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 3 put: ((nodes at: 1) at: 3).
	result at: 4 put: ((nodes at: 1) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForUnitLine1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForUsesList1: nodes [
	| result |
	result := Array new: 6.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForUsesList2: nodes [
	| result |
	result := Array new: 6.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	result at: 6 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForUsesModule1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForUsesModuleList1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	self add: ((nodes at: 1) at: 3) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForUsesModuleList2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 4).
	self add: ((nodes at: 3) at: 1) to: (result at: 1).
	self add: ((nodes at: 3) at: 2) to: (result at: 2).
	self add: ((nodes at: 3) at: 3) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForVariable1: nodes [
	| result |
	result := DelphiVariableNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result names.
	result addTokens: ((nodes at: 1) at: 2) to: result commas.
	result colon: (nodes at: 2).
	result type: (nodes at: 3).
	result modifier: (nodes at: 4).
	result equal: ((nodes at: 5) at: 1).
	result value: ((nodes at: 5) at: 2).
	result semicolon: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForVariableExpression1: nodes [
	| result |
	result := DelphiVariableExpressionNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForVariantRecordPart1: nodes [
	| result |
	result := Array new: 7.
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: ((nodes at: 3) at: 1).
	result at: 4 put: ((nodes at: 3) at: 2).
	result at: 5 put: (nodes at: 4).
	self addAll: ((nodes at: 5) at: 1) to: (result at: 6).
	self addAll: ((nodes at: 5) at: 2) to: (result at: 7).
	self add: (nodes at: 6) to: (result at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForVariantType1: nodes [
	| result |
	result := DelphiVariantTypeNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result names.
	result addTokens: ((nodes at: 1) at: 2) to: result commas.
	result addToken: (nodes at: 2) to: result colons.
	result left: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result sections.
	result caseToken: ((nodes at: 4) at: 2).
	result value: ((nodes at: 4) at: 3).
	result addToken: ((nodes at: 4) at: 4) to: result colons.
	result type: ((nodes at: 4) at: 5).
	result ofToken: ((nodes at: 4) at: 6).
	result addNodes: ((nodes at: 4) at: 7) to: result variantTypes.
	result addTokens: ((nodes at: 4) at: 8) to: result semicolons.
	result right: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForVars1: nodes [
	| result |
	result := DelphiVarsNode new.
	result varToken: ((nodes at: 1) at: 1).
	result addNodes: ((nodes at: 1) at: 2) to: result variableDefinitions.
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForVarsVars2: nodes [
	| result |
	result := Array new: 2.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
DelphiParser >> reduceActionForWithStatement1: nodes [
	| result |
	result := Array new: 5.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	result at: 4 put: (nodes at: 3).
	result at: 5 put: (nodes at: 4).
	^ result
]

{ #category : #generated }
DelphiParser >> reduceTable [
^#(
	#(148 0 #reduceActionForUsesList1:) 
	#(353 0 #reduceActionForBeforeAsm1:) 
	#(366 0 #reduceActionForStatement14:) 
	#(211 0 #nil) 
	#(195 0 #nil) 
	#(368 1 #reduceActionForFile2:) 
	#(368 1 #reduceActionForFile3:) 
	#(319 0 #reduceActionForMethodVariables2:) 
	#(156 0 #nil) 
	#(183 1 #reduceActionForUnitFile2:) 
	#(368 1 #reduceActionForFile1:) 
	#(356 1 #reduceActionForInheritedFunctionCall4:) 
	#(330 1 #reduceActionForRaiseStatement2:) 
	#(350 1 #reduceActionForVariableExpression1:) 
	#(222 1 #reduceActionForNumber1:) 
	#(224 1 #reduceActionForNumber1:) 
	#(292 1 #reduceActionForExpression10:) 
	#(292 1 #reduceActionForNumber1:) 
	#(366 1 #reduceActionForNumber1:) 
	#(366 1 #reduceActionForStatement2:) 
	#(366 1 #reduceActionForStatement3:) 
	#(366 1 #reduceActionForStatement4:) 
	#(366 1 #reduceActionForStatement5:) 
	#(366 1 #reduceActionForStatement6:) 
	#(366 1 #reduceActionForStatement7:) 
	#(366 1 #reduceActionForStatement8:) 
	#(366 1 #reduceActionForStatement9:) 
	#(366 1 #reduceActionForStatement10:) 
	#(366 1 #reduceActionForStatement11:) 
	#(366 1 #reduceActionForStatement13:) 
	#(320 1 #reduceActionForNumber1:) 
	#(211 1 #reduceActionForNumber1:) 
	#(205 0 #reduceActionForOptionalArguments1:) 
	#(229 0 #reduceActionForConstantArray2:) 
	#(200 1 #reduceActionForFileType2:) 
	#(176 1 #reduceActionForVariableExpression1:) 
	#(195 1 #reduceActionForVariableExpression1:) 
	#(176 1 #reduceActionForExpression10:) 
	#(221 1 #reduceActionForNumber1:) 
	#(196 1 #reduceActionForNumber1:) 
	#(185 1 #reduceActionForSimpleDefinedType1:) 
	#(185 1 #reduceActionForNumber1:) 
	#(176 1 #reduceActionForNumber1:) 
	#(181 0 #reduceActionForOptionalArguments1:) 
	#(161 1 #reduceActionForFullModuleName1:) 
	#(164 1 #reduceActionForUsesModule1:) 
	#(163 1 #reduceActionForUsesModuleList1:) 
	#(150 0 #nil) 
	#(149 1 #reduceActionForMainMethod1:) 
	#(152 0 #reduceActionForMethodVariables2:) 
	#(157 0 #nil) 
	#(292 2 #reduceActionForExpression16:) 
	#(292 2 #reduceActionForExpression15:) 
	#(227 2 #reduceActionForSetConstructor2:) 
	#(361 1 #reduceActionForSetValue1:) 
	#(360 1 #reduceActionForSetConstructorValues1:) 
	#(336 1 #reduceActionForSetConstructorValues1:) 
	#(337 0 #nil) 
	#(305 1 #reduceActionForSetConstructorValues1:) 
	#(334 2 #reduceActionForGotoStatement1:) 
	#(356 2 #reduceActionForInheritedFunctionCall3:) 
	#(349 0 #reduceActionForOptionalRaiseAt1:) 
	#(292 2 #reduceActionForExpression17:) 
	#(292 2 #reduceActionForExpression18:) 
	#(354 2 #reduceActionForInstantiatedGenericVariableExpression1:) 
	#(223 1 #reduceActionForNumber1:) 
	#(357 1 #reduceActionForNumber1:) 
	#(292 2 #reduceActionForExpression20:) 
	#(292 2 #reduceActionForExpression14:) 
	#(208 0 #reduceActionForArgumentList1:) 
	#(301 0 #nil) 
	#(206 0 #reduceActionForOptionalRaiseAt1:) 
	#(176 2 #reduceActionForExpression16:) 
	#(176 2 #reduceActionForExpression15:) 
	#(231 1 #reduceActionForUsesModule1:) 
	#(217 0 #nil) 
	#(229 1 #reduceActionForConstantArray1:) 
	#(230 1 #reduceActionForUsesModuleList1:) 
	#(228 1 #reduceActionForConstantArray1:) 
	#(232 1 #reduceActionForSetConstructorValues1:) 
	#(185 2 #reduceActionForSimpleDefinedType11:) 
	#(176 2 #reduceActionForExpression17:) 
	#(176 2 #reduceActionForExpression18:) 
	#(185 2 #reduceActionForSimpleDefinedType2:) 
	#(185 2 #reduceActionForSimpleDefinedType5:) 
	#(237 0 #reduceActionForMethodVariables2:) 
	#(258 0 #reduceActionForOptionalArguments1:) 
	#(148 3 #reduceActionForUsesList2:) 
	#(150 1 #reduceActionForNumber1:) 
	#(144 3 #reduceActionForProgramFile2:) 
	#(321 1 #reduceActionForNumber1:) 
	#(172 1 #reduceActionForVars1:) 
	#(309 1 #reduceActionForProcedureDefinition2:) 
	#(311 1 #reduceActionForFunctionDefinition2:) 
	#(271 1 #reduceActionForExternalProcedureHeader1:) 
	#(272 1 #reduceActionForExternalProcedureHeader1:) 
	#(275 1 #reduceActionForExternalFunctionHeader1:) 
	#(276 1 #reduceActionForExternalFunctionHeader1:) 
	#(319 2 #reduceActionForMethodVariables1:) 
	#(162 0 #reduceActionForMethodVariables2:) 
	#(158 0 #nil) 
	#(227 3 #reduceActionForSetConstructor1:) 
	#(292 3 #reduceActionForExpression12:) 
	#(338 0 #nil) 
	#(320 3 #reduceActionForStatementBlock1:) 
	#(330 3 #reduceActionForRaiseStatement1:) 
	#(335 3 #reduceActionForLabeledStatement1:) 
	#(204 1 #reduceActionForSetConstructorValues1:) 
	#(292 3 #reduceActionForExpression13:) 
	#(362 1 #reduceActionForSetConstructorValues1:) 
	#(292 3 #reduceActionForExpression4:) 
	#(292 3 #reduceActionForExpression6:) 
	#(363 1 #reduceActionForNumber1:) 
	#(355 1 #reduceActionForSetConstructorValues1:) 
	#(292 3 #reduceActionForExpression11:) 
	#(352 3 #reduceActionForAsmBlock1:) 
	#(201 3 #reduceActionForSetType1:) 
	#(201 3 #reduceActionForSetType2:) 
	#(301 1 #reduceActionForNumber1:) 
	#(208 1 #reduceActionForConstantArray1:) 
	#(299 1 #reduceActionForSetConstructorValues1:) 
	#(217 1 #reduceActionForNumber1:) 
	#(176 3 #reduceActionForConstantExpression11:) 
	#(200 3 #reduceActionForFileType1:) 
	#(203 2 #reduceActionForQualifiedName1:) 
	#(176 3 #reduceActionForExpression4:) 
	#(226 1 #reduceActionForSetConstructorValues1:) 
	#(176 3 #reduceActionForExpression11:) 
	#(195 3 #reduceActionForExpression4:) 
	#(185 3 #reduceActionForSimpleDefinedType8:) 
	#(214 0 #reduceActionForMethodVariables2:) 
	#(213 1 #reduceActionForImplicitClassSection1:) 
	#(202 3 #reduceActionForRangeType1:) 
	#(225 1 #reduceActionForSetConstructorValues1:) 
	#(164 3 #reduceActionForLabeledStatement1:) 
	#(161 3 #reduceActionForFullModuleName2:) 
	#(163 3 #reduceActionForUsesModuleList2:) 
	#(155 4 #reduceActionForUnitLine1:) 
	#(147 4 #reduceActionForUnitLine1:) 
	#(151 4 #reduceActionForUnitLine1:) 
	#(144 4 #reduceActionForProgramFile1:) 
	#(175 0 #reduceActionForOptionalRaiseAt1:) 
	#(169 2 #reduceActionForConstantValueList1:) 
	#(173 1 #reduceActionForConstantValues1:) 
	#(180 1 #reduceActionForConstantValues1:) 
	#(167 2 #reduceActionForDefinedTypeList1:) 
	#(245 1 #reduceActionForSetConstructorValues1:) 
	#(246 2 #reduceActionForVarsVars2:) 
	#(323 1 #reduceActionForConstantValues1:) 
	#(309 2 #reduceActionForProcedureDefinition1:) 
	#(311 2 #reduceActionForFunctionDefinition1:) 
	#(207 0 #reduceActionForMethodVariables2:) 
	#(154 3 #reduceActionForMethodComponents1:) 
	#(152 2 #reduceActionForMethodVariables1:) 
	#(156 3 #reduceActionForInterfaceSection2:) 
	#(303 0 #reduceActionForMethodVariables2:) 
	#(159 0 #nil) 
	#(347 1 #reduceActionForBaseCaseLabel1:) 
	#(343 0 #reduceActionForElseCase1:) 
	#(344 1 #reduceActionForSetConstructorValues1:) 
	#(346 1 #reduceActionForNumber1:) 
	#(348 1 #reduceActionForSetConstructorValues1:) 
	#(361 3 #reduceActionForSetValue2:) 
	#(360 3 #reduceActionForSetConstructorValues2:) 
	#(326 4 #reduceActionForIfStatement1:) 
	#(336 3 #reduceActionForSetConstructorValues2:) 
	#(327 4 #reduceActionForWithStatement1:) 
	#(340 0 #nil) 
	#(339 1 #reduceActionForConstantValues1:) 
	#(305 3 #reduceActionForSetConstructorValues2:) 
	#(325 4 #reduceActionForWithStatement1:) 
	#(356 4 #reduceActionForInheritedFunctionCall2:) 
	#(349 2 #reduceActionForGotoStatement1:) 
	#(333 4 #reduceActionForUnitLine1:) 
	#(199 3 #reduceActionForInstantiatedGenericTypeArguments1:) 
	#(358 3 #reduceActionForInstantiatedGenericTypeArguments1:) 
	#(292 4 #reduceActionForExpression5:) 
	#(205 3 #reduceActionForInstantiatedGenericTypeArguments1:) 
	#(300 2 #reduceActionForArgument2:) 
	#(206 2 #reduceActionForGotoStatement1:) 
	#(233 3 #reduceActionForConstantRecordField1:) 
	#(231 3 #reduceActionForLabeledStatement1:) 
	#(176 4 #reduceActionForConstantExpression10:) 
	#(230 3 #reduceActionForUsesModuleList2:) 
	#(232 3 #reduceActionForSetConstructorValues2:) 
	#(176 4 #reduceActionForExpression5:) 
	#(185 4 #reduceActionForSimpleDefinedType6:) 
	#(198 4 #reduceActionForRecordType1:) 
	#(212 2 #reduceActionForRecordFieldList1:) 
	#(244 1 #reduceActionForNumber1:) 
	#(257 1 #reduceActionForNumber1:) 
	#(237 2 #reduceActionForMethodVariables1:) 
	#(250 1 #reduceActionForNumber1:) 
	#(251 1 #reduceActionForNumber1:) 
	#(247 1 #reduceActionForNumber1:) 
	#(249 1 #reduceActionForNumber1:) 
	#(170 1 #reduceActionForNumber1:) 
	#(254 1 #reduceActionForNumber1:) 
	#(171 1 #reduceActionForNumber1:) 
	#(255 1 #reduceActionForNumber1:) 
	#(256 1 #reduceActionForNumber1:) 
	#(265 1 #reduceActionForPropertyHeader1:) 
	#(260 1 #reduceActionForNumber1:) 
	#(259 1 #reduceActionForSetConstructorValues1:) 
	#(181 3 #reduceActionForInstantiatedGenericTypeArguments1:) 
	#(234 0 #reduceActionForMethodVariables2:) 
	#(261 1 #reduceActionForNumber1:) 
	#(235 0 #reduceActionForOptionalArguments1:) 
	#(165 4 #reduceActionForNamedDefinedType1:) 
	#(182 1 #reduceActionForUsesModule1:) 
	#(187 1 #reduceActionForNumber1:) 
	#(192 1 #reduceActionForInterfaceType2:) 
	#(173 2 #reduceActionForMethodVariables1:) 
	#(180 2 #reduceActionForMethodVariables1:) 
	#(323 2 #reduceActionForMethodVariables1:) 
	#(322 3 #reduceActionForLabels1:) 
	#(297 2 #reduceActionForExternalMethodModifier1:) 
	#(297 2 #reduceActionForExternalMethodModifier6:) 
	#(315 3 #reduceActionForExternalProcedureHeaderVars1:) 
	#(317 3 #reduceActionForExternalFunctionHeaderVars1:) 
	#(145 5 #reduceActionForLibraryFile1:) 
	#(162 2 #reduceActionForMethodVariables1:) 
	#(166 1 #reduceActionForNumber1:) 
	#(304 0 #nil) 
	#(158 2 #reduceActionForInitializationSection2:) 
	#(342 2 #reduceActionForCaseOptionList1:) 
	#(351 1 #reduceActionForNumber1:) 
	#(337 3 #reduceActionForExcept3:) 
	#(337 3 #reduceActionForExcept2:) 
	#(339 2 #reduceActionForMethodVariables1:) 
	#(338 2 #reduceActionForFinally2:) 
	#(328 5 #reduceActionForTryStatement1:) 
	#(356 5 #reduceActionForInheritedFunctionCall1:) 
	#(204 3 #reduceActionForSetConstructorValues2:) 
	#(362 3 #reduceActionForSetConstructorValues2:) 
	#(355 3 #reduceActionForSetConstructorValues2:) 
	#(363 3 #reduceActionForMethodArgument2:) 
	#(201 5 #reduceActionForSetType3:) 
	#(299 3 #reduceActionForSetConstructorValues2:) 
	#(369 5 #reduceActionForAnonymousProcedureType1:) 
	#(203 4 #reduceActionForQualifiedName2:) 
	#(226 3 #reduceActionForSetConstructorValues2:) 
	#(212 3 #reduceActionForRecordFieldList2:) 
	#(214 2 #reduceActionForMethodVariables1:) 
	#(238 1 #reduceActionForNumber1:) 
	#(244 2 #reduceActionForNewClassComponent2:) 
	#(266 2 #reduceActionForClassPropertyHeader1:) 
	#(273 2 #reduceActionForExternalClassProcedureHeader1:) 
	#(274 2 #reduceActionForExternalClassProcedureHeader1:) 
	#(277 2 #reduceActionForExternalClassFunctionHeader1:) 
	#(278 2 #reduceActionForExternalClassFunctionHeader1:) 
	#(282 0 #nil) 
	#(314 0 #reduceActionForOptionalRaiseAt1:) 
	#(250 2 #reduceActionForNewClassMethodComponent1:) 
	#(244 2 #reduceActionForNewClassMethodComponent1:) 
	#(258 3 #reduceActionForInstantiatedGenericTypeArguments1:) 
	#(197 5 #reduceActionForArrayType2:) 
	#(197 5 #reduceActionForArrayType1:) 
	#(225 3 #reduceActionForSetConstructorValues2:) 
	#(189 1 #reduceActionForEnumName1:) 
	#(188 1 #reduceActionForSetConstructorValues1:) 
	#(182 2 #reduceActionForDefinedType2:) 
	#(262 0 #nil) 
	#(295 0 #reduceActionForMethodVariables2:) 
	#(175 2 #reduceActionForGotoStatement1:) 
	#(245 3 #reduceActionForSetConstructorValues2:) 
	#(297 3 #reduceActionForExternalMethodModifier4:) 
	#(298 1 #reduceActionForNumber1:) 
	#(207 2 #reduceActionForMethodVariables1:) 
	#(294 1 #reduceActionForNumber1:) 
	#(153 3 #reduceActionForLibraryExport1:) 
	#(168 2 #reduceActionForResourceStringList1:) 
	#(178 1 #reduceActionForConstantValues1:) 
	#(306 1 #reduceActionForNumber1:) 
	#(307 1 #reduceActionForConstructorDefinition2:) 
	#(308 1 #reduceActionForDestructorDefinition2:) 
	#(310 1 #reduceActionForClassProcedureDefinition2:) 
	#(312 1 #reduceActionForClassFunctionDefinition2:) 
	#(313 1 #reduceActionForClassOperatorDefinition2:) 
	#(157 4 #reduceActionForImplementationSection2:) 
	#(303 2 #reduceActionForMethodVariables1:) 
	#(159 2 #reduceActionForFinalizationSection2:) 
	#(183 6 #reduceActionForUnitFile1:) 
	#(347 3 #reduceActionForBaseCaseLabel2:) 
	#(343 2 #reduceActionForElseCase2:) 
	#(329 6 #reduceActionForCaseStatement1:) 
	#(344 3 #reduceActionForSetConstructorValues2:) 
	#(345 3 #reduceActionForCaseOption1:) 
	#(346 3 #reduceActionForCaseLabel2:) 
	#(348 3 #reduceActionForSetConstructorValues2:) 
	#(332 6 #reduceActionForForInStatement1:) 
	#(326 6 #reduceActionForForInStatement1:) 
	#(340 2 #reduceActionForPossibleExceptElse2:) 
	#(359 6 #reduceActionForMemExpression2:) 
	#(210 1 #reduceActionForSetConstructorValues1:) 
	#(209 3 #reduceActionForTwoItemSetNameList1:) 
	#(302 0 #reduceActionForOptionalRaiseAt1:) 
	#(242 2 #reduceActionForPublishedClassSection1:) 
	#(241 2 #reduceActionForPublicClassSection1:) 
	#(240 2 #reduceActionForProtectedClassSection2:) 
	#(239 2 #reduceActionForPrivateClassSection2:) 
	#(248 3 #reduceActionForMethodAttribute1:) 
	#(267 3 #reduceActionForExternalConstructorHeader1:) 
	#(269 3 #reduceActionForExternalConstructorHeader1:) 
	#(279 3 #reduceActionForExternalConstructorHeader1:) 
	#(259 3 #reduceActionForSetConstructorValues2:) 
	#(193 3 #reduceActionForMetaclassType1:) 
	#(236 1 #reduceActionForNumber1:) 
	#(190 3 #reduceActionForNewClassType2:) 
	#(234 2 #reduceActionForMethodVariables1:) 
	#(243 1 #reduceActionForSetConstructorValues1:) 
	#(184 3 #reduceActionForEnumType1:) 
	#(182 3 #reduceActionForLabeledStatement1:) 
	#(263 0 #reduceActionForMethodVariables2:) 
	#(316 5 #reduceActionForNonExternalProcedureHeaderVars1:) 
	#(296 2 #reduceActionForExternalMethodModifier6:) 
	#(178 2 #reduceActionForMethodVariables1:) 
	#(304 2 #reduceActionForImplementationCode2:) 
	#(307 2 #reduceActionForConstructorDefinition1:) 
	#(308 2 #reduceActionForDestructorDefinition1:) 
	#(310 2 #reduceActionForClassProcedureDefinition1:) 
	#(312 2 #reduceActionForClassFunctionDefinition1:) 
	#(313 2 #reduceActionForClassOperatorDefinition1:) 
	#(160 2 #reduceActionForGotoStatement1:) 
	#(300 5 #reduceActionForArgument1:) 
	#(186 7 #reduceActionForAnonymousFunctionType1:) 
	#(240 3 #reduceActionForProtectedClassSection1:) 
	#(239 3 #reduceActionForPrivateClassSection1:) 
	#(283 0 #reduceActionForPropertyValues1:) 
	#(314 2 #reduceActionForGotoStatement1:) 
	#(235 3 #reduceActionForInstantiatedGenericTypeArguments1:) 
	#(189 3 #reduceActionForEnumName2:) 
	#(188 3 #reduceActionForSetConstructorValues2:) 
	#(318 6 #reduceActionForNonExternalFunctionHeaderVars1:) 
	#(295 2 #reduceActionForMethodVariables1:) 
	#(177 0 #nil) 
	#(297 5 #reduceActionForExternalMethodModifier5:) 
	#(296 3 #reduceActionForNonExternalMethodModifier2:) 
	#(331 8 #reduceActionForForStatement1:) 
	#(341 5 #reduceActionForOnDo1:) 
	#(210 3 #reduceActionForSetConstructorValues2:) 
	#(302 2 #reduceActionForGotoStatement1:) 
	#(252 5 #reduceActionForInterfaceFunctionAssignment1:) 
	#(253 5 #reduceActionForInterfaceProcedureAssignment1:) 
	#(282 3 #reduceActionForPropertyArrayAccessors2:) 
	#(268 5 #reduceActionForNonExternalConstructorHeader1:) 
	#(270 5 #reduceActionForNonExternalDestructorHeader1:) 
	#(244 5 #reduceActionForNewClassComponent1:) 
	#(243 3 #reduceActionForSetConstructorValues2:) 
	#(191 5 #reduceActionForOldClassType1:) 
	#(262 3 #reduceActionForGuid2:) 
	#(192 5 #reduceActionForInterfaceType1:) 
	#(264 1 #reduceActionForNumber1:) 
	#(263 2 #reduceActionForMethodVariables1:) 
	#(177 1 #reduceActionForNumber1:) 
	#(324 6 #reduceActionForVariable1:) 
	#(220 1 #reduceActionForNumber1:) 
	#(216 1 #reduceActionForSetConstructorValues1:) 
	#(219 1 #reduceActionForSetConstructorValues1:) 
	#(288 1 #reduceActionForPropertyDefault2:) 
	#(288 1 #reduceActionForPropertyDefault3:) 
	#(284 0 #nil) 
	#(283 2 #reduceActionForPropertyValues2:) 
	#(283 2 #reduceActionForCaseOptionList1:) 
	#(283 2 #reduceActionForPropertyValues4:) 
	#(283 2 #reduceActionForPropertyValues5:) 
	#(283 2 #reduceActionForPropertyValues6:) 
	#(283 2 #reduceActionForPropertyValues7:) 
	#(283 2 #reduceActionForPropertyValues8:) 
	#(194 6 #reduceActionForClassHelperType2:) 
	#(190 6 #reduceActionForNewClassType1:) 
	#(174 7 #reduceActionForConstantValue1:) 
	#(179 5 #reduceActionForResource1:) 
	#(215 6 #reduceActionForVariantRecordPart1:) 
	#(280 7 #reduceActionForNonExternalClassOperatorHeader1:) 
	#(285 2 #reduceActionForPropertyIndex1:) 
	#(286 2 #reduceActionForPropertyReader1:) 
	#(287 2 #reduceActionForPropertyWriter1:) 
	#(289 2 #reduceActionForPropertyStored1:) 
	#(291 2 #reduceActionForPropertyDispid1:) 
	#(288 2 #reduceActionForPropertyDefault1:) 
	#(293 1 #reduceActionForSetConstructorValues1:) 
	#(290 2 #reduceActionForPropertyImplements1:) 
	#(281 7 #reduceActionForPropertyHeaderVars1:) 
	#(216 3 #reduceActionForSetConstructorValues2:) 
	#(219 3 #reduceActionForSetConstructorValues2:) 
	#(291 3 #reduceActionForPropertyDispid2:) 
	#(291 3 #reduceActionForPropertyDispid3:) 
	#(284 2 #reduceActionForPropertyModifiers2:) 
	#(293 3 #reduceActionForSetConstructorValues2:) 
	#(194 9 #reduceActionForClassHelperType1:) 
	#(218 5 #reduceActionForVariantType1:)
	).
]

{ #category : #generated }
DelphiParser >> symbolNames [
	^ #('"RECORD"' '"CLASS"' '"PACKED"' '"END"' '".."' '"CASE"' '"SET"' '":"' '"]"' '")"' '"DEPRECATED"' '"PLATFORM"' '"FUNCTION"' '"PROCEDURE"' '"HELPER"' '"NOT"' '"FINALIZATION"' '"PUBLISHED"' '"DISPINTERFACE"' '"ARRAY"' '"INDEX"' '"PROPERTY"' '"PUBLIC"' '"PROTECTED"' '"ABSTRACT"' '"FOR"' '"OBJECT"' '"SEALED"' '"PRIVATE"' '"STRICT"' '">"' '"<"' '"READ"' '"DIV"' '"ABSOLUTE"' '"SHL"' '"MOD"' '"*"' '"SHR"' '"IS"' '"AS"' '"OF"' '"ELSE"' '"OR"' '":="' '"XOR"' '"AND"' '"@"' '"/"' '","' '"USES"' '"CONST"' '"IN"' '"RESOURCESTRING"' '"="' '"INTERFACE"' '"UNIT"' '"["' '"."' '"PROGRAM"' '"("' '"EXPORTS"' '"LIBRARY"' '"FILE"' '"TYPE"' '"IF"' '"UNTIL"' '"WITH"' '"THEN"' '"TRY"' '"DO"' '"REPEAT"' '"GOTO"' '"CONSTRUCTOR"' '"BEGIN"' '"WRITE"' '"DESTRUCTOR"' '"THREADVAR"' '"LABEL"' '"ON"' '"EXCEPT"' '"INHERITED"' '"MEMW"' '"<="' '"<>"' '"INITIALIZATION"' '">="' '"MEM"' '"&OPERATOR"' '"RAISE"' '"FINALLY"' '"DOWNTO"' '"TO"' '"ASM"' '"WHILE"' '"IMPLEMENTATION"' '"OPERATOR"' '"OUT"' '"VAR"' '"EXTERNAL"' '"OVERLOAD"' '"FORWARD"' '"STDCALL"' '"OVERRIDE"' '"MESSAGE"' '"STORED"' '"READONLY"' '"DISPID"' '"DEFAULT"' '"WRITEONLY"' '"IMPLEMENTS"' '"NODEFAULT"' '"NAME"' '"REGISTER"' '"EXPORT"' '"STATIC"' '"INLINE"' '"LOCAL"' '"SAFECALL"' '"ASSEMBLER"' '"DYNAMIC"' '"FINAL"' '"REINTRODUCE"' '"PASCAL"' '"UNSAFE"' '"VIRTUAL"' '"FAR"' '"NEAR"' '"CDECL"' '<at>' '<minus>' '<plus>' '<semicolon>' '<upArrow>' '<identifier>' '<constantIdentifier>' '<number>' '<integerWithRange>' '<string>' '<comment>' '<whitespace>' '<patternToken>' '<multiple_control_chars>' 'ProgramFile' 'LibraryFile' 'B e g i n' 'ProgramLine' 'UsesList' 'MainMethod' 'OptionalPlatform' 'LibraryLine' 'Exports' 'LibraryExport' 'MethodComponents' 'UnitLine' 'InterfaceSection' 'ImplementationSection' 'InitializationSection' 'FinalizationSection' 'EndFile' 'FullModuleName' 'InterfaceSectionValueList' 'UsesModuleList' 'UsesModule' 'NamedDefinedType' 'InterfaceSectionValue' 'DefinedTypeList' 'ResourceStringList' 'ConstantValueList' 'ProcedureHeader' 'FunctionHeader' 'Vars' 'ConstantValues' 'ConstantValue' 'OptionalType' 'ConstantExpression' 'OptionalDeprecated' 'Resources' 'Resource' 'NamedDefinedTypes' 'OptionalGenericTypeArguments' 'DefinedType' 'UnitFile' 'EnumType' 'SimpleDefinedType' 'AnonymousFunctionType' 'ClassOrInterfaceType' 'EnumList' 'EnumName' 'NewClassType' 'OldClassType' 'InterfaceType' 'MetaclassType' 'ClassHelperType' 'NamedType' 'Type' 'ArrayType' 'RecordType' 'InstantiatedGenericTypeArguments' 'FileType' 'SetType' 'RangeType' 'QualifiedName' 'InstantiatedGenericTypeArgumentList' 'OptionalArguments' 'OptionalOfObject' 'MethodModifiers' 'ArgumentList' 'TwoItemSetNameList' 'SetNameList' 'OptionalPacked' 'RecordFieldList' 'ImplicitClassSection' 'ClassSections' 'VariantRecordPart' 'VariantTypes' 'OptionalSemicolon' 'VariantType' 'VariantNames' 'VariantName' 'RangeValue' 'Number' 'ConstantOperator' 'String' 'GenericTypeArgumentList' 'ConstantArguments' 'SetConstructor' 'ConstantRecord' 'ConstantArray' 'ConstantExpressionList' 'EnumExpression' 'ConstantRecordFields' 'ConstantRecordField' 'ClassAttributes' 'Superclass' 'ClassAttribute' 'NewClassComponents' 'ClassSection' 'PrivateClassSection' 'ProtectedClassSection' 'PublicClassSection' 'PublishedClassSection' 'SuperclassList' 'NewClassComponent' 'VariableNames' 'VarsVars' 'ConstructorHeader' 'MethodAttribute' 'DestructorHeader' 'NewClassMethodComponent' 'InterfacePropertyComponent' 'InterfaceFunctionAssignment' 'InterfaceProcedureAssignment' 'ClassProcedureHeader' 'ClassFunctionHeader' 'ClassOperatorHeader' 'InterfaceMethodComponent' 'ArrayBounds' 'ArrayBoundsIndices' 'ArrayBoundsIndex' 'InterfaceKeyword' 'Guid' 'NewInterfaceComponents' 'NewInterfaceComponent' 'PropertyHeader' 'ClassPropertyHeader' 'ExternalConstructorHeader' 'NonExternalConstructorHeader' 'ExternalDestructorHeader' 'NonExternalDestructorHeader' 'ExternalProcedureHeader' 'NonExternalProcedureHeader' 'ExternalClassProcedureHeader' 'NonExternalClassProcedureHeader' 'ExternalFunctionHeader' 'NonExternalFunctionHeader' 'ExternalClassFunctionHeader' 'NonExternalClassFunctionHeader' 'ExternalClassOperatorHeader' 'NonExternalClassOperatorHeader' 'PropertyHeaderVars' 'PropertyArrayAccessors' 'PropertyValues' 'PropertyModifiers' 'PropertyIndex' 'PropertyReader' 'PropertyWriter' 'PropertyDefault' 'PropertyStored' 'PropertyImplements' 'PropertyDispid' 'Expression' 'PropertyImplementsList' 'MethodModifier' 'NonExternalMethodModifiers' 'NonExternalMethodModifier' 'ExternalMethodModifier' 'ModifierKeyword' 'Arguments' 'Argument' 'ArgumentType' 'OptionalValue' 'Definitions' 'ImplementationCode' 'Statements' 'Definition' 'ConstructorDefinition' 'DestructorDefinition' 'ProcedureDefinition' 'ClassProcedureDefinition' 'FunctionDefinition' 'ClassFunctionDefinition' 'ClassOperatorDefinition' 'OptionalParens' 'ExternalProcedureHeaderVars' 'NonExternalProcedureHeaderVars' 'ExternalFunctionHeaderVars' 'NonExternalFunctionHeaderVars' 'MethodVariables' 'StatementBlock' 'MethodVariable' 'Labels' 'VariablesList' 'Variable' 'RepeatStatement' 'IfStatement' 'WithStatement' 'TryStatement' 'CaseStatement' 'RaiseStatement' 'ForStatement' 'ForInStatement' 'WhileStatement' 'GotoStatement' 'LabeledStatement' 'WithExpressions' 'Except' 'Finally' 'OnDos' 'PossibleExceptElse' 'OnDo' 'CaseOptionList' 'ElseCase' 'CaseOptions' 'CaseOption' 'CaseLabel' 'BaseCaseLabel' 'CaseLabels' 'OptionalRaiseAt' 'VariableExpression' 'ToDownTo' 'AsmBlock' 'BeforeAsm' 'InstantiatedGenericVariableExpression' 'MethodArguments' 'InheritedFunctionCall' 'Operator' 'ArrayIndex' 'MemExpression' 'SetConstructorValues' 'SetValue' 'ArrayIndices' 'MethodArgument' 'E O F' 'error' 'Statement' '<controlCharacter>' 'File' 'AnonymousProcedureType')
]

{ #category : #generated }
DelphiParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #OrderedCollection #OrderedCollection #DelphiProgramNode #OrderedCollection #OrderedCollection #DelphiMainMethodDefinitionNode #SmaCCToken #OrderedCollection #OrderedCollection #DelphiLibraryExportNode #OrderedCollection #OrderedCollection #DelphiInterfaceSectionNode #DelphiImplementationSectionNode #DelphiInitializationSectionNode #DelphiFinalizationSectionNode #OrderedCollection #DelphiModuleNameNode #OrderedCollection #OrderedCollection #OrderedCollection #DelphiNamedDefinedTypeNode #DelphiProgramNode #DelphiDefinedTypeListNode #DelphiResourceStringListNode #DelphiConstantListNode #DelphiProcedureHeaderNode #DelphiFunctionHeaderNode #DelphiVarsNode #OrderedCollection #DelphiConstantDefinitionNode #OrderedCollection #DelphiExpressionNode #SmaCCToken #OrderedCollection #DelphiResourceStringDefinitionNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #DelphiEnumTypeNode #DelphiProgramNode #DelphiAnonymousFunctionTypeNode #DelphiTypeNode #OrderedCollection #DelphiEnumNameNode #DelphiNewClassTypeNode #DelphiOldClassTypeNode #DelphiInterfaceTypeNode #DelphiMetaclassTypeNode #DelphiClassHelperTypeNode #DelphiExpressionNode #DelphiProgramNode #DelphiArrayTypeNode #DelphiRecordTypeNode #OrderedCollection #DelphiFileTypeNode #DelphiSetTypeNode #DelphiRangeTypeNode #DelphiQualifiedNameNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #DelphiImplicitClassSectionNode #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #DelphiVariantTypeNode #OrderedCollection #DelphiExpressionNode #DelphiExpressionNode #SmaCCToken #SmaCCToken #SmaCCToken #OrderedCollection #OrderedCollection #DelphiSetExpressionNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #DelphiConstantRecordFieldNode #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #DelphiClassSectionNode #DelphiPrivateClassSectionNode #DelphiProtectedClassSectionNode #DelphiPublicClassSectionNode #DelphiPublishedClassSectionNode #OrderedCollection #DelphiProgramNode #OrderedCollection #OrderedCollection #DelphiConstructorHeaderNode #DelphiMethodAttributeNode #DelphiDestructorHeaderNode #DelphiMethodHeaderNode #DelphiPropertyHeaderNode #DelphiInterfaceFunctionAssignmentNode #DelphiInterfaceProcedureAssignmentNode #DelphiClassProcedureHeaderNode #DelphiClassFunctionHeaderNode #DelphiClassOperatorHeaderNode #DelphiMethodHeaderNode #OrderedCollection #OrderedCollection #DelphiProgramNode #SmaCCToken #DelphiGuidNode #OrderedCollection #DelphiProgramNode #DelphiPropertyHeaderNode #DelphiClassPropertyHeaderNode #DelphiConstructorHeaderNode #DelphiConstructorHeaderNode #DelphiDestructorHeaderNode #DelphiDestructorHeaderNode #DelphiProcedureHeaderNode #DelphiProcedureHeaderNode #DelphiClassProcedureHeaderNode #DelphiClassProcedureHeaderNode #DelphiFunctionHeaderNode #DelphiFunctionHeaderNode #DelphiClassFunctionHeaderNode #DelphiClassFunctionHeaderNode #DelphiClassOperatorHeaderNode #DelphiClassOperatorHeaderNode #OrderedCollection #DelphiPropertyArrayAccessorsNode #OrderedCollection #DelphiPropertyModifierNode #DelphiPropertyIndexNode #DelphiPropertyReaderNode #DelphiPropertyWriterNode #DelphiPropertyDefaultNode #DelphiPropertyStoredNode #DelphiPropertyImplementsNode #DelphiPropertyDispidNode #DelphiExpressionNode #OrderedCollection #DelphiMethodModifierNode #OrderedCollection #DelphiMethodModifierNode #DelphiMethodModifierNode #SmaCCToken #OrderedCollection #DelphiArgumentNode #SmaCCToken #OrderedCollection #OrderedCollection #DelphiImplementationCodeNode #OrderedCollection #DelphiProgramNode #DelphiConstructorDefinitionNode #DelphiDestructorDefinitionNode #DelphiProcedureDefinitionNode #DelphiClassProcedureDefinitionNode #DelphiFunctionDefinitionNode #DelphiClassFunctionDefinitionNode #DelphiClassOperatorDefinitionNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #DelphiStatementNode #DelphiProgramNode #DelphiLabelVariableNode #OrderedCollection #DelphiVariableNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #DelphiExceptNode #DelphiFinallyNode #OrderedCollection #DelphiExceptElseNode #DelphiOnDoNode #OrderedCollection #OrderedCollection #OrderedCollection #DelphiCaseOptionNode #DelphiProgramNode #DelphiProgramNode #OrderedCollection #OrderedCollection #DelphiVariableExpressionNode #SmaCCToken #DelphiAsmBlockNode nil #DelphiInstantiatedGenericVariableExpressionNode #OrderedCollection #DelphiInheritedFunctionCallNode #SmaCCToken #OrderedCollection #DelphiMemExpressionNode #OrderedCollection #DelphiSetValueNode #OrderedCollection #DelphiProgramNode #SmaCCToken #SmaCCToken #DelphiStatementNode #SmaCCToken #DelphiProgramNode #DelphiAnonymousProcedureTypeNode)
]

{ #category : #generated }
DelphiParser >> transitionTable [
^#(
#[1 0 6 0 13 0 6 0 14 0 21 0 51 0 6 0 52 0 25 0 57 0 29 0 60 0 33 0 63 0 6 0 65 0 6 0 75 0 6 0 78 0 6 0 79 0 6 0 94 0 6 0 99 0 37 0 144 0 41 0 145 0 45 0 147 0 49 0 148 0 53 0 151 0 57 0 155 0 61 0 183 0 65 1 112] 
#[1 0 69 0 6 0 73 0 16 0 77 0 26 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 117 0 82 0 121 0 83 0 125 0 88 0 129 0 90 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 0 14 1 108 0 249 1 110 0 253 1 111] 
#[1 0 18 0 1 1 1 0 3 1 5 0 7 1 9 0 13 1 13 0 14 1 17 0 16 0 18 0 20 0 22 0 32 0 22 0 35 1 21 0 48 0 85 0 58 0 22 0 59 1 25 0 61 1 29 0 64 1 33 0 65 1 37 0 131 1 41 0 132 1 45 0 134 1 49 0 136 1 53 0 137 0 153 0 139 1 57 0 143 1 61 0 176 1 65 0 185 1 69 0 186 1 73 0 195 1 77 0 196 1 81 0 197 1 85 0 198 1 89 0 200 1 93 0 201 1 97 0 202 1 101 0 211 1 105 0 221 1 109 0 222 1 113 0 224 1 117 0 227 0 22 1 108 1 121 1 111 1 125 1 113] 
#[1 1 129 0 135 1 133 0 165] 
#[1 1 137 0 135 1 141 0 161 1 145 0 163 1 149 0 164] 
#[1 1 137 0 135 1 153 0 161] 
#[0 1 157 0 135] 
#[0 1 161 0 135] 
#[0 0 26 1 108] 
#[0 0 30 1 108] 
#[1 0 6 0 13 0 6 0 14 0 21 0 51 0 6 0 52 0 6 0 65 0 6 0 75 0 6 0 78 0 6 0 79 0 6 0 94 0 6 0 99 1 165 0 148] 
#[1 0 34 0 13 0 34 0 14 0 34 0 52 0 34 0 65 0 34 0 75 0 34 0 78 0 34 0 79 0 34 0 94 0 34 0 99 1 169 0 149 1 173 0 154 1 177 1 63] 
#[1 0 6 0 13 0 6 0 14 0 21 0 51 0 6 0 52 0 6 0 62 0 6 0 65 0 6 0 75 0 6 0 78 0 6 0 79 0 6 0 94 0 6 0 99 1 181 0 148] 
#[1 0 38 0 4 0 38 0 17 1 185 0 56 0 38 0 86 0 38 0 96 1 189 0 156 0 42 1 108] 
#[0 0 46 1 108] 
#[0 0 0 1 108] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 1 197 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 1 201 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[1 1 205 0 135 1 209 1 94] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 1 213 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[1 1 217 0 9 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 1 221 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 1 225 1 104 1 229 1 105 0 253 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 1 233 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 1 237 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 1 241 1 36 1 245 1 80 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 77 0 26 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 14 0 81 0 117 0 82 0 121 0 83 0 125 0 88 0 129 0 90 0 14 0 91 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 1 249 1 49 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 1 253 1 110 0 253 1 111] 
#[1 0 69 0 6 0 73 0 16 0 77 0 26 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 14 0 67 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 117 0 82 0 121 0 83 0 125 0 88 0 129 0 90 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 2 1 1 49 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 1 253 1 110 0 253 1 111] 
#[1 2 5 0 135 2 9 0 137] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 77 0 26 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 117 0 82 0 121 0 83 0 125 0 88 0 129 0 90 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 2 13 1 49 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 1 253 1 110 0 253 1 111] 
#[1 0 50 0 4 0 50 0 5 0 50 0 8 0 50 0 9 0 50 0 10 0 50 0 17 0 50 0 21 0 50 0 31 0 50 0 32 0 50 0 33 0 50 0 34 0 50 0 36 0 50 0 37 0 50 0 38 0 50 0 39 0 50 0 40 0 50 0 41 0 50 0 42 0 50 0 43 0 50 0 44 0 50 0 45 0 50 0 46 0 50 0 47 0 50 0 49 0 50 0 50 0 50 0 53 0 50 0 55 0 50 0 58 0 50 0 59 0 50 0 61 0 50 0 67 0 50 0 69 0 50 0 71 0 50 0 76 0 50 0 80 0 50 0 81 0 50 0 84 0 50 0 85 0 50 0 86 0 50 0 87 0 50 0 91 0 50 0 92 0 50 0 93 0 50 0 106 0 50 0 107 0 50 0 108 0 50 0 109 0 50 0 110 0 50 0 111 0 50 0 112 0 50 0 130 0 50 0 131 0 50 0 132 0 50 0 133 0 50 0 134 2 17 0 135 0 50 1 108] 
#[0 2 21 0 58] 
#[0 2 25 0 58] 
#[1 0 54 0 4 0 73 0 16 0 54 0 17 0 54 0 43 0 81 0 48 0 85 0 58 0 89 0 61 0 54 0 67 0 54 0 80 0 54 0 81 0 117 0 82 0 121 0 83 0 54 0 86 0 125 0 88 0 54 0 91 0 137 0 131 0 141 0 132 0 54 0 133 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 2 29 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 54 1 108 0 253 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 2 33 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 2 37 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 2 41 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[1 0 58 0 4 2 45 0 8 0 58 0 17 0 58 0 31 0 7 0 32 0 58 0 34 0 58 0 36 0 58 0 37 0 58 0 38 0 58 0 39 0 58 0 40 0 58 0 41 0 58 0 43 0 58 0 44 0 58 0 45 0 58 0 46 0 58 0 47 0 58 0 49 0 58 0 53 0 58 0 55 0 58 0 58 0 58 0 59 0 58 0 61 0 58 0 67 0 58 0 80 0 58 0 81 0 58 0 84 0 58 0 85 0 58 0 86 0 58 0 87 0 58 0 91 0 58 0 131 0 58 0 132 0 58 0 133 0 58 0 134 2 53 0 199 0 58 1 108] 
#[1 0 62 0 4 2 57 0 8 0 62 0 17 0 62 0 31 0 62 0 32 0 62 0 34 0 62 0 36 0 62 0 37 0 62 0 38 0 62 0 39 0 62 0 40 0 62 0 41 0 62 0 43 0 62 0 44 0 62 0 45 0 62 0 46 0 62 0 47 0 62 0 49 0 62 0 53 0 62 0 55 0 62 0 58 0 62 0 59 0 62 0 61 0 62 0 67 0 62 0 80 0 62 0 81 0 62 0 84 0 62 0 85 0 62 0 86 0 62 0 87 0 62 0 91 0 62 0 131 0 62 0 132 0 62 0 133 0 62 0 134 0 62 1 108] 
#[0 0 66 0 4 0 5 0 8 0 9 0 10 0 11 0 12 0 17 0 21 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[0 0 70 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[0 0 70 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[0 0 70 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[0 0 74 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[1 0 78 0 4 0 78 0 17 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 0 78 0 43 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 0 78 0 67 0 78 0 80 0 78 0 81 2 137 0 84 2 141 0 85 0 78 0 86 2 145 0 87 0 78 0 91 2 149 0 131 2 153 0 132 0 78 0 133 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102 0 78 1 108] 
#[0 0 78 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 0 82 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 0 86 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 0 90 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 0 94 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 0 98 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 0 102 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 0 106 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 0 110 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 0 114 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 0 118 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 0 122 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 0 74 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[0 0 126 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 2 173 0 94] 
#[0 0 74 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[0 0 74 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[0 0 74 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[0 0 0 1 108] 
#[0 0 70 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[0 0 130 0 1 0 20] 
#[0 2 177 0 42] 
#[1 0 134 0 8 2 181 0 61 2 185 0 205] 
#[1 0 134 0 42 2 181 0 61 0 134 0 133 2 189 0 205] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 2 197 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 2 201 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[1 0 138 0 10 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 205 0 136 1 53 0 137 0 153 0 139 1 57 0 143 2 209 0 176 1 109 0 222 1 113 0 224 1 117 0 227 2 213 0 228 2 217 0 229 2 221 0 230 2 225 0 231 2 229 0 232 2 233 0 233 1 121 1 111] 
#[1 0 142 0 9 0 142 0 10 0 142 0 11 0 142 0 12 0 142 0 21 0 142 0 31 0 142 0 32 0 142 0 33 0 142 0 35 2 237 0 42 0 142 0 50 0 142 0 55 0 142 0 58 0 142 0 71 0 142 0 76 0 142 0 106 0 142 0 107 0 142 0 108 0 142 0 109 0 142 0 110 0 142 0 111 0 142 0 112 0 142 0 133 0 142 1 108] 
#[1 2 241 0 135 2 245 0 203] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 2 249 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 2 253 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[1 0 18 0 1 1 1 0 3 1 5 0 7 0 22 0 9 0 22 0 10 0 22 0 11 0 22 0 12 1 9 0 13 1 13 0 14 1 17 0 16 0 18 0 20 0 22 0 21 0 22 0 31 0 22 0 32 0 22 0 33 0 22 0 35 0 22 0 42 1 21 0 48 0 22 0 50 0 22 0 55 0 85 0 58 0 22 0 59 1 25 0 61 1 29 0 64 1 33 0 65 0 22 0 71 0 22 0 76 0 22 0 106 0 22 0 107 0 22 0 108 0 22 0 109 0 22 0 110 0 22 0 111 0 22 0 112 1 37 0 131 1 41 0 132 0 22 0 133 1 45 0 134 1 49 0 136 1 53 0 137 0 153 0 139 1 57 0 143 1 61 0 176 3 1 0 185 1 69 0 186 1 73 0 195 3 5 0 196 1 81 0 197 1 85 0 198 1 89 0 200 1 93 0 201 1 97 0 202 1 101 0 211 1 105 0 221 1 109 0 222 1 113 0 224 1 117 0 227 0 22 1 108 1 121 1 111 1 125 1 113] 
#[1 0 146 0 5 0 150 0 9 0 150 0 10 0 150 0 11 0 150 0 12 0 150 0 21 0 11 0 31 0 11 0 32 0 150 0 33 0 146 0 34 0 150 0 35 0 146 0 36 0 146 0 37 0 146 0 38 0 146 0 39 0 146 0 40 0 146 0 41 0 150 0 42 0 146 0 44 0 146 0 46 0 146 0 47 0 146 0 49 0 150 0 50 0 146 0 53 0 150 0 55 0 150 0 58 0 11 0 59 0 146 0 61 0 150 0 71 0 150 0 76 0 146 0 84 0 146 0 85 0 146 0 87 0 150 0 106 0 150 0 107 0 150 0 108 0 150 0 109 0 150 0 110 0 150 0 111 0 150 0 112 0 146 0 131 0 146 0 132 0 150 0 133 0 150 1 108] 
#[0 0 62 0 4 0 5 0 8 0 9 0 10 0 11 0 12 0 17 0 21 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[0 0 154 0 5 0 8 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 71 0 76 0 84 0 85 0 87 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 131 0 132 0 133 1 108] 
#[1 0 158 0 5 0 158 0 9 0 158 0 10 0 158 0 11 0 158 0 12 0 158 0 21 0 15 0 31 0 19 0 32 0 158 0 33 2 69 0 34 0 158 0 35 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 0 158 0 42 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 0 158 0 50 2 117 0 53 0 158 0 55 0 158 0 58 3 9 0 59 3 13 0 61 0 158 0 71 0 158 0 76 2 137 0 84 2 141 0 85 2 145 0 87 0 158 0 106 0 158 0 107 0 158 0 108 0 158 0 109 0 158 0 110 0 158 0 111 0 158 0 112 2 149 0 131 2 153 0 132 0 158 0 133 3 17 0 223 0 158 1 108] 
#[1 0 162 0 32 0 162 0 35 0 162 0 58 0 0 1 108] 
#[0 0 162 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 35 0 42 0 50 0 55 0 58 0 71 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 1 108] 
#[1 0 166 0 9 0 166 0 10 0 166 0 11 0 166 0 12 0 166 0 21 0 166 0 31 0 166 0 32 0 166 0 33 0 166 0 35 0 166 0 42 0 166 0 50 0 166 0 55 0 166 0 58 3 21 0 59 0 166 0 71 0 166 0 76 0 166 0 106 0 166 0 107 0 166 0 108 0 166 0 109 0 166 0 110 0 166 0 111 0 166 0 112 0 166 0 133 0 166 1 108] 
#[1 2 49 0 32 3 25 0 35 3 29 0 58 3 33 0 199] 
#[0 0 170 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 35 0 42 0 50 0 55 0 58 0 71 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 1 108] 
#[0 0 170 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 35 0 42 0 50 0 55 0 58 0 71 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 1 108] 
#[0 0 170 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 35 0 42 0 50 0 55 0 58 0 71 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 1 108] 
#[0 0 170 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 35 0 42 0 50 0 55 0 58 0 71 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 1 108] 
#[0 0 170 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 35 0 42 0 50 0 55 0 58 0 71 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 1 108] 
#[1 3 37 0 1 3 41 0 20] 
#[0 3 45 0 5] 
#[0 0 154 0 5 0 8 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 71 0 76 0 84 0 85 0 87 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 131 0 132 0 133 1 108] 
#[0 0 154 0 5 0 8 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 71 0 76 0 84 0 85 0 87 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 131 0 132 0 133 1 108] 
#[0 0 174 0 5 0 8 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 71 0 76 0 84 0 85 0 87 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 131 0 132 0 133 1 108] 
#[0 0 154 0 5 0 8 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 71 0 76 0 84 0 85 0 87 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 131 0 132 0 133 1 108] 
#[0 0 162 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 35 0 42 0 50 0 55 0 58 0 71 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 1 108] 
#[1 3 49 0 32 0 178 0 55 3 53 0 181] 
#[0 0 0 1 108] 
#[0 0 182 0 11 0 12 0 50 0 53 0 59 0 133] 
#[1 0 186 0 50 3 57 0 53 3 61 0 59 0 186 0 133] 
#[1 3 65 0 50 3 69 0 133] 
#[0 0 190 0 50 0 133] 
#[1 3 73 0 11 3 77 0 12 3 61 0 59 0 194 0 133 3 81 0 150] 
#[1 3 73 0 11 3 77 0 12 0 194 0 133 3 85 0 150] 
#[1 3 73 0 11 3 77 0 12 0 194 0 133 3 89 0 150] 
#[1 0 34 0 13 0 34 0 14 0 34 0 52 0 34 0 65 0 34 0 75 0 34 0 78 0 34 0 79 0 34 0 94 0 34 0 99 3 93 0 149 1 173 0 154 1 177 1 63] 
#[0 3 97 0 59] 
#[0 0 198 0 59] 
#[1 3 101 0 13 3 105 0 14 3 109 0 52 3 113 0 65 0 113 0 75 3 117 0 78 3 121 0 79 0 10 0 94 3 125 0 99 3 129 0 167 3 133 0 169 3 137 0 172 3 141 0 246 3 145 1 15 3 149 1 16 3 153 1 19 3 157 1 20 3 161 1 53 3 165 1 55 3 169 1 59 3 173 1 60 3 177 1 61 3 181 1 62 3 185 1 64 3 189 1 65 3 193 1 66 0 229 1 96 0 233 1 97] 
#[1 0 202 0 13 0 202 0 14 0 202 0 52 0 202 0 62 0 202 0 65 0 202 0 75 0 202 0 78 0 202 0 79 0 202 0 94 0 202 0 99 3 197 0 152] 
#[1 0 6 0 4 0 6 0 13 0 6 0 14 0 6 0 17 0 21 0 51 0 6 0 52 0 6 0 54 0 6 0 65 0 6 0 78 0 6 0 86 0 6 0 96 0 6 0 99 3 201 0 148] 
#[1 0 206 0 4 0 206 0 17 0 206 0 86 3 205 0 96 3 209 0 157] 
#[1 0 58 0 4 0 58 0 5 0 58 0 8 0 58 0 9 0 58 0 10 0 58 0 17 0 58 0 21 0 58 0 31 0 7 0 32 0 58 0 33 0 58 0 34 0 58 0 36 0 58 0 37 0 58 0 38 0 58 0 39 0 58 0 40 0 58 0 41 0 58 0 42 0 58 0 43 0 58 0 44 0 58 0 45 0 58 0 46 0 58 0 47 0 58 0 49 0 58 0 50 0 58 0 53 0 58 0 55 0 58 0 58 0 58 0 59 0 58 0 61 0 58 0 67 0 58 0 69 0 58 0 71 0 58 0 76 0 58 0 80 0 58 0 81 0 58 0 84 0 58 0 85 0 58 0 86 0 58 0 87 0 58 0 91 0 58 0 92 0 58 0 93 0 58 0 106 0 58 0 107 0 58 0 108 0 58 0 109 0 58 0 110 0 58 0 111 0 58 0 112 0 58 0 130 0 58 0 131 0 58 0 132 0 58 0 133 0 58 0 134 2 53 0 199 0 58 1 108] 
#[1 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 3 213 0 42 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[1 0 210 0 4 0 210 0 5 0 210 0 8 0 210 0 9 0 210 0 10 0 210 0 17 0 210 0 21 0 23 0 31 0 27 0 32 0 210 0 33 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 0 210 0 42 0 210 0 43 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 0 210 0 50 0 31 0 53 0 35 0 55 2 125 0 58 2 129 0 59 2 133 0 61 0 210 0 67 0 210 0 69 0 210 0 71 0 210 0 76 0 210 0 80 0 210 0 81 0 39 0 84 0 43 0 85 0 210 0 86 0 47 0 87 0 210 0 91 0 210 0 92 0 210 0 93 0 210 0 106 0 210 0 107 0 210 0 108 0 210 0 109 0 210 0 110 0 210 0 111 0 210 0 112 0 210 0 130 2 149 0 131 2 153 0 132 0 210 0 133 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102 0 210 1 108] 
#[0 0 58 0 45 0 53] 
#[1 3 217 0 45 3 221 0 53] 
#[1 0 214 0 4 0 214 0 5 0 214 0 8 0 214 0 9 0 214 0 10 0 214 0 17 0 214 0 21 0 51 0 31 0 55 0 32 0 214 0 33 0 214 0 34 0 214 0 36 0 214 0 37 0 214 0 38 0 214 0 39 0 214 0 40 0 214 0 41 0 214 0 42 0 214 0 43 0 214 0 44 0 214 0 45 0 214 0 46 0 214 0 47 0 214 0 49 0 214 0 50 0 59 0 53 0 63 0 55 2 125 0 58 2 129 0 59 2 133 0 61 0 214 0 67 0 214 0 69 0 214 0 71 0 214 0 76 0 214 0 80 0 214 0 81 0 67 0 84 0 71 0 85 0 214 0 86 0 75 0 87 0 214 0 91 0 214 0 92 0 214 0 93 0 214 0 106 0 214 0 107 0 214 0 108 0 214 0 109 0 214 0 110 0 214 0 111 0 214 0 112 0 214 0 130 0 214 0 131 0 214 0 132 0 214 0 133 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102 0 214 1 108] 
#[0 0 218 0 4 0 5 0 8 0 9 0 10 0 11 0 12 0 17 0 21 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[1 3 225 0 5 0 222 0 9 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 0 222 0 50 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[1 3 229 0 9 3 233 0 50] 
#[0 0 226 0 9 0 50] 
#[1 3 237 0 10 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[1 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 3 241 0 69 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[1 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 0 230 0 50 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 0 230 0 71 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[1 3 245 0 50 3 249 0 71] 
#[1 0 234 0 4 3 253 0 81 0 234 0 91 4 1 0 133 4 5 1 81] 
#[0 0 238 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133] 
#[1 4 9 0 67 4 1 0 133] 
#[0 0 242 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 0 242 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[1 4 13 0 4 4 1 0 133] 
#[1 0 246 0 4 0 246 0 5 0 246 0 8 0 246 0 9 0 246 0 10 0 246 0 17 0 246 0 21 0 246 0 31 0 246 0 32 0 246 0 33 0 246 0 34 0 246 0 36 0 246 0 37 0 246 0 38 0 246 0 39 0 246 0 40 0 246 0 41 0 246 0 42 0 246 0 43 0 246 0 44 0 246 0 45 0 246 0 46 0 246 0 47 0 246 0 49 0 246 0 50 0 246 0 53 0 246 0 55 0 246 0 58 0 246 0 59 4 17 0 61 0 246 0 67 0 246 0 69 0 246 0 71 0 246 0 76 0 246 0 80 0 246 0 81 0 246 0 84 0 246 0 85 0 246 0 86 0 246 0 87 0 246 0 91 0 246 0 92 0 246 0 93 0 246 0 106 0 246 0 107 0 246 0 108 0 246 0 109 0 246 0 110 0 246 0 111 0 246 0 112 0 246 0 130 0 246 0 131 0 246 0 132 0 246 0 133 0 246 0 134 0 246 1 108] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 4 21 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 4 25 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[1 0 250 0 4 0 250 0 17 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 0 250 0 43 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 0 250 0 67 0 250 0 80 0 250 0 81 2 137 0 84 2 141 0 85 0 250 0 86 2 145 0 87 0 250 0 91 4 29 0 130 2 149 0 131 2 153 0 132 0 250 0 133 2 157 0 134 2 161 0 223 4 33 1 93 2 165 1 101 2 169 1 102 0 250 1 108] 
#[1 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 4 37 0 71 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[1 0 254 0 4 0 254 0 5 0 254 0 8 0 254 0 9 0 254 0 10 0 254 0 17 0 254 0 21 0 79 0 31 0 83 0 32 0 254 0 33 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 0 254 0 40 0 254 0 41 0 254 0 42 0 254 0 43 0 254 0 44 0 254 0 45 0 254 0 46 0 254 0 47 2 113 0 49 0 254 0 50 0 87 0 53 0 91 0 55 2 125 0 58 2 129 0 59 2 133 0 61 0 254 0 67 0 254 0 69 0 254 0 71 0 254 0 76 0 254 0 80 0 254 0 81 0 95 0 84 0 99 0 85 0 254 0 86 0 103 0 87 0 254 0 91 0 254 0 92 0 254 0 93 0 254 0 106 0 254 0 107 0 254 0 108 0 254 0 109 0 254 0 110 0 254 0 111 0 254 0 112 0 254 0 130 0 254 0 131 0 254 0 132 0 254 0 133 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102 0 254 1 108] 
#[1 1 2 0 4 1 2 0 5 1 2 0 8 1 2 0 9 1 2 0 10 1 2 0 17 1 2 0 21 0 107 0 31 0 111 0 32 1 2 0 33 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 1 2 0 40 1 2 0 41 1 2 0 42 1 2 0 43 1 2 0 44 1 2 0 45 1 2 0 46 1 2 0 47 2 113 0 49 1 2 0 50 0 115 0 53 0 119 0 55 2 125 0 58 2 129 0 59 2 133 0 61 1 2 0 67 1 2 0 69 1 2 0 71 1 2 0 76 1 2 0 80 1 2 0 81 0 123 0 84 0 127 0 85 1 2 0 86 0 131 0 87 1 2 0 91 1 2 0 92 1 2 0 93 1 2 0 106 1 2 0 107 1 2 0 108 1 2 0 109 1 2 0 110 1 2 0 111 1 2 0 112 1 2 0 130 1 2 0 131 1 2 0 132 1 2 0 133 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102 1 2 1 108] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 14 0 17 0 77 0 26 0 14 0 43 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 14 0 67 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 14 0 80 0 14 0 81 0 117 0 82 0 121 0 83 0 14 0 86 0 125 0 88 0 129 0 90 0 14 0 91 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 0 14 1 108 4 41 1 110 0 253 1 111] 
#[1 0 18 0 1 1 1 0 3 1 5 0 7 1 9 0 13 1 13 0 14 1 17 0 16 0 18 0 20 0 22 0 31 0 22 0 32 0 22 0 35 1 21 0 48 0 22 0 50 0 85 0 58 0 22 0 59 1 25 0 61 1 29 0 64 1 33 0 65 1 37 0 131 1 41 0 132 1 45 0 134 1 49 0 136 1 53 0 137 0 153 0 139 1 57 0 143 1 61 0 176 4 45 0 185 1 69 0 186 1 73 0 195 1 77 0 196 1 81 0 197 1 85 0 198 1 89 0 200 1 93 0 201 1 97 0 202 4 49 0 204 1 101 0 211 1 105 0 221 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111 1 125 1 113] 
#[0 1 6 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 14 0 17 0 77 0 26 0 14 0 43 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 14 0 67 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 14 0 80 0 14 0 81 0 117 0 82 0 121 0 83 0 14 0 86 0 125 0 88 0 129 0 90 0 14 0 91 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 0 14 1 108 4 53 1 110 0 253 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 4 57 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 14 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 137 0 139 0 143 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 4 61 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 4 65 1 106 0 253 1 111] 
#[1 4 69 0 89 4 73 0 135] 
#[1 4 77 0 10 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 4 81 1 36 0 225 1 94 0 237 1 98 4 85 1 99 0 241 1 100 0 245 1 103 4 89 1 107 0 253 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 10 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 136 0 137 0 139 0 143 1 111] 
#[0 1 18 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[0 1 14 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 137 0 139 0 143 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 4 93 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[0 1 22 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[0 4 97 0 4] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 4 101 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 4 105 0 176 4 109 0 202 1 105 0 221 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[1 1 26 0 10 4 113 0 52 4 117 0 98 4 121 0 99 1 30 0 135 4 125 0 208 4 129 1 43 4 133 1 44 4 137 1 45] 
#[0 4 141 0 8] 
#[1 4 145 0 42 1 34 0 133 4 149 0 206] 
#[0 0 146 0 5 0 8 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 71 0 76 0 84 0 85 0 87 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 131 0 132 0 133 1 108] 
#[1 1 38 0 5 1 38 0 8 1 38 0 9 1 38 0 10 1 38 0 11 1 38 0 12 1 38 0 21 0 135 0 31 0 139 0 32 1 38 0 33 2 69 0 34 1 38 0 35 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 1 38 0 42 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 1 38 0 50 0 143 0 53 1 38 0 55 1 38 0 58 3 9 0 59 3 13 0 61 1 38 0 71 1 38 0 76 0 147 0 84 0 151 0 85 0 155 0 87 1 38 0 106 1 38 0 107 1 38 0 108 1 38 0 109 1 38 0 110 1 38 0 111 1 38 0 112 2 149 0 131 2 153 0 132 1 38 0 133 3 17 0 223 1 38 1 108] 
#[1 1 42 0 5 1 42 0 8 1 42 0 9 1 42 0 10 1 42 0 11 1 42 0 12 1 42 0 21 0 159 0 31 0 163 0 32 1 42 0 33 1 42 0 34 1 42 0 35 1 42 0 36 1 42 0 37 1 42 0 38 1 42 0 39 1 42 0 40 1 42 0 41 1 42 0 42 1 42 0 44 1 42 0 46 1 42 0 47 1 42 0 49 1 42 0 50 0 167 0 53 1 42 0 55 1 42 0 58 3 9 0 59 3 13 0 61 1 42 0 71 1 42 0 76 0 171 0 84 0 175 0 85 0 179 0 87 1 42 0 106 1 42 0 107 1 42 0 108 1 42 0 109 1 42 0 110 1 42 0 111 1 42 0 112 1 42 0 131 1 42 0 132 1 42 0 133 3 17 0 223 1 42 1 108] 
#[1 4 153 0 8 0 146 0 10 0 146 0 31 0 146 0 32 0 146 0 34 0 146 0 36 0 146 0 37 0 146 0 38 0 146 0 39 0 146 0 40 0 146 0 41 0 146 0 44 0 146 0 46 0 146 0 47 0 146 0 49 0 146 0 50 0 146 0 53 0 146 0 55 0 146 0 59 0 146 0 61 0 146 0 84 0 146 0 85 0 146 0 87 0 146 0 131 0 146 0 132] 
#[1 1 46 0 10 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 1 46 0 50 2 117 0 53 4 157 0 55 3 9 0 59 3 13 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 3 17 0 223] 
#[1 1 50 0 10 4 161 0 133 4 165 0 217] 
#[0 4 169 0 10] 
#[1 1 54 0 10 4 173 0 50] 
#[0 1 58 0 10 0 50] 
#[1 1 62 0 10 0 183 0 133] 
#[0 1 66 0 10 0 133] 
#[1 0 18 0 1 1 1 0 3 1 5 0 7 0 22 0 9 0 22 0 10 0 22 0 11 0 22 0 12 1 9 0 13 1 13 0 14 1 17 0 16 0 18 0 20 0 22 0 21 0 22 0 31 0 22 0 32 0 22 0 33 0 22 0 35 0 22 0 42 1 21 0 48 0 22 0 50 0 22 0 55 0 85 0 58 0 22 0 59 1 25 0 61 1 29 0 64 1 33 0 65 0 22 0 71 0 22 0 76 0 22 0 106 0 22 0 107 0 22 0 108 0 22 0 109 0 22 0 110 0 22 0 111 0 22 0 112 1 37 0 131 1 41 0 132 0 22 0 133 1 45 0 134 1 49 0 136 1 53 0 137 0 153 0 139 1 57 0 143 1 61 0 176 3 1 0 185 1 69 0 186 1 73 0 195 4 181 0 196 1 81 0 197 1 85 0 198 1 89 0 200 1 93 0 201 1 97 0 202 1 101 0 211 1 105 0 221 1 109 0 222 1 113 0 224 1 117 0 227 0 22 1 108 1 121 1 111 1 125 1 113] 
#[1 0 178 0 2 0 178 0 4 0 178 0 8 0 178 0 9 0 178 0 10 0 178 0 11 0 178 0 12 0 178 0 13 0 178 0 14 0 178 0 17 0 178 0 18 0 178 0 21 0 178 0 22 0 178 0 23 0 178 0 24 0 178 0 29 0 178 0 30 0 178 0 31 0 187 0 32 0 178 0 33 0 178 0 35 0 178 0 42 0 178 0 43 0 178 0 50 0 178 0 52 0 178 0 55 0 178 0 58 0 178 0 59 0 178 0 61 0 178 0 67 0 178 0 71 0 178 0 74 0 178 0 76 0 178 0 77 0 178 0 78 0 178 0 80 0 178 0 81 0 178 0 86 0 178 0 91 0 178 0 99 0 178 0 106 0 178 0 107 0 178 0 108 0 178 0 109 0 178 0 110 0 178 0 111 0 178 0 112 0 178 0 133 0 178 0 135 4 185 0 181 0 178 1 108] 
#[0 1 70 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 35 0 42 0 50 0 55 0 58 0 71 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 1 108] 
#[1 1 74 0 5 1 74 0 8 1 74 0 9 1 74 0 10 1 74 0 11 1 74 0 12 1 74 0 21 0 191 0 31 0 195 0 32 1 74 0 33 2 69 0 34 1 74 0 35 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 1 74 0 40 1 74 0 41 1 74 0 42 1 74 0 44 1 74 0 46 1 74 0 47 2 113 0 49 1 74 0 50 0 199 0 53 1 74 0 55 1 74 0 58 3 9 0 59 3 13 0 61 1 74 0 71 1 74 0 76 0 203 0 84 0 207 0 85 0 211 0 87 1 74 0 106 1 74 0 107 1 74 0 108 1 74 0 109 1 74 0 110 1 74 0 111 1 74 0 112 1 74 0 131 1 74 0 132 1 74 0 133 3 17 0 223 1 74 1 108] 
#[1 1 78 0 5 1 78 0 8 1 78 0 9 1 78 0 10 1 78 0 11 1 78 0 12 1 78 0 21 0 215 0 31 0 219 0 32 1 78 0 33 2 69 0 34 1 78 0 35 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 1 78 0 40 1 78 0 41 1 78 0 42 1 78 0 44 1 78 0 46 1 78 0 47 2 113 0 49 1 78 0 50 0 223 0 53 1 78 0 55 1 78 0 58 3 9 0 59 3 13 0 61 1 78 0 71 1 78 0 76 0 227 0 84 0 231 0 85 0 235 0 87 1 78 0 106 1 78 0 107 1 78 0 108 1 78 0 109 1 78 0 110 1 78 0 111 1 78 0 112 1 78 0 131 1 78 0 132 1 78 0 133 3 17 0 223 1 78 1 108] 
#[0 0 162 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 35 0 42 0 50 0 55 0 58 0 71 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 1 108] 
#[1 1 82 0 9 1 82 0 10 1 82 0 11 1 82 0 12 1 82 0 21 1 82 0 31 0 239 0 32 1 82 0 33 1 82 0 35 1 82 0 42 1 82 0 50 1 82 0 55 3 29 0 58 1 82 0 71 1 82 0 76 1 82 0 106 1 82 0 107 1 82 0 108 1 82 0 109 1 82 0 110 1 82 0 111 1 82 0 112 1 82 0 133 3 33 0 199 1 82 1 108] 
#[0 4 189 0 136] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 4 193 0 176 1 109 0 222 1 113 0 224 4 197 0 226 1 117 0 227 1 121 1 111] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 4 201 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[0 4 205 0 136] 
#[1 0 18 0 1 1 1 0 3 1 5 0 7 0 22 0 9 0 22 0 10 0 22 0 11 0 22 0 12 1 9 0 13 1 13 0 14 1 17 0 16 0 18 0 20 0 22 0 21 0 22 0 31 0 22 0 32 0 22 0 33 0 22 0 35 0 22 0 42 1 21 0 48 0 22 0 50 0 22 0 55 0 85 0 58 0 22 0 59 1 25 0 61 1 29 0 64 1 33 0 65 0 22 0 71 0 22 0 76 0 22 0 106 0 22 0 107 0 22 0 108 0 22 0 109 0 22 0 110 0 22 0 111 0 22 0 112 1 37 0 131 1 41 0 132 0 22 0 133 1 45 0 134 1 49 0 136 1 53 0 137 0 153 0 139 1 57 0 143 1 61 0 176 3 1 0 185 1 69 0 186 1 73 0 195 4 209 0 196 1 81 0 197 1 85 0 198 1 89 0 200 1 93 0 201 1 97 0 202 1 101 0 211 1 105 0 221 1 109 0 222 1 113 0 224 1 117 0 227 0 22 1 108 1 121 1 111 1 125 1 113] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 4 213 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[0 1 86 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 35 0 42 0 50 0 55 0 58 0 71 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 1 108] 
#[1 1 90 0 2 1 90 0 4 1 90 0 6 1 90 0 13 1 90 0 14 1 90 0 18 1 90 0 22 1 90 0 23 1 90 0 24 1 90 0 29 1 90 0 30 1 90 0 52 1 90 0 58 1 90 0 74 1 90 0 77 1 90 0 78 1 90 0 99 1 90 0 135 4 217 0 212 4 221 0 213 4 225 0 237] 
#[1 1 94 0 42 4 229 0 58 4 233 1 2] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 1 61 0 176 4 237 0 221 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[1 4 241 0 135 4 245 0 225] 
#[0 4 249 0 55] 
#[0 4 253 0 139] 
#[0 5 1 0 135] 
#[1 1 137 0 135 1 141 0 161 5 5 0 164] 
#[0 1 98 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 62 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 96 0 99] 
#[0 1 102 0 11 0 55 0 133] 
#[0 1 102 0 11 0 55 0 133] 
#[0 5 9 0 133] 
#[0 5 13 0 133] 
#[0 5 17 0 133] 
#[0 5 21 0 59] 
#[0 1 106 1 108] 
#[1 2 241 0 135 5 25 0 203] 
#[1 2 241 0 135 5 29 0 203] 
#[1 5 33 0 135 5 37 0 173 5 41 0 174] 
#[1 1 129 0 135 5 45 0 165 5 49 0 180] 
#[1 5 53 0 135 5 57 0 245 5 61 1 67 5 65 1 68] 
#[1 5 53 0 135 5 69 0 245] 
#[1 5 53 0 135 5 57 0 245 5 73 1 67 5 65 1 68] 
#[0 1 110 0 13 0 14 0 52 0 65 0 75 0 78 0 79 0 94 0 99] 
#[0 1 110 0 13 0 14 0 52 0 65 0 75 0 78 0 79 0 94 0 99] 
#[0 1 110 0 13 0 14 0 52 0 65 0 75 0 78 0 79 0 94 0 99] 
#[0 1 114 0 2 0 4 0 6 0 10 0 13 0 14 0 17 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 54 0 58 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 135] 
#[0 1 118 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 99] 
#[1 0 34 0 13 0 34 0 14 0 34 0 52 0 34 0 65 0 34 0 75 0 34 0 78 0 34 0 79 0 34 0 94 0 34 0 99 5 77 0 154 1 177 1 63] 
#[0 1 122 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 99] 
#[1 0 34 0 13 0 34 0 14 0 34 0 52 0 34 0 65 0 34 0 75 0 34 0 78 0 34 0 79 0 34 0 94 0 34 0 99 5 81 0 154 1 177 1 63] 
#[0 1 110 0 13 0 14 0 52 0 65 0 75 0 78 0 79 0 94 0 99] 
#[0 1 110 0 13 0 14 0 52 0 65 0 75 0 78 0 79 0 94 0 99] 
#[0 1 126 0 2 0 4 0 6 0 10 0 13 0 14 0 17 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 54 0 58 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 135] 
#[1 1 130 0 2 1 130 0 4 1 130 0 6 1 130 0 10 1 130 0 13 1 130 0 14 1 130 0 17 1 130 0 18 1 130 0 22 1 130 0 23 1 130 0 24 1 130 0 29 1 130 0 30 1 130 0 52 1 130 0 54 1 130 0 58 1 130 0 65 1 130 0 74 1 130 0 75 1 130 0 77 1 130 0 78 1 130 0 79 1 130 0 86 1 130 0 94 1 130 0 96 1 130 0 99 5 85 0 100 5 89 0 102 1 130 0 135 5 93 1 41] 
#[0 1 134 0 2 0 4 0 6 0 10 0 13 0 14 0 17 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 54 0 58 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 135] 
#[1 1 138 0 2 1 138 0 4 1 138 0 6 1 138 0 10 1 138 0 13 1 138 0 14 1 138 0 17 1 138 0 18 1 138 0 22 1 138 0 23 1 138 0 24 1 138 0 29 1 138 0 30 1 138 0 52 1 138 0 54 1 138 0 58 1 138 0 65 1 138 0 74 1 138 0 75 1 138 0 77 1 138 0 78 1 138 0 79 1 138 0 86 1 138 0 94 1 138 0 96 1 138 0 99 5 85 0 100 5 89 0 102 1 138 0 135 5 97 1 41] 
#[0 5 101 0 133] 
#[0 1 142 0 13 0 14 0 52 0 65 0 75 0 78 0 79 0 94 0 99] 
#[0 1 110 0 13 0 14 0 52 0 65 0 75 0 78 0 79 0 94 0 99] 
#[1 0 34 0 13 0 34 0 14 0 34 0 52 5 105 0 62 0 34 0 65 0 34 0 75 0 34 0 78 0 34 0 79 0 34 0 94 0 34 0 99 5 109 0 149 5 113 0 153 1 173 0 154 1 177 1 63] 
#[1 1 146 0 4 1 146 0 13 1 146 0 14 1 146 0 17 1 146 0 52 1 146 0 54 1 146 0 65 1 146 0 78 1 146 0 86 1 146 0 96 1 146 0 99 5 117 0 162] 
#[1 0 6 0 2 0 6 0 4 0 6 0 13 0 6 0 14 0 6 0 17 0 21 0 51 0 6 0 52 0 6 0 54 0 6 0 65 0 6 0 74 0 6 0 75 0 6 0 77 0 6 0 78 0 6 0 86 0 6 0 99 5 121 0 148] 
#[1 1 150 0 4 1 150 0 17 5 125 0 86 5 129 0 158] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 5 133 0 176 1 109 0 222 1 113 0 224 1 117 0 227 5 137 1 86 5 141 1 88 5 145 1 89 5 149 1 90 5 153 1 91 5 157 1 92 1 121 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 5 161 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 5 165 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 5 169 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[0 1 154 0 4 0 5 0 8 0 9 0 10 0 11 0 12 0 17 0 21 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 1 221 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 5 173 1 105 0 253 1 111] 
#[0 1 158 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 14 0 17 0 77 0 26 0 14 0 43 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 14 0 67 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 14 0 80 0 14 0 81 0 117 0 82 0 121 0 83 0 14 0 86 0 125 0 88 0 129 0 90 0 14 0 91 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 0 14 1 108 5 177 1 110 0 253 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 5 181 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 14 0 17 0 77 0 26 0 14 0 43 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 14 0 67 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 14 0 80 0 14 0 81 0 117 0 82 0 121 0 83 0 14 0 86 0 125 0 88 0 129 0 90 0 14 0 91 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 0 14 1 108 5 185 1 110 0 253 1 111] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 77 0 26 0 14 0 43 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 5 189 0 80 0 117 0 82 0 121 0 83 0 125 0 88 0 129 0 90 0 14 0 91 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 5 193 1 49 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 5 197 1 83 5 201 1 85 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 1 253 1 110 0 253 1 111] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 14 0 17 0 77 0 26 0 14 0 43 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 14 0 67 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 14 0 80 0 14 0 81 0 117 0 82 0 121 0 83 0 14 0 86 0 125 0 88 0 129 0 90 0 14 0 91 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 5 205 1 110 0 253 1 111] 
#[1 1 162 0 4 5 209 0 91 5 213 1 82] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 5 217 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[0 1 166 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[1 5 221 0 10 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 4 81 1 36 0 225 1 94 0 237 1 98 5 225 1 99 0 241 1 100 0 245 1 103 4 89 1 107 0 253 1 111] 
#[1 5 229 0 8 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[1 5 233 0 8 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[1 2 241 0 135 5 237 0 203] 
#[0 1 170 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 14 0 17 0 77 0 26 0 14 0 43 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 14 0 67 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 14 0 80 0 14 0 81 0 117 0 82 0 121 0 83 0 14 0 86 0 125 0 88 0 129 0 90 0 14 0 91 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 0 14 1 108 5 241 1 110 0 253 1 111] 
#[0 1 174 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[1 1 178 0 31 0 162 0 32 0 162 0 35 1 178 0 50 0 162 0 58] 
#[1 5 245 0 31 5 249 0 50] 
#[0 1 174 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[1 1 182 0 4 1 182 0 5 1 182 0 8 1 182 0 9 1 182 0 10 1 182 0 17 1 182 0 21 0 243 0 31 0 247 0 32 1 182 0 33 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 1 182 0 42 1 182 0 43 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 1 182 0 50 0 251 0 53 0 255 0 55 2 125 0 58 2 129 0 59 2 133 0 61 1 182 0 67 1 182 0 69 1 182 0 71 1 182 0 76 1 182 0 80 1 182 0 81 1 3 0 84 1 7 0 85 1 182 0 86 1 11 0 87 1 182 0 91 1 182 0 92 1 182 0 93 1 182 0 106 1 182 0 107 1 182 0 108 1 182 0 109 1 182 0 110 1 182 0 111 1 182 0 112 1 182 0 130 2 149 0 131 2 153 0 132 1 182 0 133 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102 1 182 1 108] 
#[1 1 186 0 9 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 1 186 0 50 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[1 5 253 0 9 6 1 0 50] 
#[0 1 190 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[0 1 190 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[0 1 194 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[1 1 198 0 8 1 198 0 10 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 1 198 0 50 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[1 6 5 0 10 6 9 0 50] 
#[1 6 13 0 8 1 202 0 10 1 202 0 50] 
#[1 1 206 0 4 1 206 0 5 1 206 0 8 1 206 0 9 1 206 0 10 1 206 0 17 1 206 0 21 1 15 0 31 1 19 0 32 1 206 0 33 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 1 206 0 42 1 206 0 43 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 1 206 0 50 1 23 0 53 1 27 0 55 2 125 0 58 2 129 0 59 2 133 0 61 1 206 0 67 1 206 0 69 1 206 0 71 1 206 0 76 1 206 0 80 1 206 0 81 1 31 0 84 1 35 0 85 1 206 0 86 1 39 0 87 1 206 0 91 1 206 0 92 1 206 0 93 1 206 0 106 1 206 0 107 1 206 0 108 1 206 0 109 1 206 0 110 1 206 0 111 1 206 0 112 1 206 0 130 2 149 0 131 2 153 0 132 1 206 0 133 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102 1 206 1 108] 
#[0 1 210 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[1 0 138 0 10 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 6 17 0 136 1 53 0 137 0 153 0 139 1 57 0 143 2 209 0 176 6 21 0 209 1 109 0 222 1 113 0 224 1 117 0 227 2 213 0 228 2 217 0 229 2 221 0 230 2 225 0 231 2 229 0 232 2 233 0 233 1 121 1 111] 
#[1 0 158 0 5 1 214 0 9 1 214 0 10 1 214 0 11 1 214 0 12 1 214 0 21 1 43 0 31 1 47 0 32 1 214 0 33 2 69 0 34 1 214 0 35 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 1 214 0 42 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 1 214 0 50 2 117 0 53 1 214 0 55 1 214 0 58 3 9 0 59 3 13 0 61 1 214 0 71 1 214 0 76 2 137 0 84 2 141 0 85 2 145 0 87 1 214 0 106 1 214 0 107 1 214 0 108 1 214 0 109 1 214 0 110 1 214 0 111 1 214 0 112 2 149 0 131 2 153 0 132 1 214 0 133 3 17 0 223 1 214 1 108] 
#[0 1 218 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 35 0 42 0 50 0 55 0 58 0 71 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 1 108] 
#[0 1 222 0 135] 
#[0 1 222 0 135] 
#[0 1 222 0 135] 
#[0 6 25 0 10] 
#[1 1 226 0 9 1 226 0 10 6 29 0 133] 
#[0 1 230 0 9 0 10 0 133] 
#[1 5 53 0 135 6 33 0 245] 
#[1 0 18 0 1 1 1 0 3 1 5 0 7 1 9 0 13 1 13 0 14 1 17 0 16 0 18 0 20 0 22 0 32 0 22 0 35 0 22 0 42 1 21 0 48 0 85 0 58 0 22 0 59 1 25 0 61 1 29 0 64 1 33 0 65 1 37 0 131 1 41 0 132 0 22 0 133 1 45 0 134 1 49 0 136 1 53 0 137 0 153 0 139 1 57 0 143 1 61 0 176 3 1 0 185 1 69 0 186 1 73 0 195 6 37 0 196 1 81 0 197 1 85 0 198 1 89 0 200 1 93 0 201 1 97 0 202 1 101 0 211 1 105 0 221 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111 1 125 1 113] 
#[0 6 41 0 27] 
#[0 6 45 0 133] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 6 49 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 6 53 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[0 1 234 0 10] 
#[0 6 57 0 10] 
#[0 1 238 0 5 0 8 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 71 0 76 0 84 0 85 0 87 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 131 0 132 0 133 1 108] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 2 209 0 176 1 109 0 222 1 113 0 224 1 117 0 227 6 61 0 231 1 121 1 111] 
#[1 6 65 0 136 6 69 0 233] 
#[1 1 242 0 9 1 242 0 10 1 242 0 11 1 242 0 12 1 242 0 21 1 242 0 31 1 51 0 32 1 242 0 33 3 25 0 35 1 242 0 42 1 242 0 50 1 242 0 55 3 29 0 58 1 242 0 71 1 242 0 76 1 242 0 106 1 242 0 107 1 242 0 108 1 242 0 109 1 242 0 110 1 242 0 111 1 242 0 112 1 242 0 133 3 33 0 199 1 242 1 108] 
#[1 1 246 0 2 1 246 0 4 1 246 0 8 1 246 0 9 1 246 0 10 1 246 0 11 1 246 0 12 1 246 0 13 1 246 0 14 1 246 0 17 1 246 0 18 1 246 0 21 1 246 0 22 1 246 0 23 1 246 0 24 1 246 0 29 1 246 0 30 1 246 0 31 1 246 0 32 1 246 0 33 1 246 0 35 1 246 0 42 1 246 0 43 1 246 0 50 1 246 0 52 1 246 0 55 1 246 0 58 6 73 0 59 1 246 0 61 1 246 0 67 1 246 0 71 1 246 0 74 1 246 0 76 1 246 0 77 1 246 0 78 1 246 0 80 1 246 0 81 1 246 0 86 1 246 0 91 1 246 0 99 1 246 0 106 1 246 0 107 1 246 0 108 1 246 0 109 1 246 0 110 1 246 0 111 1 246 0 112 1 246 0 133 1 246 0 135 1 246 1 108] 
#[0 1 250 0 5 0 8 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 71 0 76 0 84 0 85 0 87 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 131 0 132 0 133 1 108] 
#[1 1 254 0 10 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 1 254 0 50 2 117 0 53 3 9 0 59 3 13 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 3 17 0 223] 
#[1 6 77 0 10 6 81 0 50] 
#[1 2 2 0 5 2 2 0 8 2 2 0 9 2 2 0 10 2 2 0 11 2 2 0 12 2 2 0 21 1 55 0 31 1 59 0 32 2 2 0 33 2 69 0 34 2 2 0 35 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 2 0 42 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 2 2 0 50 1 63 0 53 2 2 0 55 2 2 0 58 3 9 0 59 3 13 0 61 2 2 0 71 2 2 0 76 1 67 0 84 1 71 0 85 1 75 0 87 2 2 0 106 2 2 0 107 2 2 0 108 2 2 0 109 2 2 0 110 2 2 0 111 2 2 0 112 2 149 0 131 2 153 0 132 2 2 0 133 3 17 0 223 2 2 1 108] 
#[0 2 6 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 35 0 42 0 50 0 55 0 58 0 59 0 71 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 1 108] 
#[1 2 10 0 9 2 10 0 10 2 10 0 11 2 10 0 12 2 10 0 21 2 10 0 31 1 79 0 32 2 10 0 33 2 10 0 42 2 10 0 50 2 10 0 55 3 29 0 58 2 10 0 71 2 10 0 76 2 10 0 106 2 10 0 107 2 10 0 108 2 10 0 109 2 10 0 110 2 10 0 111 2 10 0 112 2 10 0 133 3 33 0 199 2 10 1 108] 
#[1 6 85 0 9 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 3 9 0 59 3 13 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 3 17 0 223] 
#[0 6 89 0 4] 
#[1 2 14 0 4 2 14 0 6 2 14 0 10 2 14 0 18 2 14 0 23 2 14 0 24 2 14 0 29 2 14 0 30 6 93 0 214] 
#[1 6 97 0 2 2 18 0 4 2 18 0 6 2 18 0 10 6 101 0 13 6 105 0 14 2 18 0 18 6 109 0 22 2 18 0 23 2 18 0 24 2 18 0 29 2 18 0 30 3 109 0 52 6 113 0 58 6 117 0 74 6 121 0 77 3 117 0 78 3 125 0 99 5 53 0 135 6 125 0 169 6 129 0 170 6 133 0 171 6 137 0 172 6 141 0 244 6 145 0 245 3 141 0 246 6 149 0 247 6 153 0 248 6 157 0 249 6 161 0 250 6 165 0 251 6 169 0 252 6 173 0 253 6 177 0 254 6 181 0 255 6 185 1 0 6 189 1 1 6 193 1 9 6 197 1 10 6 201 1 11 6 205 1 12 6 209 1 13 6 213 1 14 6 217 1 15 6 221 1 16 6 225 1 17 6 229 1 18 6 233 1 19 6 237 1 20 6 241 1 21 6 245 1 22 6 249 1 23 6 253 1 24 7 1 1 25 3 169 1 59 3 173 1 60 3 177 1 61 3 181 1 62] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 7 5 0 176 7 9 0 202 1 105 0 221 1 109 0 222 1 113 0 224 1 117 0 227 7 13 1 3 7 17 1 4 1 121 1 111] 
#[0 7 21 0 42] 
#[0 2 22 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 35 0 42 0 50 0 55 0 58 0 71 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 1 108] 
#[0 2 26 0 31 0 50] 
#[1 7 25 0 31 7 29 0 50] 
#[1 0 18 0 1 7 33 0 2 1 1 0 3 1 5 0 7 0 22 0 11 0 22 0 12 1 9 0 13 1 13 0 14 1 17 0 16 7 37 0 19 0 18 0 20 7 41 0 27 0 22 0 32 0 22 0 35 1 21 0 48 7 45 0 56 0 85 0 58 0 22 0 59 7 49 0 61 1 29 0 64 1 33 0 65 1 37 0 131 1 41 0 132 0 22 0 133 1 45 0 134 1 49 0 136 1 53 0 137 0 153 0 139 1 57 0 143 1 61 0 176 7 53 0 182 7 57 0 184 7 61 0 185 7 65 0 186 7 69 0 187 7 73 0 190 7 77 0 191 7 81 0 192 7 85 0 193 7 89 0 194 1 73 0 195 1 77 0 196 1 81 0 197 1 85 0 198 1 89 0 200 1 93 0 201 1 97 0 202 1 101 0 211 1 105 0 221 1 109 0 222 1 113 0 224 1 117 0 227 7 93 1 5 1 121 1 111 7 97 1 113] 
#[0 2 30 0 50 0 133] 
#[0 2 34 0 11 0 12 0 50 0 53 0 59 0 133] 
#[0 2 38 0 50 0 133] 
#[0 2 42 0 4 0 17 0 56 0 86 0 96 1 108] 
#[0 2 46 0 13 0 14 0 51 0 52 0 65 0 75 0 78 0 79 0 94 0 99] 
#[0 2 50 0 13 0 14 0 51 0 52 0 62 0 65 0 75 0 78 0 79 0 94 0 99] 
#[0 2 54 1 108] 
#[1 0 134 0 8 2 181 0 61 0 134 0 133 7 101 0 205] 
#[1 2 181 0 61 0 134 0 133 7 105 0 205] 
#[1 7 109 0 8 2 58 0 55 7 113 0 175] 
#[1 2 62 0 2 2 62 0 4 2 62 0 6 2 62 0 10 2 62 0 13 2 62 0 14 2 62 0 17 2 62 0 18 2 62 0 22 2 62 0 23 2 62 0 24 2 62 0 29 2 62 0 30 2 62 0 52 2 62 0 54 2 62 0 58 2 62 0 65 2 62 0 74 2 62 0 75 2 62 0 77 2 62 0 78 2 62 0 79 2 62 0 86 2 62 0 94 2 62 0 96 2 62 0 99 5 33 0 135 7 117 0 174] 
#[0 2 66 0 2 0 4 0 6 0 10 0 13 0 14 0 17 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 54 0 58 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 135] 
#[0 2 70 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 135] 
#[1 2 74 0 2 2 74 0 4 2 74 0 13 2 74 0 14 2 74 0 17 2 74 0 52 2 74 0 54 2 74 0 65 2 74 0 74 2 74 0 75 2 74 0 77 2 74 0 78 2 74 0 79 2 74 0 86 2 74 0 94 2 74 0 96 2 74 0 99 1 129 0 135 7 121 0 165] 
#[0 2 78 0 8 0 9 0 10 0 50 0 133] 
#[1 7 125 0 8 7 129 0 50] 
#[1 2 82 0 2 2 82 0 4 2 82 0 6 2 82 0 10 2 82 0 13 2 82 0 14 2 82 0 17 2 82 0 18 2 82 0 22 2 82 0 23 2 82 0 24 2 82 0 29 2 82 0 30 2 82 0 52 2 82 0 54 2 82 0 58 2 82 0 65 2 82 0 74 2 82 0 75 2 82 0 77 2 82 0 78 2 82 0 79 2 82 0 86 2 82 0 94 2 82 0 96 2 82 0 99 5 53 0 135 5 57 0 245 7 133 1 68] 
#[0 2 86 0 2 0 4 0 6 0 10 0 13 0 14 0 17 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 54 0 58 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 135] 
#[1 7 129 0 50 7 137 0 133] 
#[1 2 82 0 2 2 82 0 4 2 82 0 6 2 82 0 10 2 82 0 13 2 82 0 14 2 82 0 17 2 82 0 18 2 82 0 22 2 82 0 23 2 82 0 24 2 82 0 29 2 82 0 30 2 82 0 52 2 82 0 54 2 82 0 58 2 82 0 65 2 82 0 74 2 82 0 75 2 82 0 77 2 82 0 78 2 82 0 79 2 82 0 86 2 82 0 94 2 82 0 96 2 82 0 99 5 53 0 135 5 57 0 245 7 133 1 68] 
#[0 2 90 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 99] 
#[0 2 94 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 99] 
#[1 7 141 0 133 7 145 0 135 7 149 0 139] 
#[0 7 153 0 133] 
#[1 2 98 0 2 2 98 0 4 2 98 0 6 2 98 0 10 2 98 0 11 2 98 0 12 2 98 0 13 2 98 0 14 2 98 0 17 2 98 0 18 2 98 0 22 2 98 0 23 2 98 0 24 2 98 0 25 2 98 0 29 2 98 0 30 2 98 0 52 2 98 0 54 2 98 0 58 2 98 0 65 2 98 0 74 2 98 0 75 2 98 0 77 2 98 0 78 2 98 0 79 2 98 0 86 2 98 0 94 2 98 0 96 2 98 0 99 2 98 0 100 2 98 0 101 2 98 0 102 2 98 0 103 2 98 0 104 2 98 0 105 2 98 0 108 2 98 0 114 2 98 0 115 2 98 0 116 2 98 0 117 2 98 0 118 2 98 0 119 2 98 0 120 2 98 0 121 2 98 0 122 2 98 0 123 2 98 0 124 2 98 0 125 2 98 0 126 2 98 0 127 2 98 0 128 2 98 0 129 2 98 0 135 7 157 0 207] 
#[1 2 98 0 2 2 98 0 4 2 98 0 6 2 98 0 10 2 98 0 11 2 98 0 12 2 98 0 13 2 98 0 14 2 98 0 17 2 98 0 18 2 98 0 22 2 98 0 23 2 98 0 24 2 98 0 25 2 98 0 29 2 98 0 30 2 98 0 52 2 98 0 54 2 98 0 58 2 98 0 65 2 98 0 74 2 98 0 75 2 98 0 77 2 98 0 78 2 98 0 79 2 98 0 86 2 98 0 94 2 98 0 96 2 98 0 99 2 98 0 100 2 98 0 101 2 98 0 102 2 98 0 103 2 98 0 104 2 98 0 105 2 98 0 108 2 98 0 114 2 98 0 115 2 98 0 116 2 98 0 117 2 98 0 118 2 98 0 119 2 98 0 120 2 98 0 121 2 98 0 122 2 98 0 123 2 98 0 124 2 98 0 125 2 98 0 126 2 98 0 127 2 98 0 128 2 98 0 129 2 98 0 135 7 161 0 207] 
#[0 2 102 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 59 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 99] 
#[0 7 165 0 135] 
#[0 7 169 0 59] 
#[0 2 106 0 13 0 14 0 52 0 62 0 65 0 75 0 78 0 79 0 94 0 99] 
#[1 2 110 0 4 3 101 0 13 3 105 0 14 2 110 0 17 3 109 0 52 7 173 0 54 3 113 0 65 3 117 0 78 2 110 0 86 2 110 0 96 3 125 0 99 7 177 0 166 7 181 0 167 7 185 0 168 7 189 0 169 7 193 0 170 7 197 0 171 7 201 0 172 3 141 0 246 6 217 1 15 6 221 1 16 6 233 1 19 6 237 1 20 3 169 1 59 3 173 1 60 3 177 1 61 3 181 1 62] 
#[1 2 114 0 2 2 114 0 4 2 114 0 13 2 114 0 14 2 114 0 17 2 114 0 52 2 114 0 54 2 114 0 65 2 114 0 74 2 114 0 75 2 114 0 77 2 114 0 78 2 114 0 86 2 114 0 99 7 205 1 47] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 14 0 17 0 77 0 26 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 117 0 82 0 121 0 83 0 125 0 88 0 129 0 90 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 7 209 1 49 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 1 253 1 110 0 253 1 111] 
#[1 2 118 0 4 7 213 0 17 7 217 0 159] 
#[1 7 221 0 5 2 122 0 8 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 2 122 0 50 2 117 0 53 3 9 0 59 3 13 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 3 17 0 223] 
#[1 2 126 0 4 7 225 0 43 7 229 1 87] 
#[1 1 50 0 4 1 50 0 43 7 233 0 133 7 237 0 217] 
#[0 2 130 0 4 0 43 0 133] 
#[0 7 241 0 8] 
#[1 2 134 0 8 2 138 0 50] 
#[0 7 245 0 50] 
#[1 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 2 137 0 84 2 141 0 85 2 145 0 87 7 249 0 92 7 253 0 93 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 8 1 1 95 2 165 1 101 2 169 1 102] 
#[1 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 8 5 0 71 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[1 2 142 0 9 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 2 142 0 50 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[0 2 146 0 9 0 50] 
#[1 2 150 0 4 2 150 0 17 8 9 0 43 2 150 0 67 2 150 0 80 2 150 0 81 2 150 0 86 2 150 0 91 2 150 0 133 2 150 1 108] 
#[1 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 2 154 0 50 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 2 154 0 71 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[0 2 158 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[1 2 241 0 135 8 13 0 203] 
#[1 2 162 0 4 8 17 0 43 2 162 0 91 4 1 0 133 8 21 1 84] 
#[1 2 162 0 4 8 17 0 43 5 189 0 80 2 162 0 91 8 25 1 84 8 29 1 85] 
#[0 2 166 0 4 0 43 0 80 0 91] 
#[0 2 170 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 77 0 26 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 117 0 82 0 121 0 83 0 125 0 88 0 129 0 90 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 8 33 1 49 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 1 253 1 110 0 253 1 111] 
#[0 8 37 0 4] 
#[1 2 174 0 4 2 174 0 17 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 174 0 43 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 2 174 0 67 2 174 0 80 2 174 0 81 2 137 0 84 2 141 0 85 2 174 0 86 2 145 0 87 2 174 0 91 2 149 0 131 2 153 0 132 2 174 0 133 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102 2 174 1 108] 
#[0 2 178 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[1 8 41 0 10 6 9 0 50] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 8 45 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 8 49 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[0 2 182 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 2 186 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 2 190 0 4 0 5 0 8 0 9 0 10 0 11 0 12 0 17 0 21 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[1 0 18 0 1 1 1 0 3 1 5 0 7 1 9 0 13 1 13 0 14 1 17 0 16 0 18 0 20 0 22 0 31 0 22 0 32 0 22 0 35 1 21 0 48 0 22 0 50 0 85 0 58 0 22 0 59 1 25 0 61 1 29 0 64 1 33 0 65 1 37 0 131 1 41 0 132 1 45 0 134 1 49 0 136 1 53 0 137 0 153 0 139 1 57 0 143 1 61 0 176 8 53 0 185 1 69 0 186 1 73 0 195 1 77 0 196 1 81 0 197 1 85 0 198 1 89 0 200 1 93 0 201 1 97 0 202 1 101 0 211 1 105 0 221 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111 1 125 1 113] 
#[0 2 194 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 8 57 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[0 2 198 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 4 81 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 8 61 1 107 0 253 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 8 65 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[1 4 153 0 8 0 146 0 10 0 146 0 31 0 146 0 32 0 146 0 34 0 146 0 36 0 146 0 37 0 146 0 38 0 146 0 39 0 146 0 40 0 146 0 41 0 146 0 44 0 146 0 46 0 146 0 47 0 146 0 49 1 83 0 50 0 146 0 53 0 146 0 55 0 146 0 59 0 146 0 61 0 146 0 84 0 146 0 85 0 146 0 87 0 146 0 131 0 146 0 132] 
#[0 8 73 0 10] 
#[0 2 202 0 8 0 42 0 133] 
#[1 4 113 0 52 4 117 0 98 4 121 0 99 1 30 0 135 8 77 1 44 4 137 1 45] 
#[1 8 81 0 8 2 206 0 9 2 206 0 10 7 129 0 50 2 206 0 133] 
#[1 2 49 0 32 3 25 0 35 4 145 0 42 3 29 0 58 1 34 0 133 3 33 0 199 8 85 0 206] 
#[0 2 210 0 133] 
#[1 2 98 0 2 2 98 0 4 2 98 0 9 2 98 0 10 2 98 0 11 2 98 0 12 2 98 0 13 2 98 0 14 2 98 0 17 2 98 0 21 2 98 0 25 2 98 0 31 2 98 0 32 2 98 0 33 2 98 0 35 2 98 0 42 2 98 0 50 2 98 0 52 2 98 0 54 2 98 0 55 2 98 0 58 2 98 0 65 2 98 0 71 2 98 0 74 2 98 0 75 2 98 0 76 2 98 0 77 2 98 0 78 2 98 0 79 2 98 0 86 2 98 0 94 2 98 0 96 2 98 0 99 2 98 0 100 2 98 0 101 2 98 0 102 2 98 0 103 2 98 0 104 2 98 0 105 2 98 0 106 2 98 0 107 2 98 0 108 2 98 0 109 2 98 0 110 2 98 0 111 2 98 0 112 2 98 0 114 2 98 0 115 2 98 0 116 2 98 0 117 2 98 0 118 2 98 0 119 2 98 0 120 2 98 0 121 2 98 0 122 2 98 0 123 2 98 0 124 2 98 0 125 2 98 0 126 2 98 0 127 2 98 0 128 2 98 0 129 2 98 0 133 2 98 0 135 8 89 0 207 2 98 1 108] 
#[1 2 214 0 10 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 3 9 0 59 3 13 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 214 0 133 3 17 0 223] 
#[1 2 218 0 10 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 2 218 0 50 2 117 0 53 3 9 0 59 3 13 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 3 17 0 223] 
#[0 2 222 0 5 0 8 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 71 0 76 0 84 0 85 0 87 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 131 0 132 0 133 1 108] 
#[0 2 226 0 10 0 50] 
#[0 4 153 0 8] 
#[0 2 230 0 10 0 133] 
#[0 8 93 0 135] 
#[0 2 234 0 5 0 8 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 71 0 76 0 84 0 85 0 87 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 131 0 132 0 133 1 108] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 8 97 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[0 2 238 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 35 0 42 0 50 0 55 0 58 0 71 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 1 108] 
#[0 2 242 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 35 0 42 0 50 0 55 0 58 0 71 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 1 108] 
#[1 2 246 0 4 8 101 0 6 2 246 0 10 8 105 0 18 8 109 0 23 8 113 0 24 8 117 0 29 8 121 0 30 8 125 0 215 8 129 0 238 8 133 0 239 8 137 0 240 8 141 0 241 8 145 0 242] 
#[1 3 101 0 13 3 105 0 14 6 109 0 22 3 117 0 78 8 149 0 97 3 125 0 99 8 153 0 246 8 157 1 25 8 161 1 59 8 165 1 60 8 169 1 61 8 173 1 62] 
#[1 2 241 0 135 8 177 0 203] 
#[1 2 241 0 135 8 181 0 203] 
#[0 8 185 0 135] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 8 189 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[1 2 241 0 135 8 193 0 203] 
#[1 2 241 0 135 8 197 0 203] 
#[0 2 250 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 2 254 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 2 254 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 2 250 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 3 2 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[1 8 201 0 8 7 129 0 50] 
#[0 2 250 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[1 8 205 0 2 3 101 0 13 3 105 0 14 6 117 0 74 6 121 0 77 8 209 0 170 8 213 0 171 8 217 0 247 8 221 0 249 8 225 0 254 8 229 0 255 8 233 1 0 6 201 1 11 6 205 1 12 6 209 1 13 6 213 1 14 6 217 1 15 6 221 1 16 6 225 1 17 6 229 1 18 6 233 1 19 6 237 1 20 6 241 1 21 6 245 1 22 6 249 1 23 6 253 1 24 3 169 1 59 3 173 1 60 3 177 1 61 3 181 1 62] 
#[0 2 250 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 2 250 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 2 250 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 2 250 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 2 250 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 2 254 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 2 254 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 2 254 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 3 6 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 3 10 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 3 10 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 3 14 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[1 3 14 0 2 3 14 0 4 3 14 0 6 3 14 0 10 3 14 0 13 3 14 0 14 3 14 0 18 3 14 0 22 3 14 0 23 3 14 0 24 3 14 0 29 3 14 0 30 3 14 0 52 3 14 0 58 3 14 0 74 3 14 0 77 3 14 0 78 3 14 0 99 5 85 0 100 5 89 0 102 3 14 0 135 8 237 1 41] 
#[0 3 18 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[1 3 18 0 2 3 18 0 4 3 18 0 6 3 18 0 10 3 18 0 13 3 18 0 14 3 18 0 18 3 18 0 22 3 18 0 23 3 18 0 24 3 18 0 29 3 18 0 30 3 18 0 52 3 18 0 58 3 18 0 74 3 18 0 77 3 18 0 78 3 18 0 99 5 85 0 100 5 89 0 102 3 18 0 135 8 241 1 41] 
#[0 3 22 0 2 0 4 0 6 0 10 0 13 0 14 0 17 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 54 0 58 0 65 0 74 0 77 0 78 0 86 0 96 0 99 0 135] 
#[0 3 22 0 2 0 4 0 6 0 10 0 13 0 14 0 17 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 54 0 58 0 65 0 74 0 77 0 78 0 86 0 96 0 99 0 135] 
#[0 3 26 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 3 26 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 3 30 0 2 0 4 0 6 0 10 0 13 0 14 0 17 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 54 0 58 0 65 0 74 0 77 0 78 0 86 0 96 0 99 0 135] 
#[0 3 30 0 2 0 4 0 6 0 10 0 13 0 14 0 17 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 54 0 58 0 65 0 74 0 77 0 78 0 86 0 96 0 99 0 135] 
#[0 3 34 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 3 34 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 3 38 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[1 3 38 0 2 3 38 0 4 3 38 0 6 3 38 0 10 3 38 0 13 3 38 0 14 3 38 0 18 3 38 0 22 3 38 0 23 3 38 0 24 3 38 0 29 3 38 0 30 3 38 0 52 3 38 0 58 3 38 0 74 3 38 0 77 3 38 0 78 3 38 0 99 5 85 0 100 5 89 0 102 3 38 0 135 8 245 1 41] 
#[0 3 42 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[1 0 158 0 5 3 46 0 9 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 3 46 0 50 2 117 0 53 3 9 0 59 3 13 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 3 17 0 223] 
#[0 3 46 0 9 0 50] 
#[1 8 249 0 9 8 253 0 50] 
#[0 3 50 0 9 0 50] 
#[1 0 18 0 1 1 1 0 3 1 5 0 7 0 22 0 9 0 22 0 10 0 22 0 11 0 22 0 12 1 9 0 13 1 13 0 14 1 17 0 16 0 18 0 20 0 22 0 21 0 22 0 31 0 22 0 32 0 22 0 33 0 22 0 35 0 22 0 42 1 21 0 48 0 22 0 50 9 1 0 52 0 22 0 55 0 85 0 58 0 22 0 59 1 25 0 61 1 29 0 64 1 33 0 65 0 22 0 71 0 22 0 76 0 22 0 106 0 22 0 107 0 22 0 108 0 22 0 109 0 22 0 110 0 22 0 111 0 22 0 112 1 37 0 131 1 41 0 132 0 22 0 133 1 45 0 134 1 49 0 136 1 53 0 137 0 153 0 139 1 57 0 143 1 61 0 176 3 1 0 185 1 69 0 186 1 73 0 195 9 5 0 196 1 81 0 197 1 85 0 198 1 89 0 200 1 93 0 201 1 97 0 202 1 101 0 211 1 105 0 221 1 109 0 222 1 113 0 224 1 117 0 227 0 22 1 108 1 121 1 111 1 125 1 113] 
#[0 3 54 0 2 0 4 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 17 0 18 0 21 0 22 0 23 0 24 0 29 0 30 0 31 0 32 0 33 0 35 0 42 0 43 0 50 0 52 0 55 0 58 0 59 0 61 0 67 0 71 0 74 0 76 0 77 0 78 0 80 0 81 0 86 0 91 0 99 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 0 135 1 108] 
#[0 9 9 0 135] 
#[1 3 58 0 2 3 58 0 4 3 58 0 11 3 58 0 12 3 58 0 13 3 58 0 14 3 58 0 15 3 58 0 18 3 58 0 22 3 58 0 23 3 58 0 24 3 58 0 25 3 58 0 28 3 58 0 29 3 58 0 30 9 13 0 42 3 58 0 52 3 58 0 58 3 58 0 61 3 58 0 74 3 58 0 77 3 58 0 78 3 58 0 99 3 58 0 133 3 58 0 135 9 17 0 234] 
#[0 3 62 0 2 0 4 0 11 0 12 0 13 0 14 0 22 0 58 0 61 0 133] 
#[1 3 66 0 2 3 66 0 4 3 66 0 13 3 66 0 14 3 66 0 18 3 66 0 22 3 66 0 23 3 66 0 24 3 66 0 29 3 66 0 30 3 66 0 52 3 66 0 58 9 21 0 61 3 66 0 74 3 66 0 77 3 66 0 78 3 66 0 99 3 66 0 135 9 25 0 235] 
#[0 3 62 0 2 0 4 0 11 0 12 0 13 0 14 0 22 0 58 0 61 0 133] 
#[1 0 138 0 10 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 9 29 0 135 2 205 0 136 1 53 0 137 0 153 0 139 1 57 0 143 2 209 0 176 9 33 0 188 9 37 0 189 1 109 0 222 1 113 0 224 1 117 0 227 2 213 0 228 2 217 0 229 2 221 0 230 2 225 0 231 2 229 0 232 2 233 0 233 1 121 1 111] 
#[0 3 70 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 135 1 108] 
#[0 9 41 0 133] 
#[1 3 73 0 11 3 77 0 12 0 162 0 32 0 162 0 35 0 162 0 58 0 194 0 133 9 45 0 150] 
#[1 3 74 0 2 3 74 0 4 3 74 0 13 3 74 0 14 3 74 0 17 0 162 0 32 0 162 0 35 3 74 0 52 3 74 0 54 0 162 0 58 3 74 0 65 3 74 0 74 3 74 0 75 3 74 0 77 3 74 0 78 3 74 0 79 3 74 0 86 3 74 0 94 3 74 0 96 3 74 0 99 3 74 0 135 3 74 1 108] 
#[1 3 73 0 11 3 77 0 12 0 194 0 133 9 49 0 150] 
#[0 3 78 0 11 0 12 0 133] 
#[0 3 78 0 11 0 12 0 133] 
#[0 3 78 0 11 0 12 0 133] 
#[0 3 78 0 11 0 12 0 133] 
#[0 3 78 0 11 0 12 0 133] 
#[1 3 66 0 2 3 66 0 4 3 82 0 11 3 82 0 12 3 66 0 13 3 66 0 14 3 66 0 22 3 66 0 58 9 21 0 61 3 82 0 133 9 53 0 235] 
#[1 3 74 0 2 3 74 0 4 3 74 0 13 3 74 0 14 3 74 0 17 0 162 0 32 0 162 0 35 3 74 0 52 3 74 0 54 0 162 0 58 3 74 0 65 3 74 0 74 3 74 0 75 3 74 0 77 3 74 0 78 3 74 0 79 3 74 0 86 3 74 0 94 3 74 0 96 3 74 0 99 3 74 0 135 3 74 1 108] 
#[1 7 109 0 8 2 58 0 133 9 57 0 175] 
#[0 9 61 0 133] 
#[1 0 18 0 1 1 1 0 3 1 5 0 7 1 9 0 13 1 13 0 14 1 17 0 16 0 18 0 20 0 22 0 21 0 22 0 32 0 22 0 33 0 22 0 35 0 22 0 42 1 21 0 48 0 22 0 55 0 85 0 58 0 22 0 59 1 25 0 61 1 29 0 64 1 33 0 65 0 22 0 71 0 22 0 76 0 22 0 106 0 22 0 107 0 22 0 108 0 22 0 109 0 22 0 110 0 22 0 111 0 22 0 112 1 37 0 131 1 41 0 132 0 22 0 133 1 45 0 134 1 49 0 136 1 53 0 137 0 153 0 139 1 57 0 143 1 61 0 176 3 1 0 185 1 69 0 186 1 73 0 195 9 65 0 196 1 81 0 197 1 85 0 198 1 89 0 200 1 93 0 201 1 97 0 202 1 101 0 211 1 105 0 221 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111 1 125 1 113] 
#[0 9 69 0 55] 
#[0 3 86 0 2 0 4 0 6 0 10 0 13 0 14 0 17 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 54 0 58 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 135] 
#[0 3 90 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 135] 
#[1 0 18 0 1 1 1 0 3 1 5 0 7 0 22 0 11 0 22 0 12 1 9 0 13 1 13 0 14 1 17 0 16 0 18 0 20 0 22 0 32 0 22 0 35 1 21 0 48 0 22 0 55 0 85 0 58 0 22 0 59 1 25 0 61 1 29 0 64 1 33 0 65 1 37 0 131 1 41 0 132 0 22 0 133 1 45 0 134 1 49 0 136 1 53 0 137 0 153 0 139 1 57 0 143 1 61 0 176 3 1 0 185 1 69 0 186 1 73 0 195 9 73 0 196 1 81 0 197 1 85 0 198 1 89 0 200 1 93 0 201 1 97 0 202 1 101 0 211 1 105 0 221 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111 1 125 1 113] 
#[0 9 77 0 135] 
#[0 3 94 0 2 0 4 0 6 0 10 0 13 0 14 0 17 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 54 0 58 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 135] 
#[0 3 98 0 13 0 14 0 52 0 65 0 75 0 78 0 79 0 94 0 99] 
#[0 3 102 0 2 0 4 0 6 0 9 0 10 0 11 0 12 0 13 0 14 0 17 0 18 0 21 0 22 0 23 0 24 0 25 0 29 0 30 0 31 0 32 0 33 0 35 0 42 0 50 0 52 0 54 0 55 0 58 0 65 0 71 0 74 0 75 0 76 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 100 0 101 0 102 0 103 0 104 0 105 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 114 0 115 0 116 0 117 0 118 0 119 0 120 0 121 0 122 0 123 0 124 0 125 0 126 0 127 0 128 0 129 0 133 0 135 1 108] 
#[1 9 81 0 113 9 85 0 133] 
#[1 9 89 0 113 9 93 0 133] 
#[0 3 106 0 2 0 4 0 6 0 9 0 10 0 11 0 12 0 13 0 14 0 17 0 18 0 21 0 22 0 23 0 24 0 25 0 29 0 30 0 31 0 32 0 33 0 35 0 42 0 50 0 52 0 54 0 55 0 58 0 65 0 71 0 74 0 75 0 76 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 100 0 101 0 102 0 103 0 104 0 105 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 114 0 115 0 116 0 117 0 118 0 119 0 120 0 121 0 122 0 123 0 124 0 125 0 126 0 127 0 128 0 129 0 133 0 135 1 108] 
#[1 3 110 0 2 3 110 0 4 3 110 0 6 3 110 0 10 9 97 0 11 9 101 0 12 3 110 0 13 3 110 0 14 3 110 0 17 3 110 0 18 3 110 0 22 3 110 0 23 3 110 0 24 9 105 0 25 3 110 0 29 3 110 0 30 3 110 0 52 3 110 0 54 3 110 0 58 3 110 0 65 3 110 0 74 3 110 0 75 3 110 0 77 3 110 0 78 3 110 0 79 3 110 0 86 3 110 0 94 3 110 0 96 3 110 0 99 5 85 0 100 9 109 0 101 5 89 0 102 9 113 0 103 9 117 0 104 9 121 0 105 9 125 0 108 9 129 0 114 9 133 0 115 9 137 0 116 9 141 0 117 9 145 0 118 9 149 0 119 9 153 0 120 9 157 0 121 9 161 0 122 9 165 0 123 9 169 0 124 9 173 0 125 9 177 0 126 9 181 0 127 9 185 0 128 9 189 0 129 3 110 0 135 9 193 1 38 9 197 1 40 9 201 1 41 9 205 1 42] 
#[1 3 114 0 2 3 114 0 4 3 114 0 6 3 114 0 10 9 97 0 11 9 101 0 12 3 114 0 13 3 114 0 14 3 114 0 17 3 114 0 18 3 114 0 22 3 114 0 23 3 114 0 24 9 105 0 25 3 114 0 29 3 114 0 30 3 114 0 52 3 114 0 54 3 114 0 58 3 114 0 65 3 114 0 74 3 114 0 75 3 114 0 77 3 114 0 78 3 114 0 79 3 114 0 86 3 114 0 94 3 114 0 96 3 114 0 99 5 85 0 100 9 109 0 101 5 89 0 102 9 113 0 103 9 117 0 104 9 121 0 105 9 125 0 108 9 129 0 114 9 133 0 115 9 137 0 116 9 141 0 117 9 145 0 118 9 149 0 119 9 153 0 120 9 157 0 121 9 161 0 122 9 165 0 123 9 169 0 124 9 173 0 125 9 177 0 126 9 181 0 127 9 185 0 128 9 189 0 129 3 114 0 135 9 193 1 38 9 197 1 40 9 201 1 41 9 205 1 42] 
#[0 9 209 0 133] 
#[0 3 118 1 108] 
#[1 9 213 0 135 9 217 0 178 9 221 0 179] 
#[0 3 122 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 78 0 86 0 96 0 99] 
#[0 3 126 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 78 0 86 0 96 0 99] 
#[0 3 126 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 78 0 86 0 96 0 99] 
#[0 3 126 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 78 0 86 0 96 0 99] 
#[0 3 126 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 78 0 86 0 96 0 99] 
#[0 3 126 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 78 0 86 0 96 0 99] 
#[0 3 126 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 78 0 86 0 96 0 99] 
#[1 8 205 0 2 3 130 0 4 3 101 0 13 3 105 0 14 3 130 0 17 3 109 0 52 7 173 0 54 3 113 0 65 6 117 0 74 9 225 0 75 6 121 0 77 3 117 0 78 3 130 0 86 3 125 0 99 9 229 0 167 9 233 0 168 9 237 0 169 9 241 0 172 3 141 0 246 9 245 1 11 9 249 1 12 9 253 1 13 10 1 1 14 3 145 1 15 3 149 1 16 10 5 1 17 10 9 1 18 3 153 1 19 3 157 1 20 10 13 1 21 10 17 1 22 10 21 1 23 10 25 1 24 10 29 1 48 10 33 1 50 10 37 1 51 10 41 1 52 10 45 1 53 10 49 1 54 10 53 1 55 10 57 1 56 10 61 1 57 3 169 1 59 3 173 1 60 3 177 1 61 3 181 1 62] 
#[1 3 134 0 4 3 134 0 17 4 1 0 133] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 77 0 26 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 117 0 82 0 121 0 83 0 125 0 88 0 129 0 90 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 10 65 1 49 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 1 253 1 110 0 253 1 111] 
#[1 10 69 0 4 10 73 0 160] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 10 77 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 77 0 26 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 117 0 82 0 121 0 83 0 125 0 88 0 129 0 90 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 10 81 1 49 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 1 253 1 110 0 253 1 111] 
#[0 10 85 0 4] 
#[1 1 234 0 4 1 17 0 16 1 234 0 43 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 5 133 0 176 1 109 0 222 1 113 0 224 1 117 0 227 10 89 1 89 5 149 1 90 5 153 1 91 5 157 1 92 1 121 1 111] 
#[0 3 138 0 4 0 43] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 77 0 26 0 14 0 43 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 117 0 82 0 121 0 83 0 125 0 88 0 129 0 90 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 10 93 1 110 0 253 1 111] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 5 133 0 176 1 109 0 222 1 113 0 224 1 117 0 227 10 97 1 91 1 121 1 111] 
#[0 3 142 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 137 0 139 0 143 1 111] 
#[0 3 142 0 16 0 48 0 58 0 61 0 82 0 83 0 88 0 131 0 132 0 135 0 137 0 139 0 143 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 10 101 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 14 0 17 0 77 0 26 0 14 0 43 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 14 0 67 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 14 0 80 0 14 0 81 0 117 0 82 0 121 0 83 0 14 0 86 0 125 0 88 0 129 0 90 0 14 0 91 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 0 14 1 108 10 105 1 110 0 253 1 111] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 14 0 17 0 77 0 26 0 14 0 43 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 14 0 67 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 14 0 80 0 14 0 81 0 117 0 82 0 121 0 83 0 14 0 86 0 125 0 88 0 129 0 90 0 14 0 91 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 0 14 1 108 10 109 1 110 0 253 1 111] 
#[1 7 109 0 8 2 58 0 71 10 113 0 175] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 77 0 26 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 117 0 82 0 121 0 83 0 125 0 88 0 129 0 90 0 14 0 91 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 10 117 1 49 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 1 253 1 110 0 253 1 111] 
#[0 3 146 0 4 0 91] 
#[0 3 150 0 4 0 91] 
#[0 3 154 0 4 0 43 0 80 0 91] 
#[1 3 158 0 4 4 1 0 133] 
#[0 3 162 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 3 166 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[1 10 121 0 9 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[1 10 125 0 9 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[1 3 170 0 31 0 162 0 32 0 162 0 35 3 170 0 50 0 162 0 58] 
#[1 3 174 0 9 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 3 174 0 50 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[1 6 13 0 8 3 178 0 10 3 178 0 50] 
#[1 3 182 0 8 3 182 0 10 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 3 182 0 50 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[1 10 129 0 136 10 133 0 210] 
#[0 3 186 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 35 0 42 0 50 0 55 0 58 0 71 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 1 108] 
#[0 3 190 0 9 0 10 0 133] 
#[1 0 18 0 1 1 1 0 3 1 5 0 7 0 22 0 9 0 22 0 10 1 9 0 13 1 13 0 14 1 17 0 16 0 18 0 20 0 22 0 32 0 22 0 35 1 21 0 48 0 22 0 55 0 85 0 58 0 22 0 59 1 25 0 61 1 29 0 64 1 33 0 65 1 37 0 131 1 41 0 132 0 22 0 133 1 45 0 134 1 49 0 136 1 53 0 137 0 153 0 139 1 57 0 143 1 61 0 176 3 1 0 185 1 69 0 186 1 73 0 195 10 137 0 196 1 81 0 197 1 85 0 198 1 89 0 200 1 93 0 201 1 97 0 202 1 101 0 211 1 105 0 221 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111 1 125 1 113] 
#[0 10 141 0 133] 
#[1 3 194 0 2 3 194 0 4 3 194 0 9 3 194 0 10 1 87 0 11 1 91 0 12 3 194 0 13 3 194 0 14 3 194 0 17 3 194 0 21 9 105 0 25 3 194 0 31 3 194 0 32 3 194 0 33 3 194 0 35 3 194 0 42 3 194 0 50 3 194 0 52 3 194 0 54 3 194 0 55 3 194 0 58 3 194 0 65 3 194 0 71 3 194 0 74 3 194 0 75 3 194 0 76 3 194 0 77 3 194 0 78 3 194 0 79 3 194 0 86 3 194 0 94 3 194 0 96 3 194 0 99 5 85 0 100 9 109 0 101 5 89 0 102 9 113 0 103 9 117 0 104 9 121 0 105 3 194 0 106 3 194 0 107 1 95 0 108 3 194 0 109 3 194 0 110 3 194 0 111 3 194 0 112 9 129 0 114 9 133 0 115 9 137 0 116 9 141 0 117 9 145 0 118 9 149 0 119 9 153 0 120 9 157 0 121 9 161 0 122 9 165 0 123 9 169 0 124 9 173 0 125 9 177 0 126 9 181 0 127 9 185 0 128 9 189 0 129 3 194 0 133 3 194 0 135 9 193 1 38 9 197 1 40 9 201 1 41 9 205 1 42 3 194 1 108] 
#[0 3 198 0 2 0 4 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 17 0 18 0 21 0 22 0 23 0 24 0 29 0 30 0 31 0 32 0 33 0 35 0 42 0 43 0 50 0 52 0 55 0 58 0 61 0 67 0 71 0 74 0 76 0 77 0 78 0 80 0 81 0 86 0 91 0 99 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 0 135 1 108] 
#[1 3 202 0 10 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 3 202 0 50 2 117 0 53 3 9 0 59 3 13 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 3 17 0 223] 
#[0 10 145 0 135] 
#[1 1 90 0 2 1 90 0 4 1 90 0 6 1 90 0 10 1 90 0 13 1 90 0 14 1 90 0 18 1 90 0 22 1 90 0 23 1 90 0 24 1 90 0 29 1 90 0 30 1 90 0 52 1 90 0 58 1 90 0 74 1 90 0 77 1 90 0 78 1 90 0 99 1 90 0 135 10 149 0 237] 
#[1 1 90 0 2 1 90 0 4 1 90 0 6 1 90 0 10 1 90 0 13 1 90 0 14 1 90 0 18 1 90 0 22 1 90 0 23 1 90 0 24 1 90 0 29 1 90 0 30 1 90 0 52 1 90 0 58 1 90 0 74 1 90 0 77 1 90 0 78 1 90 0 99 1 90 0 135 10 153 0 237] 
#[1 1 90 0 2 1 90 0 4 1 90 0 6 1 90 0 10 1 90 0 13 1 90 0 14 1 90 0 18 1 90 0 22 1 90 0 23 1 90 0 24 1 90 0 29 1 90 0 30 1 90 0 52 1 90 0 58 1 90 0 74 1 90 0 77 1 90 0 78 1 90 0 99 1 90 0 135 10 157 0 237] 
#[1 1 90 0 2 1 90 0 4 1 90 0 6 1 90 0 10 1 90 0 13 1 90 0 14 1 90 0 18 1 90 0 22 1 90 0 23 1 90 0 24 1 90 0 29 1 90 0 30 1 90 0 52 1 90 0 58 1 90 0 74 1 90 0 77 1 90 0 78 1 90 0 99 1 90 0 135 10 161 0 237] 
#[1 10 165 0 24 10 169 0 29] 
#[0 3 206 0 4 0 10] 
#[0 3 210 0 4 0 6 0 10 0 18 0 23 0 24 0 29 0 30] 
#[0 3 214 0 4 0 6 0 10 0 18 0 23 0 24 0 29 0 30] 
#[0 3 214 0 4 0 6 0 10 0 18 0 23 0 24 0 29 0 30] 
#[0 3 214 0 4 0 6 0 10 0 18 0 23 0 24 0 29 0 30] 
#[0 3 214 0 4 0 6 0 10 0 18 0 23 0 24 0 29 0 30] 
#[1 2 241 0 135 10 173 0 203] 
#[0 3 218 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 3 222 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 3 226 0 2 0 4 0 6 0 10 0 13 0 14 0 17 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 54 0 58 0 65 0 74 0 75 0 77 0 78 0 86 0 99 0 135] 
#[1 3 230 0 2 3 230 0 4 3 230 0 6 3 230 0 10 3 230 0 13 3 230 0 14 3 230 0 18 3 230 0 22 3 230 0 23 3 230 0 24 3 230 0 29 3 230 0 30 3 230 0 52 3 230 0 58 3 230 0 65 3 230 0 74 3 230 0 75 3 230 0 77 3 230 0 78 3 230 0 79 3 230 0 94 3 230 0 99 5 85 0 100 5 89 0 102 3 230 0 135 5 93 1 41] 
#[0 3 234 0 2 0 4 0 6 0 10 0 13 0 14 0 17 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 54 0 58 0 65 0 74 0 75 0 77 0 78 0 86 0 99 0 135] 
#[1 3 238 0 2 3 238 0 4 3 238 0 6 3 238 0 10 3 238 0 13 3 238 0 14 3 238 0 18 3 238 0 22 3 238 0 23 3 238 0 24 3 238 0 29 3 238 0 30 3 238 0 52 3 238 0 58 3 238 0 65 3 238 0 74 3 238 0 75 3 238 0 77 3 238 0 78 3 238 0 79 3 238 0 94 3 238 0 99 5 85 0 100 5 89 0 102 3 238 0 135 5 97 1 41] 
#[1 0 134 0 8 10 177 0 55 2 181 0 61 0 134 0 133 7 101 0 205] 
#[1 10 181 0 55 2 181 0 61 0 134 0 133 7 105 0 205] 
#[1 3 242 0 8 3 242 0 21 3 242 0 33 10 185 0 58 3 242 0 76 3 242 0 106 3 242 0 107 3 242 0 108 3 242 0 109 3 242 0 110 3 242 0 111 3 242 0 112 3 242 0 133 10 189 1 26] 
#[1 10 193 0 9 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 3 9 0 59 3 13 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 3 17 0 223] 
#[1 2 181 0 61 0 134 0 133 10 197 0 205] 
#[1 10 201 0 61 3 246 0 133 10 205 1 58] 
#[1 0 18 0 1 1 1 0 3 1 5 0 7 0 22 0 11 0 22 0 12 1 9 0 13 1 13 0 14 1 17 0 16 0 18 0 20 0 22 0 32 0 22 0 35 1 21 0 48 0 85 0 58 0 22 0 59 1 25 0 61 1 29 0 64 1 33 0 65 1 37 0 131 1 41 0 132 0 22 0 133 1 45 0 134 1 49 0 136 1 53 0 137 0 153 0 139 1 57 0 143 1 61 0 176 3 1 0 185 1 69 0 186 1 73 0 195 10 209 0 196 1 81 0 197 1 85 0 198 1 89 0 200 1 93 0 201 1 97 0 202 1 101 0 211 1 105 0 221 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111 1 125 1 113] 
#[1 3 101 0 13 3 105 0 14 8 149 0 97 8 161 1 59 8 165 1 60 8 169 1 61 8 173 1 62] 
#[0 3 250 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 3 250 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 3 254 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 3 254 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 3 250 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 3 250 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 3 250 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[1 2 98 0 2 2 98 0 4 2 98 0 6 2 98 0 10 2 98 0 11 2 98 0 12 2 98 0 13 2 98 0 14 2 98 0 17 2 98 0 18 2 98 0 22 2 98 0 23 2 98 0 24 2 98 0 25 2 98 0 29 2 98 0 30 2 98 0 52 2 98 0 54 2 98 0 58 2 98 0 65 2 98 0 74 2 98 0 75 2 98 0 77 2 98 0 78 2 98 0 86 2 98 0 99 2 98 0 100 2 98 0 101 2 98 0 102 2 98 0 103 2 98 0 104 2 98 0 105 2 98 0 108 2 98 0 114 2 98 0 115 2 98 0 116 2 98 0 117 2 98 0 118 2 98 0 119 2 98 0 120 2 98 0 121 2 98 0 122 2 98 0 123 2 98 0 124 2 98 0 125 2 98 0 126 2 98 0 127 2 98 0 128 2 98 0 129 2 98 0 135 10 213 0 207] 
#[1 2 98 0 2 2 98 0 4 2 98 0 6 2 98 0 10 2 98 0 11 2 98 0 12 2 98 0 13 2 98 0 14 2 98 0 17 2 98 0 18 2 98 0 22 2 98 0 23 2 98 0 24 2 98 0 25 2 98 0 29 2 98 0 30 2 98 0 52 2 98 0 54 2 98 0 58 2 98 0 65 2 98 0 74 2 98 0 75 2 98 0 77 2 98 0 78 2 98 0 86 2 98 0 99 2 98 0 100 2 98 0 101 2 98 0 102 2 98 0 103 2 98 0 104 2 98 0 105 2 98 0 108 2 98 0 114 2 98 0 115 2 98 0 116 2 98 0 117 2 98 0 118 2 98 0 119 2 98 0 120 2 98 0 121 2 98 0 122 2 98 0 123 2 98 0 124 2 98 0 125 2 98 0 126 2 98 0 127 2 98 0 128 2 98 0 129 2 98 0 135 10 217 0 207] 
#[1 2 98 0 2 2 98 0 4 2 98 0 6 2 98 0 10 2 98 0 11 2 98 0 12 2 98 0 13 2 98 0 14 2 98 0 17 2 98 0 18 2 98 0 22 2 98 0 23 2 98 0 24 2 98 0 25 2 98 0 29 2 98 0 30 2 98 0 52 2 98 0 54 2 98 0 58 2 98 0 65 2 98 0 74 2 98 0 75 2 98 0 77 2 98 0 78 2 98 0 86 2 98 0 99 2 98 0 100 2 98 0 101 2 98 0 102 2 98 0 103 2 98 0 104 2 98 0 105 2 98 0 108 2 98 0 114 2 98 0 115 2 98 0 116 2 98 0 117 2 98 0 118 2 98 0 119 2 98 0 120 2 98 0 121 2 98 0 122 2 98 0 123 2 98 0 124 2 98 0 125 2 98 0 126 2 98 0 127 2 98 0 128 2 98 0 129 2 98 0 135 10 221 0 207] 
#[0 4 2 0 42] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 7 5 0 176 7 9 0 202 1 105 0 221 1 109 0 222 1 113 0 224 1 117 0 227 10 225 1 4 1 121 1 111] 
#[0 4 6 0 9 0 10 0 11 0 12 0 21 0 31 0 32 0 33 0 35 0 42 0 50 0 55 0 58 0 71 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133 1 108] 
#[1 4 10 0 9 4 10 0 10 4 10 0 11 4 10 0 12 4 10 0 21 4 10 0 31 1 99 0 32 4 10 0 33 3 25 0 35 4 10 0 42 4 10 0 50 4 10 0 55 3 29 0 58 4 10 0 71 4 10 0 76 4 10 0 106 4 10 0 107 4 10 0 108 4 10 0 109 4 10 0 110 4 10 0 111 4 10 0 112 4 10 0 133 3 33 0 199 4 10 1 108] 
#[0 4 14 0 31 0 50] 
#[0 10 229 0 135] 
#[1 3 66 0 2 3 66 0 4 3 66 0 11 3 66 0 12 3 66 0 13 3 66 0 14 10 233 0 15 3 66 0 18 3 66 0 22 3 66 0 23 3 66 0 24 10 237 0 25 10 241 0 28 3 66 0 29 3 66 0 30 3 66 0 52 3 66 0 58 9 21 0 61 3 66 0 74 3 66 0 77 3 66 0 78 3 66 0 99 3 66 0 133 3 66 0 135 10 245 0 235 10 249 0 236] 
#[1 0 22 0 10 0 22 0 50 0 22 0 59 10 253 0 136 11 1 0 195 11 5 0 243] 
#[1 1 90 0 2 1 90 0 4 1 90 0 13 1 90 0 14 1 90 0 18 1 90 0 22 1 90 0 23 1 90 0 24 1 90 0 29 1 90 0 30 1 90 0 52 1 90 0 58 1 90 0 74 1 90 0 77 1 90 0 78 1 90 0 99 1 90 0 135 11 9 0 213 4 225 0 237] 
#[1 4 18 0 10 4 18 0 50 11 13 0 55] 
#[1 11 17 0 10 11 21 0 50] 
#[0 4 22 0 10 0 50] 
#[0 4 26 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 135 1 108] 
#[0 11 25 0 133] 
#[0 11 29 0 133] 
#[1 4 30 0 2 4 30 0 4 4 30 0 13 4 30 0 14 4 30 0 22 11 33 0 58 11 37 1 6] 
#[0 11 41 0 133] 
#[1 4 34 0 2 4 34 0 4 4 34 0 6 4 34 0 10 4 34 0 11 4 34 0 12 4 34 0 13 4 34 0 14 4 34 0 17 4 34 0 18 4 34 0 22 4 34 0 23 4 34 0 24 4 34 0 25 4 34 0 29 4 34 0 30 4 34 0 52 4 34 0 54 4 34 0 58 4 34 0 65 4 34 0 74 4 34 0 75 4 34 0 77 4 34 0 78 4 34 0 79 4 34 0 86 4 34 0 94 4 34 0 96 4 34 0 99 4 34 0 100 4 34 0 101 4 34 0 102 4 34 0 103 4 34 0 104 4 34 0 105 4 34 0 108 4 34 0 114 4 34 0 115 4 34 0 116 4 34 0 117 4 34 0 118 4 34 0 119 4 34 0 120 4 34 0 121 4 34 0 122 4 34 0 123 4 34 0 124 4 34 0 125 4 34 0 126 4 34 0 127 4 34 0 128 4 34 0 129 4 34 0 135 11 45 1 39] 
#[1 4 38 0 21 2 49 0 32 4 38 0 33 3 25 0 35 4 38 0 42 4 38 0 55 3 29 0 58 4 38 0 71 4 38 0 76 4 38 0 106 4 38 0 107 4 38 0 108 4 38 0 109 4 38 0 110 4 38 0 111 4 38 0 112 4 38 0 133 3 33 0 199] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 11 49 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[1 3 73 0 11 3 77 0 12 2 49 0 32 3 25 0 35 0 194 0 55 3 29 0 58 0 194 0 133 11 53 0 150 3 33 0 199] 
#[0 4 42 0 8 0 9 0 10 0 50 0 133] 
#[0 11 57 0 139] 
#[0 4 46 0 2 0 4 0 6 0 9 0 10 0 11 0 12 0 13 0 14 0 17 0 18 0 21 0 22 0 23 0 24 0 25 0 29 0 30 0 31 0 32 0 33 0 35 0 42 0 50 0 52 0 54 0 55 0 58 0 65 0 71 0 74 0 75 0 76 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 100 0 101 0 102 0 103 0 104 0 105 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 114 0 115 0 116 0 117 0 118 0 119 0 120 0 121 0 122 0 123 0 124 0 125 0 126 0 127 0 128 0 129 0 133 0 135 1 108] 
#[0 11 61 0 139] 
#[0 4 46 0 2 0 4 0 6 0 9 0 10 0 11 0 12 0 13 0 14 0 17 0 18 0 21 0 22 0 23 0 24 0 25 0 29 0 30 0 31 0 32 0 33 0 35 0 42 0 50 0 52 0 54 0 55 0 58 0 65 0 71 0 74 0 75 0 76 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 100 0 101 0 102 0 103 0 104 0 105 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 114 0 115 0 116 0 117 0 118 0 119 0 120 0 121 0 122 0 123 0 124 0 125 0 126 0 127 0 128 0 129 0 133 0 135 1 108] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 11 65 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 11 69 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 50 0 133] 
#[0 4 54 0 2 0 4 0 6 0 9 0 10 0 11 0 12 0 13 0 14 0 17 0 18 0 21 0 22 0 23 0 24 0 25 0 29 0 30 0 31 0 32 0 33 0 35 0 42 0 50 0 52 0 54 0 55 0 58 0 65 0 71 0 74 0 75 0 76 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 100 0 101 0 102 0 103 0 104 0 105 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 114 0 115 0 116 0 117 0 118 0 119 0 120 0 121 0 122 0 123 0 124 0 125 0 126 0 127 0 128 0 129 0 133 0 135 1 108] 
#[0 4 58 0 2 0 4 0 6 0 9 0 10 0 11 0 12 0 13 0 14 0 17 0 18 0 21 0 22 0 23 0 24 0 25 0 29 0 30 0 31 0 32 0 33 0 35 0 42 0 50 0 52 0 54 0 55 0 58 0 65 0 71 0 74 0 75 0 76 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 100 0 101 0 102 0 103 0 104 0 105 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 114 0 115 0 116 0 117 0 118 0 119 0 120 0 121 0 122 0 123 0 124 0 125 0 126 0 127 0 128 0 129 0 133 0 135 1 108] 
#[0 4 58 0 2 0 4 0 6 0 9 0 10 0 11 0 12 0 13 0 14 0 17 0 18 0 21 0 22 0 23 0 24 0 25 0 29 0 30 0 31 0 32 0 33 0 35 0 42 0 50 0 52 0 54 0 55 0 58 0 65 0 71 0 74 0 75 0 76 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 100 0 101 0 102 0 103 0 104 0 105 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 114 0 115 0 116 0 117 0 118 0 119 0 120 0 121 0 122 0 123 0 124 0 125 0 126 0 127 0 128 0 129 0 133 0 135 1 108] 
#[0 11 73 0 133] 
#[0 4 62 0 13 0 14 0 52 0 62 0 65 0 75 0 78 0 79 0 94 0 99] 
#[0 11 77 0 55] 
#[1 4 66 0 2 4 66 0 4 4 66 0 13 4 66 0 14 4 66 0 17 4 66 0 52 4 66 0 54 4 66 0 65 4 66 0 74 4 66 0 75 4 66 0 77 4 66 0 78 4 66 0 86 4 66 0 96 4 66 0 99 9 213 0 135 11 81 0 179] 
#[0 4 70 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 96 0 99 0 135] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 14 0 17 0 77 0 26 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 117 0 82 0 121 0 83 0 14 0 86 0 125 0 88 0 129 0 90 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 11 85 1 49 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 1 253 1 110 0 253 1 111] 
#[0 4 74 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[0 4 74 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[0 4 74 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[0 4 74 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[0 4 78 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[1 0 34 0 13 0 34 0 14 0 34 0 52 0 34 0 65 0 34 0 75 0 34 0 78 0 34 0 79 0 34 0 94 0 34 0 99 5 85 0 100 5 89 0 102 11 89 0 154 8 237 1 41 1 177 1 63] 
#[0 4 82 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[1 0 34 0 13 0 34 0 14 0 34 0 52 0 34 0 65 0 34 0 75 0 34 0 78 0 34 0 79 0 34 0 94 0 34 0 99 5 85 0 100 5 89 0 102 11 93 0 154 8 241 1 41 1 177 1 63] 
#[0 4 86 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[1 0 34 0 13 0 34 0 14 0 34 0 52 0 34 0 65 0 34 0 75 0 34 0 78 0 34 0 79 0 34 0 94 0 34 0 99 11 97 0 154 1 177 1 63] 
#[0 4 90 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[1 0 34 0 13 0 34 0 14 0 34 0 52 0 34 0 65 0 34 0 75 0 34 0 78 0 34 0 79 0 34 0 94 0 34 0 99 11 101 0 154 1 177 1 63] 
#[0 4 94 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[1 0 34 0 13 0 34 0 14 0 34 0 52 0 34 0 65 0 34 0 75 0 34 0 78 0 34 0 79 0 34 0 94 0 34 0 99 5 85 0 100 5 89 0 102 11 105 0 154 8 245 1 41 1 177 1 63] 
#[0 4 98 0 4 0 17 0 86] 
#[0 4 102 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[0 4 74 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[0 4 74 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[0 4 74 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[0 4 74 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[0 4 74 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[0 4 74 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[0 4 74 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[1 4 106 0 4 4 1 0 133] 
#[0 11 109 0 59] 
#[0 4 110 1 108] 
#[1 4 114 0 8 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 4 114 0 50 2 117 0 53 3 9 0 59 3 13 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 3 17 0 223] 
#[1 4 118 0 4 4 1 0 133] 
#[0 4 122 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 4 126 0 4 0 43 0 133] 
#[0 4 130 0 4 0 43 0 133] 
#[1 4 134 0 8 4 138 0 50] 
#[1 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 11 113 0 71 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[0 4 142 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 4 146 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[0 11 117 0 71] 
#[1 4 150 0 4 4 150 0 91 4 1 0 133] 
#[0 4 154 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[0 4 154 0 4 0 5 0 8 0 9 0 10 0 17 0 21 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 53 0 55 0 58 0 59 0 61 0 67 0 69 0 71 0 76 0 80 0 81 0 84 0 85 0 86 0 87 0 91 0 92 0 93 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 130 0 131 0 132 0 133 0 134 1 108] 
#[0 4 158 0 10 0 50] 
#[1 4 162 0 10 11 121 0 50] 
#[1 4 166 0 9 4 166 0 10 2 49 0 32 3 25 0 35 11 125 0 55 3 29 0 58 4 166 0 133 3 33 0 199 11 129 1 46] 
#[1 2 98 0 2 2 98 0 4 2 98 0 9 2 98 0 10 2 98 0 11 2 98 0 12 2 98 0 13 2 98 0 14 2 98 0 17 2 98 0 21 2 98 0 25 2 98 0 31 2 98 0 32 2 98 0 33 2 98 0 35 2 98 0 42 2 98 0 50 2 98 0 52 2 98 0 54 2 98 0 55 2 98 0 58 2 98 0 65 2 98 0 71 2 98 0 74 2 98 0 75 2 98 0 76 2 98 0 77 2 98 0 78 2 98 0 79 2 98 0 86 2 98 0 94 2 98 0 96 2 98 0 99 2 98 0 100 2 98 0 101 2 98 0 102 2 98 0 103 2 98 0 104 2 98 0 105 2 98 0 106 2 98 0 107 2 98 0 108 2 98 0 109 2 98 0 110 2 98 0 111 2 98 0 112 2 98 0 114 2 98 0 115 2 98 0 116 2 98 0 117 2 98 0 118 2 98 0 119 2 98 0 120 2 98 0 121 2 98 0 122 2 98 0 123 2 98 0 124 2 98 0 125 2 98 0 126 2 98 0 127 2 98 0 128 2 98 0 129 2 98 0 133 2 98 0 135 11 133 0 207 2 98 1 108] 
#[1 7 109 0 8 2 58 0 42 11 137 0 175] 
#[1 6 97 0 2 4 170 0 4 4 170 0 6 4 170 0 10 6 101 0 13 6 105 0 14 4 170 0 18 6 109 0 22 4 170 0 23 4 170 0 24 4 170 0 29 4 170 0 30 3 109 0 52 6 113 0 58 6 117 0 74 6 121 0 77 3 117 0 78 3 125 0 99 5 53 0 135 6 125 0 169 6 129 0 170 6 133 0 171 6 137 0 172 6 141 0 244 6 145 0 245 3 141 0 246 6 149 0 247 6 153 0 248 6 157 0 249 6 161 0 250 6 165 0 251 6 169 0 252 6 173 0 253 6 177 0 254 6 181 0 255 6 185 1 0 6 189 1 1 6 193 1 9 6 197 1 10 6 201 1 11 6 205 1 12 6 209 1 13 6 213 1 14 6 217 1 15 6 221 1 16 6 225 1 17 6 229 1 18 6 233 1 19 6 237 1 20 6 241 1 21 6 245 1 22 6 249 1 23 6 253 1 24 7 1 1 25 3 169 1 59 3 173 1 60 3 177 1 61 3 181 1 62] 
#[1 6 97 0 2 4 174 0 4 4 174 0 6 4 174 0 10 6 101 0 13 6 105 0 14 4 174 0 18 6 109 0 22 4 174 0 23 4 174 0 24 4 174 0 29 4 174 0 30 3 109 0 52 6 113 0 58 6 117 0 74 6 121 0 77 3 117 0 78 3 125 0 99 5 53 0 135 6 125 0 169 6 129 0 170 6 133 0 171 6 137 0 172 6 141 0 244 6 145 0 245 3 141 0 246 6 149 0 247 6 153 0 248 6 157 0 249 6 161 0 250 6 165 0 251 6 169 0 252 6 173 0 253 6 177 0 254 6 181 0 255 6 185 1 0 6 189 1 1 6 193 1 9 6 197 1 10 6 201 1 11 6 205 1 12 6 209 1 13 6 213 1 14 6 217 1 15 6 221 1 16 6 225 1 17 6 229 1 18 6 233 1 19 6 237 1 20 6 241 1 21 6 245 1 22 6 249 1 23 6 253 1 24 7 1 1 25 3 169 1 59 3 173 1 60 3 177 1 61 3 181 1 62] 
#[1 6 97 0 2 4 178 0 4 4 178 0 6 4 178 0 10 6 101 0 13 6 105 0 14 4 178 0 18 6 109 0 22 4 178 0 23 4 178 0 24 4 178 0 29 4 178 0 30 3 109 0 52 6 113 0 58 6 117 0 74 6 121 0 77 3 117 0 78 3 125 0 99 5 53 0 135 6 125 0 169 6 129 0 170 6 133 0 171 6 137 0 172 6 141 0 244 6 145 0 245 3 141 0 246 6 149 0 247 6 153 0 248 6 157 0 249 6 161 0 250 6 165 0 251 6 169 0 252 6 173 0 253 6 177 0 254 6 181 0 255 6 185 1 0 6 189 1 1 6 193 1 9 6 197 1 10 6 201 1 11 6 205 1 12 6 209 1 13 6 213 1 14 6 217 1 15 6 221 1 16 6 225 1 17 6 229 1 18 6 233 1 19 6 237 1 20 6 241 1 21 6 245 1 22 6 249 1 23 6 253 1 24 7 1 1 25 3 169 1 59 3 173 1 60 3 177 1 61 3 181 1 62] 
#[1 6 97 0 2 4 182 0 4 4 182 0 6 4 182 0 10 6 101 0 13 6 105 0 14 4 182 0 18 6 109 0 22 4 182 0 23 4 182 0 24 4 182 0 29 4 182 0 30 3 109 0 52 6 113 0 58 6 117 0 74 6 121 0 77 3 117 0 78 3 125 0 99 5 53 0 135 6 125 0 169 6 129 0 170 6 133 0 171 6 137 0 172 6 141 0 244 6 145 0 245 3 141 0 246 6 149 0 247 6 153 0 248 6 157 0 249 6 161 0 250 6 165 0 251 6 169 0 252 6 173 0 253 6 177 0 254 6 181 0 255 6 185 1 0 6 189 1 1 6 193 1 9 6 197 1 10 6 201 1 11 6 205 1 12 6 209 1 13 6 213 1 14 6 217 1 15 6 221 1 16 6 225 1 17 6 229 1 18 6 233 1 19 6 237 1 20 6 241 1 21 6 245 1 22 6 249 1 23 6 253 1 24 7 1 1 25 3 169 1 59 3 173 1 60 3 177 1 61 3 181 1 62] 
#[1 1 90 0 2 1 90 0 4 1 90 0 6 1 90 0 10 1 90 0 13 1 90 0 14 1 90 0 18 1 90 0 22 1 90 0 23 1 90 0 24 1 90 0 29 1 90 0 30 1 90 0 52 1 90 0 58 1 90 0 74 1 90 0 77 1 90 0 78 1 90 0 99 1 90 0 135 11 141 0 237] 
#[1 1 90 0 2 1 90 0 4 1 90 0 6 1 90 0 10 1 90 0 13 1 90 0 14 1 90 0 18 1 90 0 22 1 90 0 23 1 90 0 24 1 90 0 29 1 90 0 30 1 90 0 52 1 90 0 58 1 90 0 74 1 90 0 77 1 90 0 78 1 90 0 99 1 90 0 135 11 145 0 237] 
#[1 0 134 0 8 2 181 0 61 0 134 0 133 11 149 0 205] 
#[0 11 153 0 135] 
#[0 11 157 0 135] 
#[1 1 26 0 9 4 113 0 52 4 117 0 98 4 121 0 99 1 30 0 135 11 161 0 208 4 129 1 43 4 133 1 44 4 137 1 45] 
#[1 7 109 0 8 2 58 0 21 2 58 0 33 2 58 0 76 2 58 0 106 2 58 0 107 2 58 0 108 2 58 0 109 2 58 0 110 2 58 0 111 2 58 0 112 2 58 0 133 11 165 0 175] 
#[0 4 186 0 2 0 13 0 14 0 74 0 77] 
#[0 11 169 0 133] 
#[0 11 173 0 10] 
#[0 11 177 0 133] 
#[1 3 73 0 11 3 77 0 12 2 49 0 32 3 25 0 35 3 29 0 58 0 194 0 133 11 181 0 150 3 33 0 199] 
#[1 4 190 0 2 4 190 0 4 4 190 0 6 4 190 0 10 9 97 0 11 9 101 0 12 4 190 0 13 4 190 0 14 4 190 0 17 4 190 0 18 4 190 0 22 4 190 0 23 4 190 0 24 9 105 0 25 4 190 0 29 4 190 0 30 4 190 0 52 4 190 0 54 4 190 0 58 4 190 0 65 4 190 0 74 4 190 0 75 4 190 0 77 4 190 0 78 4 190 0 86 4 190 0 99 5 85 0 100 9 109 0 101 5 89 0 102 9 113 0 103 9 117 0 104 9 121 0 105 9 125 0 108 9 129 0 114 9 133 0 115 9 137 0 116 9 141 0 117 9 145 0 118 9 149 0 119 9 153 0 120 9 157 0 121 9 161 0 122 9 165 0 123 9 169 0 124 9 173 0 125 9 177 0 126 9 181 0 127 9 185 0 128 9 189 0 129 4 190 0 135 9 193 1 38 9 197 1 40 9 201 1 41 9 205 1 42] 
#[1 4 194 0 2 4 194 0 4 4 194 0 6 4 194 0 10 9 97 0 11 9 101 0 12 4 194 0 13 4 194 0 14 4 194 0 17 4 194 0 18 4 194 0 22 4 194 0 23 4 194 0 24 9 105 0 25 4 194 0 29 4 194 0 30 4 194 0 52 4 194 0 54 4 194 0 58 4 194 0 65 4 194 0 74 4 194 0 75 4 194 0 77 4 194 0 78 4 194 0 86 4 194 0 99 5 85 0 100 9 109 0 101 5 89 0 102 9 113 0 103 9 117 0 104 9 121 0 105 9 125 0 108 9 129 0 114 9 133 0 115 9 137 0 116 9 141 0 117 9 145 0 118 9 149 0 119 9 153 0 120 9 157 0 121 9 161 0 122 9 165 0 123 9 169 0 124 9 173 0 125 9 177 0 126 9 181 0 127 9 185 0 128 9 189 0 129 4 194 0 135 9 193 1 38 9 197 1 40 9 201 1 41 9 205 1 42] 
#[1 4 198 0 2 4 198 0 4 4 198 0 6 4 198 0 10 9 97 0 11 9 101 0 12 4 198 0 13 4 198 0 14 4 198 0 17 4 198 0 18 4 198 0 22 4 198 0 23 4 198 0 24 9 105 0 25 4 198 0 29 4 198 0 30 4 198 0 52 4 198 0 54 4 198 0 58 4 198 0 65 4 198 0 74 4 198 0 75 4 198 0 77 4 198 0 78 4 198 0 86 4 198 0 99 5 85 0 100 9 109 0 101 5 89 0 102 9 113 0 103 9 117 0 104 9 121 0 105 9 125 0 108 9 129 0 114 9 133 0 115 9 137 0 116 9 141 0 117 9 145 0 118 9 149 0 119 9 153 0 120 9 157 0 121 9 161 0 122 9 165 0 123 9 169 0 124 9 173 0 125 9 177 0 126 9 181 0 127 9 185 0 128 9 189 0 129 4 198 0 135 9 193 1 38 9 197 1 40 9 201 1 41 9 205 1 42] 
#[0 4 202 0 9 0 50] 
#[0 4 206 0 11 0 12 0 133] 
#[0 11 185 0 26] 
#[0 4 210 0 2 0 4 0 11 0 12 0 13 0 14 0 15 0 18 0 22 0 23 0 24 0 25 0 28 0 29 0 30 0 52 0 58 0 61 0 74 0 77 0 78 0 99 0 133 0 135] 
#[0 4 210 0 2 0 4 0 11 0 12 0 13 0 14 0 15 0 18 0 22 0 23 0 24 0 25 0 28 0 29 0 30 0 52 0 58 0 61 0 74 0 77 0 78 0 99 0 133 0 135] 
#[1 1 90 0 2 1 90 0 4 4 214 0 11 4 214 0 12 1 90 0 13 1 90 0 14 1 90 0 18 1 90 0 22 1 90 0 23 1 90 0 24 1 90 0 29 1 90 0 30 1 90 0 52 1 90 0 58 1 90 0 74 1 90 0 77 1 90 0 78 1 90 0 99 4 214 0 133 1 90 0 135 11 189 0 213 4 225 0 237] 
#[0 4 218 0 2 0 4 0 11 0 12 0 13 0 14 0 15 0 18 0 22 0 23 0 24 0 25 0 28 0 29 0 30 0 52 0 58 0 61 0 74 0 77 0 78 0 99 0 133 0 135] 
#[0 0 150 0 10 0 50 0 59] 
#[1 4 222 0 10 4 222 0 50 3 21 0 59] 
#[1 11 193 0 10 11 197 0 50] 
#[1 2 14 0 4 2 14 0 18 2 14 0 23 2 14 0 24 2 14 0 29 2 14 0 30 11 201 0 214] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 11 205 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[0 4 226 0 133] 
#[1 9 29 0 135 11 209 0 189] 
#[0 4 230 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 135 1 108] 
#[0 4 230 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 135 1 108] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 11 213 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[1 4 234 0 2 4 234 0 4 4 234 0 13 4 234 0 14 4 234 0 22 11 217 1 7] 
#[1 4 34 0 2 4 34 0 4 4 34 0 6 4 34 0 10 4 34 0 11 4 34 0 12 4 34 0 13 4 34 0 14 4 34 0 17 4 34 0 18 4 34 0 22 4 34 0 23 4 34 0 24 4 34 0 25 4 34 0 29 4 34 0 30 4 34 0 52 4 34 0 54 4 34 0 58 4 34 0 65 4 34 0 74 4 34 0 75 4 34 0 77 4 34 0 78 4 34 0 79 4 34 0 86 4 34 0 94 4 34 0 96 4 34 0 99 4 34 0 100 4 34 0 101 4 34 0 102 4 34 0 103 4 34 0 104 4 34 0 105 4 34 0 108 4 34 0 114 4 34 0 115 4 34 0 116 4 34 0 117 4 34 0 118 4 34 0 119 4 34 0 120 4 34 0 121 4 34 0 122 4 34 0 123 4 34 0 124 4 34 0 125 4 34 0 126 4 34 0 127 4 34 0 128 4 34 0 129 4 34 0 135 11 221 1 39] 
#[1 4 238 0 2 4 238 0 4 4 238 0 6 4 238 0 10 9 97 0 11 9 101 0 12 4 238 0 13 4 238 0 14 4 238 0 17 4 238 0 18 4 238 0 22 4 238 0 23 4 238 0 24 9 105 0 25 4 238 0 29 4 238 0 30 4 238 0 52 4 238 0 54 4 238 0 58 4 238 0 65 4 238 0 74 4 238 0 75 4 238 0 77 4 238 0 78 4 238 0 79 4 238 0 86 4 238 0 94 4 238 0 96 4 238 0 99 4 238 0 100 9 109 0 101 4 238 0 102 9 113 0 103 9 117 0 104 9 121 0 105 9 125 0 108 9 129 0 114 9 133 0 115 9 137 0 116 9 141 0 117 9 145 0 118 9 149 0 119 9 153 0 120 9 157 0 121 9 161 0 122 9 165 0 123 9 169 0 124 9 173 0 125 9 177 0 126 9 181 0 127 9 185 0 128 9 189 0 129 4 238 0 135 11 225 1 40 9 205 1 42] 
#[1 1 103 0 11 3 77 0 12 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 3 9 0 59 3 13 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 0 194 0 133 11 229 0 150 3 17 0 223] 
#[1 11 125 0 55 4 166 0 133 11 233 1 46] 
#[0 11 237 0 133] 
#[0 11 241 0 133] 
#[1 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 3 9 0 59 3 13 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 11 245 0 133 3 17 0 223] 
#[1 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 3 9 0 59 3 13 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 11 249 0 133 3 17 0 223] 
#[0 4 242 0 2 0 4 0 6 0 9 0 10 0 11 0 12 0 13 0 14 0 17 0 18 0 21 0 22 0 23 0 24 0 25 0 29 0 30 0 31 0 32 0 33 0 35 0 42 0 50 0 52 0 54 0 55 0 58 0 65 0 71 0 74 0 75 0 76 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 100 0 101 0 102 0 103 0 104 0 105 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 114 0 115 0 116 0 117 0 118 0 119 0 120 0 121 0 122 0 123 0 124 0 125 0 126 0 127 0 128 0 129 0 133 0 135 1 108] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 11 253 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[0 4 246 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 96 0 99 0 135] 
#[1 4 250 0 4 4 250 0 17 4 250 0 86 4 1 0 133] 
#[0 4 254 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[0 5 2 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[0 5 6 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[0 5 10 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[0 5 14 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 99] 
#[0 5 18 1 108] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 14 0 17 0 77 0 26 0 14 0 43 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 14 0 67 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 14 0 80 0 14 0 81 0 117 0 82 0 121 0 83 0 14 0 86 0 125 0 88 0 129 0 90 0 14 0 91 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 0 14 1 108 12 1 1 110 0 253 1 111] 
#[1 0 14 0 4 0 69 0 6 0 73 0 16 0 77 0 26 0 14 0 43 0 81 0 48 0 85 0 58 0 89 0 61 0 93 0 66 0 97 0 68 0 101 0 70 0 105 0 72 0 109 0 73 0 113 0 75 0 14 0 80 0 117 0 82 0 121 0 83 0 125 0 88 0 129 0 90 0 14 0 91 0 10 0 94 0 133 0 95 0 137 0 131 0 141 0 132 0 14 0 133 0 145 0 135 0 149 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 0 173 1 36 12 5 1 49 0 177 1 64 0 181 1 69 0 185 1 70 0 189 1 71 0 193 1 72 0 197 1 73 0 201 1 74 0 205 1 75 0 209 1 76 0 213 1 77 0 217 1 78 0 221 1 79 0 225 1 94 0 229 1 96 0 233 1 97 0 237 1 98 0 241 1 100 0 245 1 103 1 253 1 110 0 253 1 111] 
#[0 12 9 0 136] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 12 13 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[0 5 22 0 9 0 10 0 133] 
#[1 5 26 0 2 5 26 0 4 5 26 0 9 5 26 0 10 1 107 0 11 1 111 0 12 5 26 0 13 5 26 0 14 5 26 0 17 5 26 0 21 9 105 0 25 5 26 0 31 5 26 0 32 5 26 0 33 5 26 0 35 5 26 0 42 5 26 0 50 5 26 0 52 5 26 0 54 5 26 0 55 5 26 0 58 5 26 0 65 5 26 0 71 5 26 0 74 5 26 0 75 5 26 0 76 5 26 0 77 5 26 0 78 5 26 0 79 5 26 0 86 5 26 0 94 5 26 0 96 5 26 0 99 5 85 0 100 9 109 0 101 5 89 0 102 9 113 0 103 9 117 0 104 9 121 0 105 5 26 0 106 5 26 0 107 1 115 0 108 5 26 0 109 5 26 0 110 5 26 0 111 5 26 0 112 9 129 0 114 9 133 0 115 9 137 0 116 9 141 0 117 9 145 0 118 9 149 0 119 9 153 0 120 9 157 0 121 9 161 0 122 9 165 0 123 9 169 0 124 9 173 0 125 9 177 0 126 9 181 0 127 9 185 0 128 9 189 0 129 5 26 0 133 5 26 0 135 9 193 1 38 9 197 1 40 9 201 1 41 9 205 1 42 5 26 1 108] 
#[0 12 17 0 42] 
#[1 6 97 0 2 5 30 0 4 5 30 0 6 5 30 0 10 6 101 0 13 6 105 0 14 5 30 0 18 6 109 0 22 5 30 0 23 5 30 0 24 5 30 0 29 5 30 0 30 3 109 0 52 6 113 0 58 6 117 0 74 6 121 0 77 3 117 0 78 3 125 0 99 5 53 0 135 6 125 0 169 6 129 0 170 6 133 0 171 6 137 0 172 6 141 0 244 6 145 0 245 3 141 0 246 6 149 0 247 6 153 0 248 6 157 0 249 6 161 0 250 6 165 0 251 6 169 0 252 6 173 0 253 6 177 0 254 6 181 0 255 6 185 1 0 6 189 1 1 6 193 1 9 6 197 1 10 6 201 1 11 6 205 1 12 6 209 1 13 6 213 1 14 6 217 1 15 6 221 1 16 6 225 1 17 6 229 1 18 6 233 1 19 6 237 1 20 6 241 1 21 6 245 1 22 6 249 1 23 6 253 1 24 7 1 1 25 3 169 1 59 3 173 1 60 3 177 1 61 3 181 1 62] 
#[1 6 97 0 2 5 34 0 4 5 34 0 6 5 34 0 10 6 101 0 13 6 105 0 14 5 34 0 18 6 109 0 22 5 34 0 23 5 34 0 24 5 34 0 29 5 34 0 30 3 109 0 52 6 113 0 58 6 117 0 74 6 121 0 77 3 117 0 78 3 125 0 99 5 53 0 135 6 125 0 169 6 129 0 170 6 133 0 171 6 137 0 172 6 141 0 244 6 145 0 245 3 141 0 246 6 149 0 247 6 153 0 248 6 157 0 249 6 161 0 250 6 165 0 251 6 169 0 252 6 173 0 253 6 177 0 254 6 181 0 255 6 185 1 0 6 189 1 1 6 193 1 9 6 197 1 10 6 201 1 11 6 205 1 12 6 209 1 13 6 213 1 14 6 217 1 15 6 221 1 16 6 225 1 17 6 229 1 18 6 233 1 19 6 237 1 20 6 241 1 21 6 245 1 22 6 249 1 23 6 253 1 24 7 1 1 25 3 169 1 59 3 173 1 60 3 177 1 61 3 181 1 62] 
#[1 7 109 0 8 2 58 0 133 12 21 0 175] 
#[0 12 25 0 133] 
#[0 12 29 0 133] 
#[0 12 33 0 9] 
#[1 5 38 0 21 5 38 0 33 5 38 0 76 5 38 0 106 5 38 0 107 5 38 0 108 5 38 0 109 5 38 0 110 5 38 0 111 5 38 0 112 5 38 0 133 12 37 1 27] 
#[1 4 34 0 2 4 34 0 4 4 34 0 6 4 34 0 10 4 34 0 11 4 34 0 12 4 34 0 13 4 34 0 14 4 34 0 18 4 34 0 22 4 34 0 23 4 34 0 24 4 34 0 25 4 34 0 29 4 34 0 30 4 34 0 52 4 34 0 58 4 34 0 65 4 34 0 74 4 34 0 75 4 34 0 77 4 34 0 78 4 34 0 79 4 34 0 94 4 34 0 99 4 34 0 100 4 34 0 101 4 34 0 102 4 34 0 103 4 34 0 104 4 34 0 105 4 34 0 108 4 34 0 114 4 34 0 115 4 34 0 116 4 34 0 117 4 34 0 118 4 34 0 119 4 34 0 120 4 34 0 121 4 34 0 122 4 34 0 123 4 34 0 124 4 34 0 125 4 34 0 126 4 34 0 127 4 34 0 128 4 34 0 129 4 34 0 135 12 41 1 39] 
#[0 5 42 0 133] 
#[1 4 34 0 2 4 34 0 4 4 34 0 6 4 34 0 10 4 34 0 11 4 34 0 12 4 34 0 13 4 34 0 14 4 34 0 18 4 34 0 22 4 34 0 23 4 34 0 24 4 34 0 25 4 34 0 29 4 34 0 30 4 34 0 52 4 34 0 58 4 34 0 65 4 34 0 74 4 34 0 75 4 34 0 77 4 34 0 78 4 34 0 79 4 34 0 94 4 34 0 99 4 34 0 100 4 34 0 101 4 34 0 102 4 34 0 103 4 34 0 104 4 34 0 105 4 34 0 108 4 34 0 114 4 34 0 115 4 34 0 116 4 34 0 117 4 34 0 118 4 34 0 119 4 34 0 120 4 34 0 121 4 34 0 122 4 34 0 123 4 34 0 124 4 34 0 125 4 34 0 126 4 34 0 127 4 34 0 128 4 34 0 129 4 34 0 135 12 45 1 39] 
#[0 12 49 0 133] 
#[1 2 241 0 135 12 53 0 203] 
#[1 2 14 0 4 2 14 0 18 2 14 0 23 2 14 0 24 2 14 0 29 2 14 0 30 12 57 0 214] 
#[0 5 46 0 2 0 4 0 11 0 12 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 133 0 135] 
#[1 0 22 0 10 0 22 0 50 0 22 0 59 10 253 0 136 12 61 0 195] 
#[1 12 65 0 4 8 105 0 18 8 109 0 23 8 113 0 24 8 117 0 29 8 121 0 30 8 129 0 238 8 133 0 239 8 137 0 240 8 141 0 241 8 145 0 242] 
#[1 5 50 0 10 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 5 50 0 50 2 117 0 53 3 9 0 59 3 13 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 3 17 0 223] 
#[0 5 54 0 10 0 50] 
#[1 12 69 0 9 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 3 9 0 59 3 13 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 3 17 0 223] 
#[1 12 73 0 2 12 77 0 4 3 101 0 13 3 105 0 14 6 109 0 22 6 129 0 170 6 133 0 171 12 81 0 251 6 177 0 254 6 181 0 255 6 185 1 0 12 85 1 1 12 89 1 8 6 193 1 9 6 197 1 10 6 217 1 15 6 221 1 16 6 225 1 17 6 229 1 18 6 233 1 19 6 237 1 20 6 241 1 21 6 245 1 22 6 249 1 23 6 253 1 24 7 1 1 25 3 169 1 59 3 173 1 60 3 177 1 61 3 181 1 62] 
#[1 5 58 0 2 5 58 0 4 5 58 0 6 5 58 0 10 9 97 0 11 9 101 0 12 5 58 0 13 5 58 0 14 5 58 0 17 5 58 0 18 5 58 0 22 5 58 0 23 5 58 0 24 9 105 0 25 5 58 0 29 5 58 0 30 5 58 0 52 5 58 0 54 5 58 0 58 5 58 0 65 5 58 0 74 5 58 0 75 5 58 0 77 5 58 0 78 5 58 0 79 5 58 0 86 5 58 0 94 5 58 0 96 5 58 0 99 5 58 0 100 9 109 0 101 5 58 0 102 9 113 0 103 9 117 0 104 9 121 0 105 9 125 0 108 9 129 0 114 9 133 0 115 9 137 0 116 9 141 0 117 9 145 0 118 9 149 0 119 9 153 0 120 9 157 0 121 9 161 0 122 9 165 0 123 9 169 0 124 9 173 0 125 9 177 0 126 9 181 0 127 9 185 0 128 9 189 0 129 5 58 0 135 11 225 1 40 9 205 1 42] 
#[0 5 62 0 2 0 4 0 6 0 10 0 11 0 12 0 13 0 14 0 17 0 18 0 22 0 23 0 24 0 25 0 29 0 30 0 52 0 54 0 58 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 100 0 101 0 102 0 103 0 104 0 105 0 108 0 114 0 115 0 116 0 117 0 118 0 119 0 120 0 121 0 122 0 123 0 124 0 125 0 126 0 127 0 128 0 129 0 135] 
#[1 12 93 0 11 5 66 0 133 12 97 0 177] 
#[0 12 101 0 133] 
#[0 5 70 0 2 0 4 0 6 0 9 0 10 0 11 0 12 0 13 0 14 0 17 0 18 0 21 0 22 0 23 0 24 0 25 0 29 0 30 0 31 0 32 0 33 0 35 0 42 0 50 0 52 0 54 0 55 0 58 0 65 0 71 0 74 0 75 0 76 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 100 0 101 0 102 0 103 0 104 0 105 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 114 0 115 0 116 0 117 0 118 0 119 0 120 0 121 0 122 0 123 0 124 0 125 0 126 0 127 0 128 0 129 0 133 0 135 1 108] 
#[0 5 70 0 2 0 4 0 6 0 9 0 10 0 11 0 12 0 13 0 14 0 17 0 18 0 21 0 22 0 23 0 24 0 25 0 29 0 30 0 31 0 32 0 33 0 35 0 42 0 50 0 52 0 54 0 55 0 58 0 65 0 71 0 74 0 75 0 76 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 100 0 101 0 102 0 103 0 104 0 105 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 114 0 115 0 116 0 117 0 118 0 119 0 120 0 121 0 122 0 123 0 124 0 125 0 126 0 127 0 128 0 129 0 133 0 135 1 108] 
#[0 5 74 0 2 0 4 0 6 0 9 0 10 0 11 0 12 0 13 0 14 0 17 0 18 0 21 0 22 0 23 0 24 0 25 0 29 0 30 0 31 0 32 0 33 0 35 0 42 0 50 0 52 0 54 0 55 0 58 0 65 0 71 0 74 0 75 0 76 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 100 0 101 0 102 0 103 0 104 0 105 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 114 0 115 0 116 0 117 0 118 0 119 0 120 0 121 0 122 0 123 0 124 0 125 0 126 0 127 0 128 0 129 0 133 0 135 1 108] 
#[0 5 74 0 2 0 4 0 6 0 9 0 10 0 11 0 12 0 13 0 14 0 17 0 18 0 21 0 22 0 23 0 24 0 25 0 29 0 30 0 31 0 32 0 33 0 35 0 42 0 50 0 52 0 54 0 55 0 58 0 65 0 71 0 74 0 75 0 76 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 100 0 101 0 102 0 103 0 104 0 105 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 114 0 115 0 116 0 117 0 118 0 119 0 120 0 121 0 122 0 123 0 124 0 125 0 126 0 127 0 128 0 129 0 133 0 135 1 108] 
#[1 12 93 0 11 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 3 9 0 59 3 13 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 5 66 0 133 12 105 0 177 3 17 0 223] 
#[0 5 78 0 4 0 17 0 43 0 67 0 80 0 81 0 86 0 91 0 133 1 108] 
#[1 5 82 0 4 5 82 0 43 5 82 0 80 5 82 0 91 4 1 0 133] 
#[0 5 86 0 10 0 50] 
#[1 5 90 0 9 5 90 0 10 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 3 9 0 59 3 13 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 5 90 0 133 3 17 0 223] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 12 109 0 176 12 113 0 216 12 117 0 218 12 121 0 219 12 125 0 220 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[0 12 129 0 133] 
#[0 5 94 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 5 98 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[0 5 102 0 8 0 21 0 33 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133] 
#[1 12 133 0 21 12 137 0 33 12 141 0 76 12 145 0 106 12 149 0 107 12 153 0 108 12 157 0 109 12 161 0 110 12 165 0 111 12 169 0 112 12 173 0 133 12 177 1 29 12 181 1 30 12 185 1 31 12 189 1 32 12 193 1 33 12 197 1 34 12 201 1 35] 
#[1 5 106 0 2 5 106 0 4 5 106 0 6 5 106 0 10 9 97 0 11 9 101 0 12 5 106 0 13 5 106 0 14 5 106 0 18 5 106 0 22 5 106 0 23 5 106 0 24 9 105 0 25 5 106 0 29 5 106 0 30 5 106 0 52 5 106 0 58 5 106 0 65 5 106 0 74 5 106 0 75 5 106 0 77 5 106 0 78 5 106 0 79 5 106 0 94 5 106 0 99 5 106 0 100 9 109 0 101 5 106 0 102 9 113 0 103 9 117 0 104 9 121 0 105 9 125 0 108 9 129 0 114 9 133 0 115 9 137 0 116 9 141 0 117 9 145 0 118 9 149 0 119 9 153 0 120 9 157 0 121 9 161 0 122 9 165 0 123 9 169 0 124 9 173 0 125 9 177 0 126 9 181 0 127 9 185 0 128 9 189 0 129 5 106 0 135 11 225 1 40 9 205 1 42] 
#[1 5 110 0 2 5 110 0 4 5 110 0 6 5 110 0 10 9 97 0 11 9 101 0 12 5 110 0 13 5 110 0 14 5 110 0 18 5 110 0 22 5 110 0 23 5 110 0 24 9 105 0 25 5 110 0 29 5 110 0 30 5 110 0 52 5 110 0 58 5 110 0 65 5 110 0 74 5 110 0 75 5 110 0 77 5 110 0 78 5 110 0 79 5 110 0 94 5 110 0 99 5 110 0 100 9 109 0 101 5 110 0 102 9 113 0 103 9 117 0 104 9 121 0 105 9 125 0 108 9 129 0 114 9 133 0 115 9 137 0 116 9 141 0 117 9 145 0 118 9 149 0 119 9 153 0 120 9 157 0 121 9 161 0 122 9 165 0 123 9 169 0 124 9 173 0 125 9 177 0 126 9 181 0 127 9 185 0 128 9 189 0 129 5 110 0 135 11 225 1 40 9 205 1 42] 
#[0 5 114 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[1 3 66 0 2 3 66 0 4 3 66 0 11 3 66 0 12 3 66 0 13 3 66 0 14 3 66 0 18 3 66 0 22 3 66 0 23 3 66 0 24 3 66 0 29 3 66 0 30 3 66 0 52 3 66 0 58 9 21 0 61 3 66 0 74 3 66 0 77 3 66 0 78 3 66 0 99 3 66 0 133 3 66 0 135 12 205 0 235] 
#[1 12 209 0 4 8 105 0 18 8 109 0 23 8 113 0 24 8 117 0 29 8 121 0 30 8 129 0 238 8 133 0 239 8 137 0 240 8 141 0 241 8 145 0 242] 
#[1 5 118 0 10 5 118 0 50 3 21 0 59] 
#[0 5 122 0 11 0 12 0 133] 
#[0 5 126 0 2 0 4 0 13 0 14 0 22] 
#[1 3 101 0 13 3 105 0 14 6 109 0 22 8 149 0 97 8 157 1 25 8 161 1 59 8 165 1 60 8 169 1 61 8 173 1 62] 
#[0 5 130 0 11 0 12 0 133] 
#[0 5 134 0 2 0 4 0 13 0 14 0 22] 
#[0 5 134 0 2 0 4 0 13 0 14 0 22] 
#[0 5 138 0 2 0 4 0 13 0 14 0 22] 
#[0 5 142 0 133] 
#[0 12 213 0 133] 
#[0 5 146 0 2 0 4 0 6 0 10 0 13 0 14 0 17 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 54 0 58 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 135] 
#[0 12 217 0 133] 
#[1 5 150 0 8 2 61 0 31 2 65 0 32 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 5 150 0 50 2 117 0 53 3 9 0 59 3 13 0 61 2 137 0 84 2 141 0 85 2 145 0 87 2 149 0 131 2 153 0 132 3 17 0 223] 
#[1 1 50 0 4 1 50 0 10 12 221 0 133 12 225 0 217] 
#[0 5 154 0 4 0 10 0 133] 
#[1 12 229 0 8 12 233 0 50] 
#[0 5 158 0 8 0 50] 
#[1 4 34 0 2 4 34 0 4 4 34 0 6 4 34 0 10 4 34 0 11 4 34 0 12 4 34 0 13 4 34 0 14 4 34 0 18 4 34 0 22 4 34 0 23 4 34 0 24 4 34 0 25 4 34 0 29 4 34 0 30 4 34 0 52 4 34 0 58 4 34 0 65 4 34 0 74 4 34 0 75 4 34 0 77 4 34 0 78 4 34 0 79 4 34 0 94 4 34 0 99 4 34 0 100 4 34 0 101 4 34 0 102 4 34 0 103 4 34 0 104 4 34 0 105 4 34 0 108 4 34 0 114 4 34 0 115 4 34 0 116 4 34 0 117 4 34 0 118 4 34 0 119 4 34 0 120 4 34 0 121 4 34 0 122 4 34 0 123 4 34 0 124 4 34 0 125 4 34 0 126 4 34 0 127 4 34 0 128 4 34 0 129 4 34 0 135 12 237 1 39] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 12 241 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 12 245 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[1 0 73 0 16 0 81 0 48 0 85 0 58 0 89 0 61 0 117 0 82 0 121 0 83 0 125 0 88 0 137 0 131 0 141 0 132 1 193 0 135 1 53 0 137 0 153 0 139 0 157 0 143 0 161 0 222 0 165 0 224 0 169 0 227 12 249 1 36 0 225 1 94 0 237 1 98 0 241 1 100 0 245 1 103 0 253 1 111] 
#[0 12 253 0 135] 
#[0 13 1 0 108] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 13 5 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[1 1 17 0 16 5 162 0 21 5 162 0 33 1 21 0 48 0 85 0 58 1 25 0 61 5 162 0 76 5 162 0 106 5 162 0 107 5 162 0 108 5 162 0 109 5 162 0 110 5 162 0 111 5 162 0 112 1 37 0 131 1 41 0 132 5 162 0 133 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 13 9 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[0 13 13 0 108] 
#[1 13 17 0 135 13 21 1 37] 
#[0 5 166 0 21 0 33 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133] 
#[1 5 170 0 2 5 170 0 4 5 170 0 6 5 170 0 10 5 170 0 13 5 170 0 14 5 170 0 18 5 170 0 22 5 170 0 23 5 170 0 24 5 170 0 29 5 170 0 30 5 170 0 52 5 170 0 58 5 170 0 74 5 170 0 77 5 170 0 78 5 170 0 99 13 25 0 109 5 170 0 135 13 29 1 28] 
#[0 5 174 0 21 0 33 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133] 
#[0 5 178 0 21 0 33 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133] 
#[0 5 182 0 21 0 33 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133] 
#[0 5 186 0 21 0 33 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133] 
#[0 5 190 0 21 0 33 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133] 
#[0 5 194 0 21 0 33 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133] 
#[0 5 198 0 21 0 33 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133] 
#[1 1 90 0 2 1 90 0 4 5 202 0 11 5 202 0 12 1 90 0 13 1 90 0 14 1 90 0 18 1 90 0 22 1 90 0 23 1 90 0 24 1 90 0 29 1 90 0 30 1 90 0 52 1 90 0 58 1 90 0 74 1 90 0 77 1 90 0 78 1 90 0 99 5 202 0 133 1 90 0 135 13 33 0 213 4 225 0 237] 
#[0 5 206 0 11 0 12 0 133] 
#[0 5 210 0 2 0 4 0 6 0 10 0 13 0 14 0 17 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 54 0 58 0 65 0 74 0 75 0 77 0 78 0 79 0 86 0 94 0 96 0 99 0 135] 
#[0 5 214 0 2 0 4 0 13 0 14 0 17 0 52 0 54 0 65 0 74 0 75 0 77 0 78 0 86 0 96 0 99 0 135] 
#[1 1 234 0 4 1 234 0 10 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 12 109 0 176 13 37 0 218 12 121 0 219 12 125 0 220 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[0 5 218 0 4 0 10] 
#[0 13 41 0 61] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 12 109 0 176 13 45 0 220 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[1 5 222 0 2 5 222 0 4 5 222 0 6 5 222 0 10 9 97 0 11 9 101 0 12 5 222 0 13 5 222 0 14 5 222 0 18 5 222 0 22 5 222 0 23 5 222 0 24 9 105 0 25 5 222 0 29 5 222 0 30 5 222 0 52 5 222 0 58 5 222 0 65 5 222 0 74 5 222 0 75 5 222 0 77 5 222 0 78 5 222 0 79 5 222 0 94 5 222 0 99 5 222 0 100 9 109 0 101 5 222 0 102 9 113 0 103 9 117 0 104 9 121 0 105 9 125 0 108 9 129 0 114 9 133 0 115 9 137 0 116 9 141 0 117 9 145 0 118 9 149 0 119 9 153 0 120 9 157 0 121 9 161 0 122 9 165 0 123 9 169 0 124 9 173 0 125 9 177 0 126 9 181 0 127 9 185 0 128 9 189 0 129 5 222 0 135 11 225 1 40 9 205 1 42] 
#[1 5 226 0 21 2 61 0 31 2 65 0 32 5 226 0 33 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 3 9 0 59 3 13 0 61 5 226 0 76 2 137 0 84 2 141 0 85 2 145 0 87 5 226 0 106 5 226 0 107 5 226 0 108 5 226 0 109 5 226 0 110 5 226 0 111 5 226 0 112 2 149 0 131 2 153 0 132 5 226 0 133 3 17 0 223] 
#[1 5 230 0 21 2 61 0 31 2 65 0 32 5 230 0 33 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 5 230 0 76 2 137 0 84 2 141 0 85 2 145 0 87 5 230 0 106 5 230 0 107 5 230 0 108 5 230 0 109 5 230 0 110 5 230 0 111 5 230 0 112 2 149 0 131 2 153 0 132 5 230 0 133 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[1 5 234 0 21 2 61 0 31 2 65 0 32 5 234 0 33 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 101 0 45 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 2 121 0 55 2 125 0 58 2 129 0 59 2 133 0 61 5 234 0 76 2 137 0 84 2 141 0 85 2 145 0 87 5 234 0 106 5 234 0 107 5 234 0 108 5 234 0 109 5 234 0 110 5 234 0 111 5 234 0 112 2 149 0 131 2 153 0 132 5 234 0 133 2 157 0 134 2 161 0 223 2 165 1 101 2 169 1 102] 
#[0 5 238 0 21 0 33 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 13 49 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[1 5 242 0 21 2 61 0 31 2 65 0 32 5 242 0 33 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 3 9 0 59 3 13 0 61 5 242 0 76 2 137 0 84 2 141 0 85 2 145 0 87 5 242 0 106 5 242 0 107 5 242 0 108 5 242 0 109 5 242 0 110 5 242 0 111 5 242 0 112 2 149 0 131 2 153 0 132 5 242 0 133 3 17 0 223] 
#[1 5 246 0 21 2 61 0 31 2 65 0 32 5 246 0 33 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 3 9 0 59 3 13 0 61 5 246 0 76 2 137 0 84 2 141 0 85 2 145 0 87 5 246 0 106 5 246 0 107 5 246 0 108 5 246 0 109 5 246 0 110 5 246 0 111 5 246 0 112 2 149 0 131 2 153 0 132 5 246 0 133 3 17 0 223] 
#[1 1 17 0 16 1 21 0 48 0 85 0 58 1 25 0 61 1 37 0 131 1 41 0 132 2 193 0 136 1 53 0 137 0 153 0 139 1 57 0 143 13 53 0 176 1 109 0 222 1 113 0 224 1 117 0 227 1 121 1 111] 
#[0 5 250 0 21 0 33 0 50 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133] 
#[1 5 254 0 21 5 254 0 33 13 57 0 50 5 254 0 76 5 254 0 106 5 254 0 107 5 254 0 108 5 254 0 109 5 254 0 110 5 254 0 111 5 254 0 112 5 254 0 133] 
#[0 13 61 0 133] 
#[0 6 2 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[1 2 14 0 4 2 14 0 18 2 14 0 23 2 14 0 24 2 14 0 29 2 14 0 30 13 65 0 214] 
#[0 6 6 0 4 0 10 0 133] 
#[1 1 90 0 2 1 90 0 6 1 90 0 10 1 90 0 13 1 90 0 14 1 90 0 18 1 90 0 22 1 90 0 23 1 90 0 24 1 90 0 29 1 90 0 30 1 90 0 52 1 90 0 58 1 90 0 74 1 90 0 77 1 90 0 78 1 90 0 99 1 90 0 135 13 69 0 212 4 221 0 213 4 225 0 237] 
#[0 6 10 0 8 0 50] 
#[1 6 14 0 21 2 61 0 31 2 65 0 32 6 14 0 33 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 3 9 0 59 3 13 0 61 6 14 0 76 2 137 0 84 2 141 0 85 2 145 0 87 6 14 0 106 6 14 0 107 6 14 0 108 6 14 0 109 6 14 0 110 6 14 0 111 6 14 0 112 2 149 0 131 2 153 0 132 6 14 0 133 3 17 0 223] 
#[1 6 18 0 21 2 61 0 31 2 65 0 32 6 18 0 33 2 69 0 34 2 73 0 36 2 77 0 37 2 81 0 38 2 85 0 39 2 89 0 40 2 93 0 41 2 97 0 44 2 105 0 46 2 109 0 47 2 113 0 49 2 117 0 53 3 9 0 59 3 13 0 61 6 18 0 76 2 137 0 84 2 141 0 85 2 145 0 87 6 18 0 106 6 18 0 107 6 18 0 108 6 18 0 109 6 18 0 110 6 18 0 111 6 18 0 112 2 149 0 131 2 153 0 132 6 18 0 133 3 17 0 223] 
#[0 13 73 0 135] 
#[0 6 22 0 2 0 4 0 6 0 10 0 13 0 14 0 18 0 22 0 23 0 24 0 29 0 30 0 52 0 58 0 74 0 77 0 78 0 99 0 135] 
#[1 13 77 0 4 8 105 0 18 8 109 0 23 8 113 0 24 8 117 0 29 8 121 0 30 8 129 0 238 8 133 0 239 8 137 0 240 8 141 0 241 8 145 0 242] 
#[0 13 81 0 10] 
#[0 6 26 0 21 0 33 0 50 0 76 0 106 0 107 0 108 0 109 0 110 0 111 0 112 0 133] 
#[0 6 30 0 11 0 12 0 133] 
#[0 6 34 0 4 0 10 0 133]
	).
]
