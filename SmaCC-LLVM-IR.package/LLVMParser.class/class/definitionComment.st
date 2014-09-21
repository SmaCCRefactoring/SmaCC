generated
definitionComment
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

<float> : 0x[KLMH]?[0-9A-Fa-f]+ | [-+]?[0-9]+[.][0-9]*([eE][-+]?[0-9]+)? ;     # Float or Double constant
<boolean> : true | false ;
<null>: null ;
<integer> :  [0-9]+ ;
<name> :  [a-zA-Z\$\._\-][a-zA-Z\$\._\-0-9]* ;
<string> : \""[^\""]*\"" ;  #Missing \ characters.
<int_type> : i <integer>;
<global_id> : \@ (<integer> | <name> | <string>) ;
<local_id> : \% (<integer> | <name> | <string>) ;
<basic_block_id> : (<integer> | <name> | <string>) \: ;
<meta_int> : \! <integer> ;
<meta_name> : \! <name> ;
<attribute_id> : \# (<integer> | <name>) ;
<signed_int> : [\+\-] <integer> ;
<cstring> : c <string> ;
<metadata_string> : \! <string> ;

<whitespace> : \s ;
<comment>: \;[^\r\n]*(\n|\r\n|\r|\r\n) ;

Module:
	| Module TopLevelElement
	;

TopLevelElement:
	TypeDef | InlineAsm | TargetInfo | GlobalValue | NamedMetadata | AttributeGroup
	;

AttributeGroup:
	""attributes"" <attribute_id> ""="" ""{"" (FunctionAttribute | AlignStack ""="" <integer> | TargetSpecificAttribute)+ ""}""
	;

TargetSpecificAttribute:
	<string> (""="" <string>)?
	;

NamedMetadata:
	<meta_int> 'name' ""="" ""metadata"" MetadataNode 'node'
	| <meta_name> 'name' ""="" MetadataNode 'node'
	;
	
MetadataRef:
	NamedMetadata
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
	LocalValue
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

Alias:
	GlobalName ""alias"" Linkage? Visibility? Type Aliasee
	;

Aliasee:
	GlobalValueDef | ConstantExpression_convert 'bitcast'
	;

TargetInfo:
	""target"" (""datalayout"" | ""triple"") 'infoType' ""="" <string> 'layout'
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
	GlobalValueDef 'ref'
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
	""extractvalue"" 'opcode' ""("" TypedValue 'value' ("","" <integer> 'indices')+ "")""
	;

ConstantExpression_insertvalue:
	""insertvalue"" 'opcode' ""("" TypedValue 'value' "","" TypedValue 'element' ("","" <integer> 'indices')+ "")""
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
	""zeroinitializer""
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
	(<integer> | <signed_int> | <float> | <boolean> | <null> | <cstring>) 'value'
	;

MetadataNode:
	""!"" ""{"" (MetadataNodeElement 'elements' ("","" MetadataNodeElement 'elements')*)? ""}""
	;

MetadataNodeElement:
	TypedValue 'value' | MetadataRef 'metadataRef' | <null> 'null'
	;

MetadataString:
	<metadata_string> 'name'
	;

TLSModel:
	""thread_local"" ""("" TLSOption "")""
	;

TLSOption:
	""localdynamic"" |
	""initialexec"" |
	""localexec""
	;

AddressSpace:
	""addrspace"" ""("" <integer> 'value' "")""
	;

Section:
	""section"" <string>
	;

Align:
	""align"" <integer>
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
	Linkage? 'linkage' Visibility? 'visibility' CConv? 'cconv' ""unnamed_addr""? ParameterAttributes? 'rettypeAttrs' Type 'rettype' <global_id> 'name' ""("" Parameters 'parameters' "")"" FunctionAttributes? 'attrs' Section? 'section' Align? 'align' Gc? 'gc' FunctionPrefix? 'functionPrefix'
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
	| (AlignStack 'alignstack' ""("" <integer> 'alignstackValue' "")"")
	| AttributeGroup 'functionAttributeGroupRefs' )+
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
	<basic_block_id> ?
	;

