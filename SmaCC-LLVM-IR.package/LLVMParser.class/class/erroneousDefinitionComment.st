generated
erroneousDefinitionComment
"# SmaCC adaptation of the LLVM ASM parser.
/*
Copyright (c) 2013, Intel Corporation
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
* Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.
* Neither the name of Intel Corporation nor the names of its contributors
may be used to endorse or promote products derived from this software
without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ""AS IS"" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

# Tokens and types for handling constant integer values
<integerConstant> : [1-9][0-9]* ;
<integerNegConstant> :  - [0-9]+  ;
<integerHexConstant> :  u0x[0-9A-Fa-f]+ ;
<integerHexNegConstant> : s0x[0-9A-Fa-f]+ ;
%id <ESINT64VAL> <EUINT64VAL> <ESAPINTVAL> <EUAPINTVAL> ;
# Generates for types of  constants.
# ESINT64VAL - A negative number within long long range
# EUINT64VAL - A positive number within uns. long long range
# ESAPINTVAL - A negative number with arbitrary precision 
# EUAPINTVAL - A positive number with arbitrary precision 

<LOCAL_ID> : %[0-9]+ ;
<GLOBAL_ID> : @[0-9]+ ;
<FPVAL> : 0x[KLMH]?[0-9A-Fa-f]+ | [-+]?[0-9]+[.][0-9]*([eE][-+]?[0-9]+)? ;     # Float or Double constant

# Built in types...
<INTTYPE> : i[0-9]+ ;
<LABEL> : [-a-zA-Z$._0-9]+\: ;

<LOCALVAR> : \%[-a-zA-Z$._][-a-zA-Z$._0-9]* ;
<GLOBALVAR> : \@[-a-zA-Z$._][-a-zA-Z$._0-9]* ;
<string> : \""[^\""]*\"" ;
<LABELSTR> : <string> \: ;
<STRINGCONSTANT> : <string> ;
<ATSTRINGCONSTANT> : \@ <string> ;
<PCTSTRINGCONSTANT> : \% <string> ;

<metadata_int> : \! [ 0-9]+ ;
<metadata_name> : \! [-a-zA-Z$._][-a-zA-Z$._0-9]* ;
<metadata_string> : \! <string> ;

<whitespace> : \s ;
<comment>: \;[^\r\n]*(\n|\r\n|\r|\r\n) ;

%annotate_tokens ;
%root Abstract ;
%prefix LLVM ;
%suffix Node ;

Module:
	| Module TopLevelElement
	;

TopLevelElement:
	TypeDef | InlineAsm | TargetInfo | GlobalValue | NamedMetadata | AttributeGroup
	;

AttributeGroup:
	""attributes"" ATTRIBUTE_ID ""="" ""{"" (FunctionAttribute | AlignStack ""="" INTEGER | TargetSpecificAttribute)+ ""}""
	;

TargetSpecificAttribute:
	<string> (""="" <string>)?
	;

NamedMetadata:
	<metadata_int> ""="" ""metadata"" MetadataNode
	| <metadata_name> ""="" MetadataNode
	;
	
MetadataRef:
	NamedMetadata|MetadataIdentifier
	;

MetadataIdentifier:
	<metadata_int> | <metadata_name>
	;
	
ValueRef:
	GlobalValueRef |
	LocalValueRef
	;

GlobalValueRef:
	Constant |
	MetadataRef
	;

LocalValueRef:
	LocalValue|LOCAL_ID
	;

GlobalValue:
	GlobalVariable | Function | Alias
	;

GlobalValueDef:
	GlobalVariable | FunctionHeader | Alias
	;

LocalValue:
	NamedInstruction | Parameter
	;

NamedInstruction:
	StartingInstruction |
	NamedMiddleInstruction |
	NamedTerminatorInstruction
	;

Instruction:
	StartingInstruction |
	MiddleInstruction |
	TerminatorInstruction
	;

Alias:
	GlobalName ""alias"" Linkage? Visibility? Type Aliasee
	;

Aliasee:
	GlobalValueDef | GLOBAL_ID | ConstantExpression_convert
	;

TargetInfo:
	""target"" (""datalayout"" | ""triple"") ""="" <string>
	;

InlineAsm:
	""module"" ""asm"" <string> 'asmLine'
	;

GlobalVariable:
	GlobalName 'name' Linkage? 'linkage'  AddressSpace? 'addrSpace' TLSModel? 'tlsModel' ""unnamed_addr"" ? (""constant"" | ""global"") Type 'type' Constant? 'initialValue' ("","" Section 'section')? ("","" Align 'align')?
	;

Constant:
	SimpleConstant |
	StructureConstant | # predicate because a vector constant and a structure constant can start with '<'
	ArrayConstant |
	VectorConstant |
	ZeroInitializer |
	MetadataNode |
	MetadataString |
	BlockAddress |
	Undef |
	ConstantExpression |
	GlobalValueDef 'ref' |
	GLOBAL_ID 'ref'
	;

ConstantExpression:
	ConstantExpression_convert |
	ConstantExpression_getelementptr |
	ConstantExpression_select |
	ConstantExpression_compare |
	ConstantExpression_extractelement |
	ConstantExpression_insertelement |
	ConstantExpression_shufflevector |
	ConstantExpression_extractvalue |
	ConstantExpression_insertvalue |
	ConstantExpression_binary
	;

ConstantExpression_convert:
	ConvertionOpcode 'opcode' ""("" Type 'fromType' GlobalValueRef 'constant' ""to"" Type 'targetType' "")""
	;

ConstantExpression_getelementptr:
	""getelementptr"" 'opcode' ""inbounds""? ""("" Type ""constantType"" GlobalValueRef ""constant"" ("","" Type 'indexTypes' Constant 'indices')* "")""
	;

ConstantExpression_select:
	""select"" 'opcode' ""("" TypedValue 'condition' "","" TypedValue 'op1' "","" TypedValue 'op2' "")""
	;

ConstantExpression_compare:
	(""icmp"" 'opcode' IcmpCondition 'condition' | ""fcmp"" 'opcode' FcmpCondition 'condition') ""("" TypedValue 'op1' "","" TypedValue 'op2' "")""
	;

ConstantExpression_extractelement:
	""extractelement"" 'opcode' ""("" TypedValue 'vector' "","" TypedValue 'index' "")""
	;

ConstantExpression_insertelement:
	""insertelement"" 'opcode' ""("" VectorType 'vectorType' ValueRef 'vector' "","" TypedValue 'element' "","" TypedValue 'index' "")""
	;

ConstantExpression_shufflevector:
	""shufflevector"" 'opcode' ""("" TypedValue 'vector1' "","" TypedValue 'vector2' "","" TypedValue 'mask' "")""
	;

ConstantExpression_extractvalue:
	""extractvalue"" 'opcode' ""("" TypedValue 'value' ("","" INTEGER 'indices')+ "")""
	;

ConstantExpression_insertvalue:
	""insertvalue"" 'opcode' ""("" TypedValue 'value' "","" TypedValue 'element' ("","" INTEGER 'indices')+ "")""
	;

ConstantExpression_binary:
	(
		((""add"" | ""sub"" | ""mul"" | ""shl"") 'opcode' (""nuw""?  ""nsw""?)) |
		((""sdiv"" | ""udiv"" | ""lshr"" | ""ashr"") 'opcode' ""exact""?) |
		(""fadd"" | ""fsub"" | ""fmul"" | ""fdiv"" | ""urem"" | ""srem"" | ""frem"" | ""and"" | ""or"" | ""xor"") 'opcode'
	)
	""("" TypedValue 'op1' "","" TypedValue 'op2' "")""
	;

Undef:
	""undef"" 'undef'
	;

BlockAddress:
	""blockaddress"" ""("" GlobalValueRef 'function' "","" BasicBlockRef 'basicBlock' "")""
	;

ZeroInitializer:
	""zeroinitializer"" {{}}
	;

StructureConstant:
	""{"" ConstantList? 'list' ""}"" | ""<"" 'packed' ""{"" ConstantList? 'list' ""}"" "">""
	;

ArrayConstant:
	""["" ConstantList? 'list' ""]""
	;

VectorConstant:
	""<"" ConstantList? 'list' "">""
	;

ConstantList:
	TypedConstant 'typedConstants' ("","" TypedConstant 'typedConstants')*
	;

TypedConstant:
	Type 'type' Constant 'value'
	;

SimpleConstant:
	(INTEGER | SIGNED_INT | FLOAT | BOOLEAN | NULL | CSTRING) 'value'
	;

MetadataNode:
	""!"" ""{"" (MetadataNodeElement 'elements' ("","" MetadataNodeElement 'elements')*)? ""}""
	;

MetadataNodeElement:
	TypedValue 'value' | MetadataRef 'metadataRef' | NULL 'null'
	;

MetadataString:
	<metadata_string> 'name'
	;

TLSmodel:
	""thread_local"" ""("" TLSoption "")""
	;

TLSoption:
	""localdynamic"" |
	""initialexec"" |
	""localexec""
	;

AddressSpace:
	""addrspace"" ""("" INTEGER 'value' "")""
	;

Section:
	""section"" <string>
	;

Align:
	""align"" INTEGER
	;

Gc:
	""gc"" <string>
	;

Function:
	FunctionDef | FunctionDecl
	;

FunctionDef:
	""define"" FunctionHeader 'header' ""{"" BasicBlock+ 'basicBlocks' ""}""
	;

FunctionDecl:
	""declare"" FunctionHeader 'header'
	;

FunctionHeader:
	Linkage? 'linkage' Visibility? 'visibility' CConv? 'cconv' ""unnamed_addr""? ParameterAttributes? 'rettypeAttrs' Type 'rettype' <GLOBAL_ID> 'name' ""("" Parameters 'parameters' "")"" FunctionAttributes? 'attrs' Section? 'section' Align? 'align' Gc? 'gc' FunctionPrefix? 'functionPrefix'
	;

FunctionPrefix:
	""prefix"" TypedConstant 'value'
	;

Parameters:
	(Parameter 'parameters' ("","" Parameter 'parameters')* ("","" ""..."" 'vararg')?)?
	| ""..."" 'vararg'
	;

FunctionAttributes:
	(FunctionAttribute 'functionAttributes'
	| (AlignStack 'alignstack' ""("" INTEGER 'alignstackValue' "")"")
	| (AttributeGroup | <ATTRIBUTE_ID>) 'functionAttributeGroupRefs' )+
	;

AlignStack:
	""alignstack""
	;

FunctionAttribute:
	(
		""alwaysinline"" |
		""builtin"" |
		""cold"" |
		""inlinehint"" |
		""naked"" |
		""nobuiltin"" |
		""noduplicate"" |
		""noimplicitfloat"" |
		""noinline"" |
		""nonlazybind"" |
		""noredzone"" |
		""noreturn"" |
		""nounwind"" |
		""optnone"" |
		""optsize"" |
		""readnone"" |
		""readonly"" |
		""returns_twice"" |
		""sanitize_address"" |
		""sanitize_memory"" |
		""sanitize_thread"" |
		""ssp"" |
		""sspreq"" |
		""sspstrong"" |
		""uwtable"" |
		""address_safety"" |
		""thread_safety"" |
		""uninitialized_checks""
	) 'attribute'
	;

BasicBlock:
	BasicBlockName 'name' StartingInstruction* 'instructions' MiddleInstruction* 'instructions' TerminatorInstruction 'instructions'
	;

BasicBlockName:
	BASIC_BLOCK_ID?
	;

MetadataSuffix:
	"","" <metadata_name> 'name' MetadataRef 'value'
	;

StartingInstruction:
	LocalName 'name' Instruction_phi 'instruction' MetadataSuffix* 'metadata'
	;

MiddleInstruction:
	(
		NamedMiddleInstruction |
		Instruction_store |
		Instruction_fence |
		Instruction_call_void
	) 'instruction'
	MetadataSuffix* 'metadata'
	;

NamedMiddleInstruction:
	LocalName 'name'
	(
		BinaryInstruction |
		BitwiseBinaryInstruction |
		VectorInstructions |
		AggregateInstruction |
		Instruction_alloca |
		Instruction_load |
		Instruction_getelementptr |
		Instruction_cmpxchg |
		Instruction_atomicrmw |
		ConversionInstruction |
		OtherInstruction |
		Instruction_call_nonVoid
	) 'instruction'
	;

ParamName:
#// A value converter translates this into either %num (if this isn't provided)
#// or into %NAME if it is.
	<LOCAL_ID>?
	;

LocalName:
#// A value converter translates this into either %num (if this isn't provided)
#// or into %NAME if it is.
	(<LOCAL_ID> WS* ""="")?
	;

GlobalName:
#// A value converter translates this into either %num (if this isn't provided)
#// or into %NAME if it is.
	(<GLOBAL_ID> WS* ""="")?
	;

TerminatorInstruction:
	(
		NamedTerminatorInstruction |
		Instruction_ret |
		Instruction_br |
		Instruction_switch |
		Instruction_indirectbr |
		Instruction_resume |
		Instruction_unreachable |
		Instruction_invoke_void
	) 'instruction'
	MetadataSuffix* 'metadata'
	;

NamedTerminatorInstruction:
	LocalName 'name' Instruction_invoke_nonVoid 'instruction'
	;
	
#// ret <type> <value> ; Return a value from a non-void function
#// ret void ; Return from void function
Instruction_ret:
	""ret"" 'opcode' (TypedValue 'val' | ""void"")
	;

#// br i1 <cond>, label <iftrue>, label <iffalse>
#// br label <dest> ; Unconditional branch
Instruction_br:
	""br"" 'opcode' (
		(TypedValue 'condition' "","" ""label"" BasicBlockRef 'true' "","" ""label"" BasicBlockRef 'false' ) |
		(""label"" BasicBlockRef 'unconditional' )
	)
	;

#// switch <intty> <value>, label <defaultdest> [ <intty> <val>, label <dest> ... ]
Instruction_switch:
	""switch"" 'opcode' TypedValue 'comparisonValue' "","" ""label"" BasicBlockRef 'defaultDest' ""["" (TypedValue 'caseConditions' "","" ""label"" BasicBlockRef 'destinations')* ""]""
	;

#// indirectbr <somety>* <address>, [ label <dest1>, label <dest2>, ... ]
Instruction_indirectbr:
	""indirectbr"" 'opcode' TypedValue 'address' "","" ""[""
		(""label"" BasicBlockRef 'destinations' ("","" ""label"" BasicBlockRef 'destinations')*)?
	""]""
	;

#// <result> = invoke [cconv] [ret attrs] <ptr to function ty> <function ptr val>(<function args>) [fn attrs]
#// to label <normal label> unwind label <exception label>
#// Notice this template as it appears in the reference is incorrect, <ptr to function ty> actually
#// behaves just like in a call instruction, so it's possible to provide return type only.
Instruction_invoke_void:
	""invoke"" 'opcode' CConv? 'cconv' (""zeroext""? & ""signext""? & ""inreg""?) VoidType 'type' Callee 'callee' ArgList 'args' FunctionAttributes? 'attributes' ""to"" ""label"" BasicBlockRef 'toLabel' ""unwind"" ""label"" BasicBlockRef 'exceptionLabel'
	;

#// <result> = invoke [cconv] [ret attrs] <ptr to function ty> <function ptr val>(<function args>) [fn attrs]
#// to label <normal label> unwind label <exception label>
#// Notice this template as it appears in the reference is incorrect, <ptr to function ty> actually
#// behaves just like in a call instruction, so it's possible to provide return type only.
Instruction_invoke_nonVoid:
	""invoke"" 'opcode' CConv? 'cconv' (""zeroext""? & ""signext""? & ""inreg""?) NonVoidType 'type' Callee 'callee' ArgList 'args' FunctionAttributes? 'attributes'
""to"" ""label"" BasicBlockRef 'toLabel' ""unwind"" ""label"" BasicBlockRef 'exceptionLabel'
	;
	
// resume <type> <value>
Instruction_resume:
opcode='resume' value=TypedValue
;
// unreachable
Instruction_unreachable:
opcode='unreachable'
;
BasicBlockRef:
ref=[BasicBlock|LOCAL_ID]
;
BinaryInstruction:
Instruction_add |
Instruction_fadd |
Instruction_sub |
Instruction_fsub |
Instruction_mul |
Instruction_fmul |
Instruction_udiv |
Instruction_sdiv |
Instruction_fdiv |
Instruction_urem |
Instruction_srem |
Instruction_frem
;
// <result> = add <ty> <op1>, <op2> ; yields {ty}:result
// <result> = add nuw <ty> <op1>, <op2> ; yields {ty}:result
// <result> = add nsw <ty> <op1>, <op2> ; yields {ty}:result
// <result> = add nuw nsw <ty> <op1>, <op2> ; yields {ty}:result
Instruction_add:
opcode='add' ('nuw'? & 'nsw'?) type=Type op1=ValueRef ',' op2=ValueRef
;
// <result> = fadd [fast-math flags]* <ty> <op1>, <op2> ; yields {ty}:result
Instruction_fadd:
opcode='fadd' fastMathFlags+=FastMathFlag* type=Type op1=ValueRef ',' op2=ValueRef
;
FastMathFlag:
{FastMathFlag}
kind=(""nnan"" | ""ninf"" | ""nsz"" | ""arcp"" | ""fast"")
;
// <result> = sub <ty> <op1>, <op2> ; yields {ty}:result
// <result> = sub nuw <ty> <op1>, <op2> ; yields {ty}:result
// <result> = sub nsw <ty> <op1>, <op2> ; yields {ty}:result
// <result> = sub nuw nsw <ty> <op1>, <op2> ; yields {ty}:result
Instruction_sub:
opcode='sub' ('nuw'? & 'nsw'?) type=Type op1=ValueRef ',' op2=ValueRef
;
// <result> = fsub [fast-math flags]* <ty> <op1>, <op2> ; yields {ty}:result
Instruction_fsub:
opcode='fsub' fastMathFlags+=FastMathFlag* type=Type op1=ValueRef ',' op2=ValueRef
;
// <result> = mul <ty> <op1>, <op2> ; yields {ty}:result
// <result> = mul nuw <ty> <op1>, <op2> ; yields {ty}:result
// <result> = mul nsw <ty> <op1>, <op2> ; yields {ty}:result
// <result> = mul nuw nsw <ty> <op1>, <op2> ; yields {ty}:result
Instruction_mul:
opcode='mul' ('nuw'? & 'nsw'?) type=Type op1=ValueRef ',' op2=ValueRef
;
// <result> = fmul [fast-math flags]* <ty> <op1>, <op2> ; yields {ty}:result
Instruction_fmul:
opcode='fmul' fastMathFlags+=FastMathFlag* type=Type op1=ValueRef ',' op2=ValueRef
;
// <result> = udiv <ty> <op1>, <op2> ; yields {ty}:result
// <result> = udiv exact <ty> <op1>, <op2> ; yields {ty}:result
Instruction_udiv:
opcode='udiv' 'exact'? type=Type op1=ValueRef ',' op2=ValueRef
;
// <result> = sdiv <ty> <op1>, <op2> ; yields {ty}:result
// <result> = sdiv exact <ty> <op1>, <op2> ; yields {ty}:result
Instruction_sdiv:
opcode='sdiv' 'exact'? type=Type op1=ValueRef ',' op2=ValueRef
;
// <result> = fdiv [fast-math flags]* <ty> <op1>, <op2> ; yields {ty}:result
Instruction_fdiv:
opcode='fdiv' fastMathFlags+=FastMathFlag* type=Type op1=ValueRef ',' op2=ValueRef
;
// <result> = urem <ty> <op1>, <op2> ; yields {ty}:result
Instruction_urem:
opcode='urem' type=Type op1=ValueRef ',' op2=ValueRef
;
// <result> = srem <ty> <op1>, <op2> ; yields {ty}:result
Instruction_srem:
opcode='srem' type=Type op1=ValueRef ',' op2=ValueRef
;
// <result> = frem <ty> <op1>, <op2> ; yields {ty}:result
Instruction_frem:
opcode='frem' type=Type op1=ValueRef ',' op2=ValueRef
;
BitwiseBinaryInstruction:
Instruction_shl |
Instruction_lshr |
Instruction_ashr |
Instruction_and |
Instruction_or |
Instruction_xor
;
// <result> = shl <ty> <op1>, <op2> ; yields {ty}:result
// <result> = shl nuw <ty> <op1>, <op2> ; yields {ty}:result
// <result> = shl nsw <ty> <op1>, <op2> ; yields {ty}:result
// <result> = shl nuw nsw <ty> <op1>, <op2> ; yields {ty}:result
Instruction_shl:
opcode='shl' ('nuw'? & 'nsw'?) type=Type op1=ValueRef ',' op2=ValueRef
;
// <result> = lshr <ty> <op1>, <op2> ; yields {ty}:result
// <result> = lshr exact <ty> <op1>, <op2> ; yields {ty}:result
Instruction_lshr:
opcode='lshr' 'exact'? type=Type op1=ValueRef ',' op2=ValueRef
;
// <result> = ashr <ty> <op1>, <op2> ; yields {ty}:result
// <result> = ashr exact <ty> <op1>, <op2> ; yields {ty}:result
Instruction_ashr:
opcode='ashr' 'exact'? type=Type op1=ValueRef ',' op2=ValueRef
;
// <result> = and <ty> <op1>, <op2> ; yields {ty}:result
Instruction_and:
opcode='and' type=Type op1=ValueRef ',' op2=ValueRef
;
// <result> = or <ty> <op1>, <op2> ; yields {ty}:result
Instruction_or:
opcode='or' type=Type op1=ValueRef ',' op2=ValueRef
;
// <result> = xor <ty> <op1>, <op2> ; yields {ty}:result
Instruction_xor:
opcode='xor' type=Type op1=ValueRef ',' op2=ValueRef
;
VectorInstructions:
Instruction_extractelement |
Instruction_insertelement |
Instruction_shufflevector
;
// <result> = extractelement <n x <ty>> <val>, i32 <idx> ; yields <ty>
Instruction_extractelement:
opcode='extractelement' vector=TypedValue ',' index=TypedValue
;
// <result> = insertelement <n x <ty>> <val>, <ty> <elt>, i32 <idx> ; yields <n x <ty>>
Instruction_insertelement:
opcode='insertelement' vector=TypedValue
',' element=TypedValue
',' index=TypedValue
;
// <result> = shufflevector <n x <ty>> <v1>, <n x <ty>> <v2>, <m x i32> <mask> ; yields <m x <ty>>
Instruction_shufflevector:
opcode='shufflevector'
vector1=TypedValue ','
vector2=TypedValue ','
mask=TypedValue
;
AggregateInstruction:
Instruction_extractvalue |
Instruction_insertvalue
;
// <result> = extractvalue <aggregate type> <val>, <idx>{, <idx>}*
Instruction_extractvalue:
opcode='extractvalue' aggregate=TypedValue (',' indices+=Constant)+
;
// <result> = insertvalue <aggregate type> <val>, <ty> <elt>, <idx>{, <idx>}* ; yields <aggregate type>
Instruction_insertvalue:
opcode='insertvalue' aggregate=TypedValue
',' element=TypedValue
(',' indices+=Constant)+
;
MemoryInstruction:
Instruction_alloca |
Instruction_load |
Instruction_store |
Instruction_fence |
Instruction_cmpxchg |
Instruction_atomicrmw |
Instruction_getelementptr
;
// <result> = alloca <type>[, <ty> <NumElements>][, align <alignment>] ; yields {type*}:result
Instruction_alloca:
opcode='alloca' type=Type
(',' numElements=TypedValue)?
(',' alignment=Align)?
;
// <result> = load [volatile] <ty>* <pointer>[, align <alignment>][, !nontemporal !<index>][, !invariant.load !<index>]
// <result> = load atomic [volatile] <ty>* <pointer> [singlethread] <ordering>, align <alignment>
// !<index> = !{ i32 1 }
Instruction_load:
opcode='load'
(
(
'volatile'? pointer=TypedValue
(',' alignment=Align)?
(',' '!nontemporal' nontemporalIndex=MetadataRef)?
(',' '!invariant.load' invariantLoadIndex=MetadataRef)?
) |
(
'atomic' 'volatile'? pointer=TypedValue
'singlethread'?
ordering=Ordering
alignment=Align
)
)
;
// store [volatile] <ty> <value>, <ty>* <pointer>[, align <alignment>][, !nontemporal !<index>] ; yields {void}
// store atomic [volatile] <ty> <value>, <ty>* <pointer> [singlethread] <ordering>, align <alignment> ; yields {void}
Instruction_store:
opcode='store'
(
(
'volatile'?
value=TypedValue
',' pointer=TypedValue
(',' alignment=Align)?
(',' '!nontemporal' nontemporalIndex=MetadataRef)?
) |
(
'atomic' 'volatile'?
value=TypedValue
pointer=TypedValue
'singlethread'?
ordering=Ordering
alignment=Align
)
)
;
// fence [singlethread] <ordering> ; yields {void}
Instruction_fence:
opcode='fence' 'singlethread'? ordering=Ordering
;
// cmpxchg [volatile] <ty>* <pointer>, <ty> <cmp>, <ty> <new> [singlethread] <ordering> ; yields {ty}
Instruction_cmpxchg:
opcode='cmpxchg' 'volatile'? pointer=TypedValue
',' comparedWith=TypedValue
',' newValue=TypedValue
'singlethread'? ordering=Ordering
;
// atomicrmw [volatile] <operation> <ty>* <pointer>, <ty> <value> [singlethread] <ordering>
// ; yields {ty}
Instruction_atomicrmw:
opcode='atomicrmw' 'volatile'? operation=Atomicrmw_operation
pointer=TypedValue
',' argument=TypedValue 'singlethread'? ordering=Ordering
;
Atomicrmw_operation:
'xchg' | 'add' | 'sub' | 'and' | 'nand' |
'or' | 'xor' | 'max' | 'min' | 'umax' | 'umin'
;
// <result> = getelementptr <pty>* <ptrval>{, <ty> <idx>}*
// <result> = getelementptr inbounds <pty>* <ptrval>{, <ty> <idx>}*
// <result> = getelementptr <ptr vector> ptrval, <vector index type> idx
Instruction_getelementptr:
opcode='getelementptr' 'inbounds'?
base=TypedValue
(',' indices+=TypedValue)*
;
ConversionInstruction:
// Merged since they all look exactly the same except the opcode
opcode=ConvertionOpcode
fromType=Type value=ValueRef 'to' targetType=Type
;
ConvertionOpcode:
'trunc' | 'zext' | 'sext' |
'fptrunc' | 'fpext' | 'fptoui' | 'fptosi' | 'uitofp' | 'sitofp' |
'ptrtoint' | 'inttoptr' |
'bitcast' | 'addrspacecast'
;
OtherInstruction:
Instruction_icmp |
Instruction_fcmp |
Instruction_select |
Instruction_va_arg |
Instruction_landingpad
;
// <result> = icmp <cond> <ty> <op1>, <op2> ; yields {i1} or {<N x i1>}:result
Instruction_icmp:
opcode='icmp' condition=IcmpCondition type=Type op1=ValueRef ',' op2=ValueRef
;
IcmpCondition:
'eq' | 'ne' |
'ugt' | 'uge' | 'ult' | 'ule' |
'sgt' | 'sge' | 'slt' | 'sle'
;
// <result> = fcmp <cond> <ty> <op1>, <op2> ; yields {i1} or {<N x i1>}:result
Instruction_fcmp:
opcode='fcmp' condition=FcmpCondition type=Type op1=ValueRef ',' op2=ValueRef
;
FcmpCondition:
BOOLEAN |
'oeq' | 'ogt' | 'oge' | 'olt' | 'ole' | 'one' | 'ord' |
'ueq' | 'ugt' | 'uge' | 'ult' | 'ule' | 'une' | 'uno'
;
// <result> = phi <ty> [ <val0>, <label0>], ...
Instruction_phi:
opcode='phi' type=Type
('[' values+=ValueRef ',' labels+=BasicBlockRef ']')
(',' '[' values+=ValueRef ',' labels+=BasicBlockRef ']')*
;
// <result> = select selty <cond>, <ty> <val1>, <ty> <val2> ; yields ty
// selty is either i1 or {<N x i1>}
Instruction_select:
opcode='select' condition=TypedValue
',' value1=TypedValue
',' value2=TypedValue
;
// <result> = [tail] call [cconv] [ret attrs] <ty> [<fnty>*] <fnptrval>(<function args>) [fn attrs]
Instruction_call_nonVoid:
isTail?='tail'?
opcode='call'
cconv=CConv?
returnAttributes=ParameterAttributes?
type=NonVoidType
callee=Callee
args=ArgList
functionAttributes=FunctionAttributes?
;
Instruction_call_void:
isTail?='tail'?
opcode='call'
cconv=CConv?
returnAttributes=ParameterAttributes?
type=VoidType
callee=Callee
args=ArgList
functionAttributes=FunctionAttributes?
;
ArgList:
{ArgList}
'(' (arguments+=Argument (',' arguments+=Argument)* )? ')'
;
Callee:
ValueRef | InlineAssembler
;
InlineAssembler:
'asm' 'sideeffect'? 'alignstack'? 'inteldialect'? assembler=STRING ',' flags=STRING
;
// <resultval> = va_arg <va_list*> <arglist>, <argty>
Instruction_va_arg:
opcode='va_arg' arglist=TypedValue ',' type=Type
;
// <resultval> = landingpad <resultty> personality <type> <pers_fn> <clause>+
// <resultval> = landingpad <resultty> personality <type> <pers_fn> cleanup <clause>*
// <clause> := catch <type> <value>
// <clause> := filter <array constant type> <array constant>
Instruction_landingpad:
opcode='landingpad' resultType=Type 'personality' personality=TypedValue
(clauses+=LandingpadClause | 'cleanup')
clauses+=LandingpadClause*
;
LandingpadClause:
landingPadType='catch' catchType=TypedValue |
landingPadType='filter' arrayType=ArrayType arrayConstant=ArrayConstant
;
Ordering:
'unordered' | 'monotonic' | 'acquire' | 'release' | 'acq_rel' | 'seq_cst'
;
TypedValue:
type=Type ref=ValueRef
;
ParameterType:
type=Type attrs=ParameterAttributes?
;
ParameterAttributes:
attributes+=ParameterAttribute+
;
ParameterAttribute:
'zeroext' |
'signext' |
'inreg' |
('byval' ('align' INTEGER)?) |
'sret' |
'noalias' |
'nocapture' |
'nest' |
'returned' |
'inalloca'
;
Argument:
type=ParameterType ref=ValueRef
;
Parameter:
type=ParameterType name=ParamName
;
NonVoidType:
// A function which returns void, or a pointer to such a function.
baseType=VoidType
suffixes+=TypeSuffix+
|
// A non-void single type, or a pointer to such a type, or a function which returns
// such a type or a pointer to such a type, or a pointer to such a function. In short,
// All type options not covered by the previous alternative, but not including ""void"",
// which is the only type not allowed.
baseType=NonLeftRecursiveNonVoidType
stars+=Star*
suffixes+=TypeSuffix*
;
Star:
{Star}
addressSpace=AddressSpace? '*'
;
Type:
baseType=NonLeftRecursiveType
// Pointers or functions:
stars+=Star*
suffixes+=TypeSuffix*
;
// A suffix of a function type or a pointer to a function type - basically
// the entire function type, not including the return type.
TypeSuffix:
{TypeSuffix}
'(' (
(containedTypes+=ParameterType (',' containedTypes+=ParameterType)* (',' vararg='...')?)? |
vararg='...'
)')'
stars+=Star*
;
NonLeftRecursiveType:
// Complete types:
(type=(
IntType |
FloatingType |
VectorType |
ArrayType |
X86mmxType |
VoidType |
MetadataType |
StructType |
OpaqueType
) |
typedef=[TypeDef|LOCAL_ID])
;
NonLeftRecursiveNonVoidType:
// Complete types:
(type=(
IntType |
FloatingType |
VectorType |
ArrayType |
X86mmxType |
MetadataType |
StructType |
OpaqueType
) |
typedef=[TypeDef|LOCAL_ID])
;
TypeDef:
name=LocalName 'type' type=NonVoidType
;
BinaryOpcode:
'mov' | 'add' | 'sub'
;
IntType:
INT_TYPE {IntType}
;
OpaqueType:
'opaque' {OpaqueType}
;
StructType:
{StructType}
(
'{' (types+=Type (',' types+=Type)*)? '}' |
packed='<' '{' (types+=Type (',' types+=Type)*)? '}' '>'
)
;
VectorType:
'<' size=INTEGER 'x' elemType=Type '>'
;
ArrayType:
'[' size=INTEGER 'x' elemType=Type ']'
;
X86mmxType:
'x86_mmx' {X86mmxType}
;
VoidType:
'void' {VoidType}
;
MetadataType:
'metadata' {MetadataType}
;
FloatingType:
('half' | 'float' | 'double' | 'fp128' | 'x86_fp80' | 'ppc_fp128') {FloatingType}
;
Linkage:
'private' |
'linker_private' |
'linker_private_weak' |
'linker_private_weak_def_auto' |
'internal' |
'available_externally' |
'linkonce' |
'weak' |
'common' |
'appending' |
'extern_weak' |
'linkonce_odr' |
'weak_odr' |
'external' |
'dllimport' |
'dllexport'
;
CConv:
val=(
'ccc' |
'fastcc' |
'coldcc' |
'webkit_jscc' |
'anyregcc' |
'preserve_mostcc' |
'preserve_allcc' |
// The following are not documented in the langref:
""intel_ocl_bicc"" |
""x86_stdcallcc"" |
""x86_fastcallcc"" |
""x86_thiscallcc"" |
""arm_apcscc"" |
""arm_aapcscc"" |
""arm_aapcs_vfpcc"" |
""msp430_intrcc"" |
""ptx_kernel"" |
""ptx_device"" |
""spir_kernel"" |
""spir_func"" |
""x86_64_sysvcc"" |
""x86_64_win64cc""
)
|
// Custom
val='cc' customNumber=INTEGER
;
Visibility:
'default' |
'hidden' |
'protected'
;
terminal BOOLEAN:
'true' | 'false'
;
terminal NULL:
'null'
;
terminal INT_TYPE:
'i' INTEGER
;
terminal GLOBAL_ID:
'@' (INTEGER | NAME | STRING)
;
terminal LOCAL_ID:
'%' (INTEGER | NAME | STRING)
;
terminal BASIC_BLOCK_ID:
(INTEGER | NAME | STRING) ':'
;
terminal META_INT:
'!' INTEGER
;
terminal META_NAME:
'!' NAME
;
terminal ATTRIBUTE_ID:
'#' (INTEGER | NAME)
;
terminal INTEGER:
('0'..'9')+
;
terminal SIGNED_INT:
('+' | '-') INTEGER
;
terminal fragment NAME:
('a'..'z'|'A'..'Z'|'$'|'.'|'_'|'-') ('a'..'z'|'A'..'Z'|'$'|'.'|'_'|'0'..'9'|'-')*
;
terminal CSTRING:
'c' STRING
;
terminal STRING:
'""' ( '\\' ( '\\' | (('a'..'f' | 'A'..'F' | '0'..'9') ('a'..'f' | 'A'..'F' | '0'..'9'))) | !('\\'|'""') )* '""'
;
terminal METADATA_STRING:
'!' STRING
;
terminal FLOAT:
(SIGNED_INT | INTEGER) '.' INTEGER ('e' (SIGNED_INT | INTEGER))?
| '0x' ('K' | 'L' | 'M' | 'H')? ('a'..'f' | 'A'..'F' | '0'..'9')+
;
terminal FILECHECK_COMMENT:
'; ' ('A'..'Z' | '_' | '-')+ ': ' !('\n'|'\r')* ('\r'? '\n')?
;
terminal SL_COMMENT:
';' !('\n'|'\r')* ('\r'? '\n')?
;
terminal WS : (' '|'\t'|'\r'|'\n')+;
terminal ANY_OTHER: .;"