MetadataSuffix:
	"","" <meta_name> 'name' MetadataRef 'value'
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
		MemoryInstruction |
		OtherInstruction |
		Instruction_call_nonVoid
	) 'instruction'
	;

ParamName:
# A value converter translates this into either %num (if this isn't provided)
# or into %NAME if it is.
	<local_id>?
	;

LocalName:
#// A value converter translates this into either %num (if this isn't provided)
#// or into %NAME if it is.
	(<local_id> ""="")?
	;

GlobalName:
#// A value converter translates this into either %num (if this isn't provided)
#// or into %NAME if it is.
	(<global_id> ""="")?
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
	
# ret <type> <value> ; Return a value from a non-void function
# ret void ; Return from void function
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
	""invoke"" 'opcode' CConv? 'cconv' (""zeroext""? ""signext""? ""inreg""?) VoidType 'type' Callee 'callee' ArgList 'args' FunctionAttributes? 'attributes' ""to"" ""label"" BasicBlockRef 'toLabel' ""unwind"" ""label"" BasicBlockRef 'exceptionLabel'
	;

# <result> = invoke [cconv] [ret attrs] <ptr to function ty> <function ptr val>(<function args>) [fn attrs]
# to label <normal label> unwind label <exception label>
# Notice this template as it appears in the reference is incorrect, <ptr to function ty> actually
# behaves just like in a call instruction, so it's possible to provide return type only.
Instruction_invoke_nonVoid:
	""invoke"" 'opcode' CConv? 'cconv' (""zeroext""? ""signext""? ""inreg""?) NonVoidType 'type' Callee 'callee' ArgList 'args' FunctionAttributes? 'attributes' ""to"" ""label"" BasicBlockRef 'toLabel' ""unwind"" ""label"" BasicBlockRef 'exceptionLabel'
	;
	
# resume <type> <value>
Instruction_resume:
	""resume"" 'opcode' TypedValue 'value'
	;

# unreachable
Instruction_unreachable:
	""unreachable"" 'opcode'
	;

BasicBlockRef:
	BasicBlock  'ref'
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

# <result> = add <ty> <op1>, <op2> ; yields {ty}:result
# <result> = add nuw <ty> <op1>, <op2> ; yields {ty}:result
# <result> = add nsw <ty> <op1>, <op2> ; yields {ty}:result
# <result> = add nuw nsw <ty> <op1>, <op2> ; yields {ty}:result
Instruction_add:
	""add"" 'opcode' ""nuw""? ""nsw""? Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

# <result> = fadd [fast-math flags]* <ty> <op1>, <op2> ; yields {ty}:result
Instruction_fadd:
	""fadd"" 'opcode' FastMathFlag* 'fastMathFlags' Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

FastMathFlag:
	(""nnan"" | ""ninf"" | ""nsz"" | ""arcp"" | ""fast"") 'kind'
	;

# <result> = sub <ty> <op1>, <op2> ; yields {ty}:result
# <result> = sub nuw <ty> <op1>, <op2> ; yields {ty}:result
# <result> = sub nsw <ty> <op1>, <op2> ; yields {ty}:result
# <result> = sub nuw nsw <ty> <op1>, <op2> ; yields {ty}:result
Instruction_sub:
	""sub"" 'opcode' ""nuw""? ""nsw""? Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

# <result> = fsub [fast-math flags]* <ty> <op1>, <op2> ; yields {ty}:result
Instruction_fsub:
	""fsub"" 'opcode' FastMathFlag* 'fastMathFlags' Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

# <result> = mul <ty> <op1>, <op2> ; yields {ty}:result
# <result> = mul nuw <ty> <op1>, <op2> ; yields {ty}:result
# <result> = mul nsw <ty> <op1>, <op2> ; yields {ty}:result
# <result> = mul nuw nsw <ty> <op1>, <op2> ; yields {ty}:result
Instruction_mul:
	""mul"" 'opcode' ""nuw""? ""nsw"" ? Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

# <result> = fmul [fast-math flags]* <ty> <op1>, <op2> ; yields {ty}:result
Instruction_fmul:
	""fmul"" 'opcode' FastMathFlag* 'fastMathFlags' Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

# <result> = udiv <ty> <op1>, <op2> ; yields {ty}:result
# <result> = udiv exact <ty> <op1>, <op2> ; yields {ty}:result
Instruction_udiv:
	""udiv"" 'opcode' ""exact""? Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

# <result> = sdiv <ty> <op1>, <op2> ; yields {ty}:result
# <result> = sdiv exact <ty> <op1>, <op2> ; yields {ty}:result
Instruction_sdiv:
	""sdiv"" 'opcode' ""exact""? Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

# <result> = fdiv [fast-math flags]* <ty> <op1>, <op2> ; yields {ty}:result
Instruction_fdiv:
	""fdiv 'opcode"" FastMathFlag* 'fastMathFlags' Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

# <result> = urem <ty> <op1>, <op2> ; yields {ty}:result
Instruction_urem:
	""urem"" 'opcode' Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

# <result> = srem <ty> <op1>, <op2> ; yields {ty}:result
Instruction_srem:
	""srem"" 'opcode' Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

# <result> = frem <ty> <op1>, <op2> ; yields {ty}:result
Instruction_frem:
	""frem"" 'opcode' Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

BitwiseBinaryInstruction:
	Instruction_shl |
	Instruction_lshr |
	Instruction_ashr |
	Instruction_and |
	Instruction_or |
	Instruction_xor
	;

# <result> = shl <ty> <op1>, <op2> ; yields {ty}:result
# <result> = shl nuw <ty> <op1>, <op2> ; yields {ty}:result
# <result> = shl nsw <ty> <op1>, <op2> ; yields {ty}:result
# <result> = shl nuw nsw <ty> <op1>, <op2> ; yields {ty}:result
Instruction_shl:
	""shl"" 'opcode' ""nuw""? ""nsw""? Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

# <result> = lshr <ty> <op1>, <op2> ; yields {ty}:result
# <result> = lshr exact <ty> <op1>, <op2> ; yields {ty}:result
Instruction_lshr:
	""lshr"" 'opcode' ""exact""? Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

# <result> = ashr <ty> <op1>, <op2> ; yields {ty}:result
# <result> = ashr exact <ty> <op1>, <op2> ; yields {ty}:result
Instruction_ashr:
	""ashr"" 'opcode' ""exact""? Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

# <result> = and <ty> <op1>, <op2> ; yields {ty}:result
Instruction_and:
	""and"" 'opcode' Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

# <result> = or <ty> <op1>, <op2> ; yields {ty}:result
Instruction_or:
	""or"" 'opcode' Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

# <result> = xor <ty> <op1>, <op2> ; yields {ty}:result
Instruction_xor:
	""xor"" 'opcode' Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

VectorInstructions:
	Instruction_extractelement |
	Instruction_insertelement |
	Instruction_shufflevector
	;

# <result> = extractelement <n x <ty>> <val>, i32 <idx> ; yields <ty>
Instruction_extractelement:
	""extractelement"" 'opcode' TypedValue 'vector' "","" TypedValue 'index'
	;

# <result> = insertelement <n x <ty>> <val>, <ty> <elt>, i32 <idx> ; yields <n x <ty>>
Instruction_insertelement:
	""insertelement"" 'opcode' TypedValue 'vector' "","" TypedValue 'element' "","" TypedValue 'index'
	;

# <result> = shufflevector <n x <ty>> <v1>, <n x <ty>> <v2>, <m x i32> <mask> ; yields <m x <ty>>
Instruction_shufflevector:
	""shufflevector"" 'opcode' TypedValue 'vector1' "","" TypedValue 'vector2' "","" TypedValue 'mask'
	;

AggregateInstruction:
	Instruction_extractvalue |
	Instruction_insertvalue
	;

# <result> = extractvalue <aggregate type> <val>, <idx>{, <idx>}*
Instruction_extractvalue:
	""extractvalue"" 'opcode' TypedValue 'aggregate' ("","" Constant 'indices')+
	;
# <result> = insertvalue <aggregate type> <val>, <ty> <elt>, <idx>{, <idx>}* ; yields <aggregate type>
Instruction_insertvalue:
	""insertvalue"" 'opcode' TypedValue 'aggregate' "","" TypedValue 'element' ("","" Constant 'indices')+
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
	
# <result> = alloca <type>[, <ty> <NumElements>][, align <alignment>] ; yields {type*}:result
Instruction_alloca:
	""alloca"" 'opcode' Type 'type' ("","" TypedValue 'numElements' )? ("","" Align 'alignment')?
	;

# <result> = load [volatile] <ty>* <pointer>[, align <alignment>][, !nontemporal !<index>][, !invariant.load !<index>]
# <result> = load atomic [volatile] <ty>* <pointer> [singlethread] <ordering>, align <alignment>
# !<index> = !{ i32 1 }
Instruction_load:
	""load"" 'opcode' (
		( ""volatile""? TypedValue 'pointer' ("","" Align 'alignment')? ("","" ""!nontemporal"" MetadataRef 'nontemporalIndex')? ("","" ""!invariant.load"" MetadataRef 'invariantLoadIndex')? ) |
		( ""atomic"" ""volatile""? TypedValue 'pointer' ""singlethread""? Ordering 'ordering' Align 'alignment' )
	)
	;

# store [volatile] <ty> <value>, <ty>* <pointer>[, align <alignment>][, !nontemporal !<index>] ; yields {void}
# store atomic [volatile] <ty> <value>, <ty>* <pointer> [singlethread] <ordering>, align <alignment> ; yields {void}
Instruction_store:
	""store"" 'opcode' (
		( ""volatile""? TypedValue 'value' "","" TypedValue 'pointer' ("","" Align 'alignment')? ("","" ""!nontemporal"" MetadataRef 'nontemporalIndex')? ) |
		(""atomic"" ""volatile""? TypedValue 'value' TypedValue 'pointer' ""singlethread""? Ordering 'ordering' Align 'alignment' )
	)
	;

# fence [singlethread] <ordering> ; yields {void}
Instruction_fence:
	""fence"" 'opcode' ""singlethread""? Ordering 'ordering'
	;

# cmpxchg [volatile] <ty>* <pointer>, <ty> <cmp>, <ty> <new> [singlethread] <ordering> ; yields {ty}
Instruction_cmpxchg:
	""cmpxchg"" 'opcode' ""volatile""? TypedValue 'pointer' "","" TypedValue 'comparedWith' "","" TypedValue 'newValue' ""singlethread""? Ordering 'ordering'
	;

# atomicrmw [volatile] <operation> <ty>* <pointer>, <ty> <value> [singlethread] <ordering>
# ; yields {ty}
Instruction_atomicrmw:
	""atomicrmw"" 'opcode' ""volatile""? Atomicrmw_operation 'operation' TypedValue 'pointer' "","" TypedValue 'argument' ""singlethread""? Ordering 'ordering'
	;

Atomicrmw_operation:
	""xchg"" | ""add"" | ""sub"" | ""and"" | ""nand"" | ""or"" | ""xor"" | ""max"" | ""min"" | ""umax"" | ""umin""
	;

# <result> = getelementptr <pty>* <ptrval>{, <ty> <idx>}*
# <result> = getelementptr inbounds <pty>* <ptrval>{, <ty> <idx>}*
# <result> = getelementptr <ptr vector> ptrval, <vector index type> idx
Instruction_getelementptr:
	""getelementptr"" ""inbounds""? TypedValue 'base' ("","" TypedValue 'indices')*
	;

ConversionInstruction:
# Merged since they all look exactly the same except the opcode
	ConvertionOpcode 'opcode' Type 'fromType' ValueRef 'value' ""to"" Type 'targetType'
	;

ConvertionOpcode:
	""trunc"" | ""zext"" | ""sext"" | ""fptrunc"" | ""fpext"" | ""fptoui"" | ""fptosi"" | ""uitofp"" | ""sitofp"" | ""ptrtoint"" | ""inttoptr"" | ""bitcast"" | ""addrspacecast""
	;

OtherInstruction:
	Instruction_icmp |
	Instruction_fcmp |
	Instruction_select |
	Instruction_va_arg |
	Instruction_landingpad
	;

# <result> = icmp <cond> <ty> <op1>, <op2> ; yields {i1} or {<N x i1>}:result
Instruction_icmp:
	""icmp"" 'opcode' IcmpCondition 'condition' Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

IcmpCondition:
	""eq"" | ""ne"" | ""ugt"" | ""uge"" | ""ult"" | ""ule"" | ""sgt"" | ""sge"" | ""slt"" | ""sle""
	;

# <result> = fcmp <cond> <ty> <op1>, <op2> ; yields {i1} or {<N x i1>}:result
Instruction_fcmp:
	""fcmp"" 'opcode' FcmpCondition 'condition' Type 'type' ValueRef 'op1' "","" ValueRef 'op2'
	;

FcmpCondition:
	<boolean> | ""oeq"" | ""ogt"" | ""oge"" | ""olt"" | ""ole"" | ""one"" | ""ord"" | ""ueq"" | ""ugt"" | ""uge"" | ""ult"" | ""ule"" | ""une"" | ""uno""
	;

# <result> = phi <ty> [ <val0>, <label0>], ...
Instruction_phi:
	""phi"" 'opcode' Type 'type' (""["" ValueRef 'values' "","" BasicBlockRef 'labels' ""]"") ("","" ""["" ValueRef 'values' "","" BasicBlockRef 'labels' ""]"")*
	;
# <result> = select selty <cond>, <ty> <val1>, <ty> <val2> ; yields ty
# selty is either i1 or {<N x i1>}
Instruction_select:
	""select"" 'opcode' TypedValue 'condition' "","" TypedValue 'value1' "","" TypedValue 'value2'
	;

# <result> = [tail] call [cconv] [ret attrs] <ty> [<fnty>*] <fnptrval>(<function args>) [fn attrs]
Instruction_call_nonVoid:
	""tail""? 'isTail' ""call"" 'opcode' CConv? 'cconv' ParameterAttributes? 'returnAttributes' NonVoidType 'type' Callee 'callee' ArgList 'args' FunctionAttributes? 'functionAttributes'
	;

Instruction_call_void:
	""tail""? 'isTail' ""call"" 'opcode' CConv? 'cconv' ParameterAttributes? 'returnAttributes' VoidType 'type' Callee 'callee' ArgList 'args' FunctionAttributes? 'functionAttributes'
	;

ArgList:
	""("" (Argument 'arguments' ("","" Argument 'arguments' )* )? "")""
	;

Callee:
	ValueRef | InlineAssembler
	;

InlineAssembler:
	""asm"" ""sideeffect""? ""alignstack""? ""inteldialect""? <string> 'assembler' "","" <string> 'flags'
	;

# <resultval> = va_arg <va_list*> <arglist>, <argty>
Instruction_va_arg:
	""va_arg"" 'opcode' TypedValue 'arglist' "","" Type 'type'
	;

# <resultval> = landingpad <resultty> personality <type> <pers_fn> <clause>+
# <resultval> = landingpad <resultty> personality <type> <pers_fn> cleanup <clause>*
# <clause> := catch <type> <value>
# <clause> := filter <array constant type> <array constant>
Instruction_landingpad:
	""landingpad"" 'opcode' Type 'resultType' ""personality"" TypedValue 'personality' (LandingpadClause 'clauses' | ""cleanup"") LandingpadClause* 'clauses'
	;

LandingpadClause:
	""catch"" 'landingPadType' TypedValue 'catchType'
	| ""filter"" 'landingPadType' ArrayType 'arrayType' ArrayConstant 'arrayConstant'
	;

Ordering:
	""unordered"" | ""monotonic"" | ""acquire"" | ""release"" | ""acq_rel"" | ""seq_cst""
	;

TypedValue:
	Type 'type' ValueRef 'ref'
	;

ParameterType:
	Type 'type' ParameterAttributes? 'attrs'
	;

ParameterAttributes:
	ParameterAttribute+ 'attributes'
	;

ParameterAttribute:
	""zeroext"" |
	""signext"" |
	""inreg"" |
	(""byval"" (""align"" <integer>)?) |
	""sret"" |
	""noalias"" |
	""nocapture"" |
	""nest"" |
	""returned"" |
	""inalloca""
	;

Argument:
	ParameterType 'type' ValueRef 'ref'
	;

Parameter:
	ParameterType 'type' ParamName 'name'
	;

NonVoidType:
# A function which returns void, or a pointer to such a function.
	VoidType 'baseType' TypeSuffix+ 'suffixes'
	|
# A non-void single type, or a pointer to such a type, or a function which returns
# such a type or a pointer to such a type, or a pointer to such a function. In short,
# All type options not covered by the previous alternative, but not including ""void"",
# which is the only type not allowed.
	NonLeftRecursiveNonVoidType 'baseType' Star* 'stars' TypeSuffix* 'suffixes'
	;

Star:
	AddressSpace? 'addressSpace' ""*""
	;

Type:
	NonLeftRecursiveType 'baseType' Star* 'stars' TypeSuffix* 'suffixes'
	;

# A suffix of a function type or a pointer to a function type - basically
# the entire function type, not including the return type.
TypeSuffix:
	""("" (
		(ParameterType 'containedTypes' ("","" ParameterType 'containedTypes')* ("","" ""..."" 'vararg')?)?
		| ""..."" 'vararg'
	)"")"" Star* 'stars'
	;

NonLeftRecursiveType:
# Complete types:
	(
		IntType |
		FloatingType |
		VectorType |
		ArrayType |
		X86mmxType |
		VoidType |
		MetadataType |
		StructType |
		OpaqueType
	) 'type'
	| TypeDef 'typedef'
	;

NonLeftRecursiveNonVoidType:
# Complete types:
	(
		IntType |
		FloatingType |
		VectorType |
		ArrayType |
		X86mmxType |
		MetadataType |
		StructType |
		OpaqueType
	) 'type'
	| TypeDef 'typedef'
	;

TypeDef:
	LocalName 'name' ""type"" NonVoidType 'type'
	;

# strange that it isn't needed?
#BinaryOpcode:
#	""mov"" | ""add"" | ""sub""
#	;

IntType:
	<int_type>
	;

OpaqueType:
	""opaque""
	;

StructType:
	""{"" (Type 'types' ("","" Type 'types')*)? ""}""
	|
	""<"" 'packed' ""{"" (Type 'types' ("","" Type 'types' )*)? ""}"" "">""
	;

VectorType:
	""<"" <integer> 'size' ""x"" Type 'elemType' "">""
	;

ArrayType:
	""["" <integer> 'size' ""x"" Type 'elemType' ""]""
	;

X86mmxType:
	""x86_mmx""
	;

VoidType:
	""void"" 
	;

MetadataType:
	""metadata""
	;

FloatingType:
	(""half"" | ""float"" | ""double"" | ""fp128"" | ""x86_fp80"" | ""ppc_fp128"")
	;

Linkage:
	""private"" |
	""linker_private"" |
	""linker_private_weak"" |
	""linker_private_weak_def_auto"" |
	""internal"" |
	""available_externally"" |
	""linkonce"" |
	""weak"" |
	""common"" |
	""appending"" |
	""extern_weak"" |
	""linkonce_odr"" |
	""weak_odr"" |
	""external"" |
	""dllimport"" |
	""dllexport""
	;

CConv:
	(
		""ccc"" |
		""fastcc"" |
		""coldcc"" |
		""webkit_jscc"" |
		""anyregcc"" |
		""preserve_mostcc"" |
		""preserve_allcc"" |
			# The following are not documented in the langref:
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
	) 'val'
	| ""cc"" 'val' <integer> 'customNumber'
	;

Visibility:
	""default"" |
	""hidden"" |
	""protected""
	;"
