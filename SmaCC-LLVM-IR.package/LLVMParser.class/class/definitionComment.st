generated
definitionComment
"# SmaCC adaptation of the LLVM ASM parser.
# llvmAsmParser.y - Parser for llvm assembly files --------*- C++ -*-===
# LLLexer.cpp
#
#                     The LLVM Compiler Infrastructure
# This file is distributed under the University of Illinois Open Source
#  License. See LICENSE.TXT for details.

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

<LOCALVAL_ID> : %[0-9]+ ;
<GLOBALVAL_ID> : @[0-9]+ ;
<FPVAL> : 0x[KLM]?[0-9A-Fa-f]+ | [-+]?[0-9]+[.][0-9]*([eE][-+]?[0-9]+)? ;     # Float or Double constant

# Built in types...
<INTTYPE> : i[0-9]+ ;
<LABEL> : [-a-zA-Z$._0-9]+\: ;

<LOCALVAR> : %[-a-zA-Z$._][-a-zA-Z$._0-9]* ;
<GLOBALVAR> : @[-a-zA-Z$._][-a-zA-Z$._0-9]* ;
<LABELSTR> : \""[^\""]*\""\: ;
<STRINGCONSTANT> : \""[^\""]*\"" ;
<ATSTRINGCONSTANT> : \@\""[^\""]*\"" ;
<PCTSTRINGCONSTANT> : \%\""[^\""]*\"" ;

<whitespace> : \s ;

%start Module ;
#%annotate_tokens ;
#%root Module ;
#%prefix LLVM ;
#%suffix Node ;

ArithmeticOps: ""add"" | ""sub"" | ""nul"" | ""udiv"" | ""sdiv"" | ""fdiv"" | ""urem"" | ""srem"" | ""frem"";
LogicalOps   : ""shl"" | ""lshr"" | ""ashr"" | ""and"" | ""or"" | ""xor"";
CastOps      : ""trunc"" | ""zext"" | ""sext"" | ""fptrunc"" | ""fpext"" | ""bitcast"" | 
               ""uitofp"" | ""sitofp"" | ""fptoui"" | ""fptosi"" | ""inttoptr"" | ""ptrtoint"";

IPredicates  
  : ""eq""     | ""ne""   
  | ""slt""   | ""sgt""  
  | ""sle""   | ""sge""  
  | ""ult""   | ""ugt""  
  | ""ule""   | ""uge"" 
  ;

FPredicates  
  : ""oeq""   | ""one""  
  | ""olt""   | ""ogt""  
  | ""ole""   | ""oge""  
  | ""ord""   | ""uno""  
  | ""ueq""   | ""une""  
  | ""ult""   | ""ugt""  
  | ""ule""   | ""uge""  
  | ""true"" 
  | ""false"" 
  ;

# These are some types that allow classification if we only want a particular 
# thing... for example, only a signed, unsigned, or integral type.
IntType :  <INTTYPE> ;
FPType   : ""float"" | ""double"" | ""ppc_fp128"" | ""fp128"" | ""x86_fp80"";

LocalName : <LOCALVAR> | <STRINGCONSTANT> | <PCTSTRINGCONSTANT> ;
OptLocalName : LocalName | ;

OptAddrSpace : ""addrspace"" ""("" <EUINT64VAL> "")"" 
             | ;

OptLocalAssign : LocalName ""="" 
  |  ;

LocalNumber : <LOCALVAL_ID> ""="" ;


GlobalName : <GLOBALVAR> | <ATSTRINGCONSTANT> ;

OptGlobalAssign : GlobalAssign
  | ;

GlobalAssign : GlobalName ""="" ;

GVInternalLinkage 
  : ""internal""     
  | ""weak""         
  | ""linkonce""    
  | ""appending""   
  | ""dllexport""    
  | ""common""      
  ;

GVExternalLinkage
  : ""dllimport""   
  | ""extern_weak"" 
  | ""external""    
  ;

GVVisibilityStyle
  : 
  | ""default""   
  | ""hidden""    
  | ""protected"" 
  ;

FunctionDeclareLinkage
  :   
  | ""dllimport""    
  | ""extern_weak"" 
  ;
  
FunctionDefineLinkage
  :   
  | ""internal""    
  | ""linkonce""    
  | ""weak""        
  | ""dllexport""    
  ; 

AliasLinkage
  :
  | ""weak""        
  | ""internal""    
  ;

OptCallingConv :  |
                 ""ccc""             |
                 ""fastcc""          |
                 ""coldcc""          |
                 ""x86_stdcallcc""   |
                 ""x86_fastcallcc""  |
                 ""x86_ssecallcc""   |
                 ""cc"" <EUINT64VAL>  ;

ParamAttr     : ""zeroext"" 
              | ""zext""    
              | ""signext"" 
              | ""sext""    
              | ""inreg""   
              | ""sret""    
              | ""noalias"" 
              | ""byval""   
              | ""nest""    
              | ""align"" <EUINT64VAL> 
              ;

OptParamAttrs : /* empty */  
              | OptParamAttrs ParamAttr 
              ;

FuncAttr      : ""noreturn"" 
              | ""nounwind"" 
              | ""inreg""    
              | ""zeroext""  
              | ""signext""  
              | ""readnone"" 
              | ""readonly"" 
              ;

OptFuncAttrs  : /* empty */ 
              | OptFuncAttrs FuncAttr 
              ;

FuncNoteList  : FuncNote 
              | FuncNoteList "","" FuncNote 
              ;

FuncNote      : ""inline"" ""="" ""never"" 
              | ""inline"" ""="" ""always"" 
              | ""optimizeforsize"" 
              ;

OptFuncNotes  : /* empty */ 
              | ""fnnote"" ""("" FuncNoteList  "")"" 
              ;

OptGC         : /* empty */ 
              | ""gc"" <STRINGCONSTANT>
              ;

# OptAlign/OptCAlign - An optional alignment, and an optional alignment with
# a comma before it.
OptAlign :          |
           ""align"" <EUINT64VAL> ;
OptCAlign :              |
            "","" ""align"" <EUINT64VAL> ;



SectionString : ""section"" <STRINGCONSTANT> ;

OptSection :   |
             SectionString ;

# GlobalVarAttributes - Used to pass the attributes string on a global.  CurGV
# is set to be the global we are processing.
GlobalVarAttributes : /* empty */  |
                     "","" GlobalVarAttribute GlobalVarAttributes ;
GlobalVarAttribute : SectionString  
  | ""align"" <EUINT64VAL> ;

#===----------------------------------------------------------------------===
# Types includes all predefined types... except void, because it can only be
# used in specific contexts (function returning void for example).  

# Derived types are added later...
PrimType : <INTTYPE> | ""float"" | ""double"" | ""ppc_fp128"" | ""fp128"" | ""x86_fp80"" | ""label"" ;

Types 
  : ""opaque"" 
  | PrimType 
  | Types OptAddrSpace ""*"" 
  | SymbolicValueRef 
  | ""\\"" <EUINT64VAL> 
  | Types ""("" ArgTypeListI "")"" # OptFuncAttrs removed, only allowed as backup
  | ""void"" ""("" ArgTypeListI "")"" # OptFuncAttrs removed, only allowed as backup
  | ""["" <EUINT64VAL> ""x"" Types ""]"" 
  | ""<"" <EUINT64VAL> ""x"" Types "">"" 
  | ""{"" TypeListI ""}"" 
  | ""{"" ""}"" 
  | ""<"" ""{"" TypeListI ""}"" "">"" 
  | ""<"" ""{"" ""}"" "">"" 
  ;

ArgType 
  : Types OptParamAttrs 
  ;

ResultTypes
  : Types 
  | ""void"" 
  ;

ArgTypeList : ArgType 
  | ArgTypeList "","" ArgType 
  ;

ArgTypeListI 
  : ArgTypeList
  | ArgTypeList "","" ""..."" 
  | ""..."" 
  |  ;

# TypeList - Used for struct declarations and as a basis for function type 
# declaration type lists
TypeListI : Types 
  | TypeListI "","" Types ;

# ConstVal - The various declarations that go into the constant pool.  This
# production is used ONLY to represent constants that show up AFTER a 'const',
# 'constant' or 'global' token at global scope.  Constants that can be inlined
# into other expressions (such as integers and constexprs) are handled by the
# ResolvedVal, ValueRef and ConstValueRef productions.
#
ConstVal: Types ""["" ConstVector ""]"" 
  | Types ""["" ""]"" 
  | Types ""c"" <STRINGCONSTANT> 
  | Types ""<"" ConstVector "">"" 
  | Types ""{"" ConstVector ""}"" 
  | Types ""{"" ""}"" 
  | Types ""<"" ""{"" ConstVector ""}"" "">"" 
  | Types ""<"" ""{"" ""}"" "">"" 
  | Types ""null"" 
  | Types ""undef"" 
  | Types SymbolicValueRef 
  | Types ConstExpr 
  | Types ""zeroinitializer"" 
  | IntType <ESINT64VAL> 
  | IntType <ESAPINTVAL> 
  | IntType <EUINT64VAL> 
  | IntType <EUAPINTVAL> 
  | <INTTYPE> ""true"" 
  | <INTTYPE> ""false"" 
  | FPType <FPVAL> ;


ConstExpr: CastOps ""("" ConstVal ""to"" Types "")"" 
  | ""getelementptr"" ""("" ConstVal IndexList "")"" 
  | ""select"" ""("" ConstVal "","" ConstVal "","" ConstVal "")"" 
  | ArithmeticOps ""("" ConstVal "","" ConstVal "")"" 
  | LogicalOps ""("" ConstVal "","" ConstVal "")"" 
  | ""icmp"" IPredicates ""("" ConstVal "","" ConstVal "")"" 
  | ""fcmp"" FPredicates ""("" ConstVal "","" ConstVal "")"" 
  | ""vicmp"" IPredicates ""("" ConstVal "","" ConstVal "")"" 
  | ""vfcmp"" FPredicates ""("" ConstVal "","" ConstVal "")"" 
  | ""extractelement"" ""("" ConstVal "","" ConstVal "")"" 
  | ""insertelement"" ""("" ConstVal "","" ConstVal "","" ConstVal "")"" 
  | ""shufflevector"" ""("" ConstVal "","" ConstVal "","" ConstVal "")"" 
  | ""extractvalue"" ""("" ConstVal ConstantIndexList "")"" 
  | ""insertvalue"" ""("" ConstVal "","" ConstVal ConstantIndexList "")"" ;


ConstVector : ConstVector "","" ConstVal 
  | ConstVal ;


# GlobalType - Match either GLOBAL or CONSTANT for global declarations...
GlobalType : ""global""  | ""constant"" ;

# ThreadLocal 
ThreadLocal : ""thread_local""  | ;

# AliaseeRef - Match either GlobalValue or bitcast to GlobalValue.
AliaseeRef : ResultTypes SymbolicValueRef 
   | ""bitcast"" ""("" AliaseeRef ""to"" Types "")"" ;

#===----------------------------------------------------------------------===
#                             Rules to match Modules
#===----------------------------------------------------------------------===

# Module rule: Capture the result of parsing the whole file into a result
# variable...
#
Module: 
	| DefinitionList 
	;

DefinitionList:
	Definition
	| DefinitionList Definition
	;

Definition:
	""define""  Function 
  	| ""declare""  FunctionProto 
  	| ""module"" ""asm"" AsmBlock   
  	| OptLocalAssign ""type"" Types 
  	| OptLocalAssign ""type"" ""void"" 
 	| OptGlobalAssign GVVisibilityStyle ThreadLocal GlobalType ConstVal OptAddrSpace  GlobalVarAttributes 
	| OptGlobalAssign GVInternalLinkage GVVisibilityStyle ThreadLocal GlobalType ConstVal OptAddrSpace  GlobalVarAttributes 
	| OptGlobalAssign GVExternalLinkage GVVisibilityStyle ThreadLocal GlobalType Types OptAddrSpace  GlobalVarAttributes 
	| OptGlobalAssign GVVisibilityStyle ""alias"" AliasLinkage AliaseeRef 
 	| ""target"" TargetDefinition 
	| ""deplibs"" ""="" LibrariesDefinition 
	;


AsmBlock : <STRINGCONSTANT> ;

TargetDefinition : ""triple"" ""="" <STRINGCONSTANT> 
  | ""datalayout"" ""="" <STRINGCONSTANT> ;

LibrariesDefinition : ""["" LibList ""]"";

LibList : LibList "","" <STRINGCONSTANT> 
        | <STRINGCONSTANT> 
        | /* empty: end of list */ 
        ;

#===----------------------------------------------------------------------===
#                       Rules to match Function Headers
#===----------------------------------------------------------------------===

ArgListH : ArgListH "","" Types OptParamAttrs OptLocalName 
  | Types OptParamAttrs OptLocalName ;

ArgList : ArgListH 
  | ArgListH "","" ""..."" 
  | ""..."" 
  | /* empty */ ;

FunctionHeaderH : OptCallingConv ResultTypes GlobalName ""("" ArgList "")"" 
                  OptFuncAttrs OptSection OptAlign OptGC OptFuncNotes ;

BEGIN : ""begin"" | ""{"";                # Allow BEGIN or '{' to start a function

FunctionHeader : FunctionDefineLinkage GVVisibilityStyle FunctionHeaderH BEGIN ;

END : ""end"" | ""}"";                    # Allow end of '}' to end a function

Function : BasicBlockList END ;

FunctionProto : FunctionDeclareLinkage GVVisibilityStyle FunctionHeaderH ;

#===----------------------------------------------------------------------===
#                        Rules to match Basic Blocks
#===----------------------------------------------------------------------===

OptSideEffect : /* empty */ 
  | ""sideeffect"" ;

ConstValueRef : <ESINT64VAL> 
  | <EUINT64VAL> 
  | <ESAPINTVAL>   
  | <EUAPINTVAL> 
  | <FPVAL> 
  | ""true""  
  | ""false"" 
  | ""null"" 
  | ""undef"" 
  | ""zeroinitializer"" 
  | ""<"" ConstVector "">"" 
  | ""["" ConstVector ""]"" 
  | ""["" ""]"" 
  | ""c"" <STRINGCONSTANT> 
  | ""{"" ConstVector ""}"" 
  | ""{"" ""}"" 
  | ""<"" ""{"" ConstVector ""}"" "">"" 
  | ""<"" ""{"" ""}"" "">"" 
  | ConstExpr 
  | ""asm"" OptSideEffect <STRINGCONSTANT> "","" <STRINGCONSTANT> ;

# SymbolicValueRef - Reference to one of two ways of symbolically refering to
# another value.
#
SymbolicValueRef : <LOCALVAL_ID> 
  | <GLOBALVAL_ID> 
  | LocalName 
  | GlobalName ;

# ValueRef - A reference to a definition... either constant or symbolic
ValueRef : SymbolicValueRef | ConstValueRef;


# ResolvedVal - a <type> <value> pair.  This is used only in cases where the
# type immediately preceeds the value reference, and allows complex constant
# pool references (for things like: 'ret [2 x int] [ int 12, int 42]')
ResolvedVal : Types ValueRef 
  ;

ReturnedVal : ResolvedVal 
  | ReturnedVal "","" ResolvedVal ;

BasicBlockList : BasicBlockList BasicBlock 
  | FunctionHeader BasicBlock ;


# Basic blocks are terminated by branching instructions: 
# br, br/cc, switch, ret
#
BasicBlock : InstructionList OptLocalAssign BBTerminatorInst ;

BasicBlock : InstructionList LocalNumber BBTerminatorInst ;


InstructionList : InstructionList Inst 
  | /* empty */ 
  | <LABELSTR> ;

BBTerminatorInst : 
  ""ret"" ReturnedVal  
  | ""ret"" ""void"" 
  | ""br"" <LABEL> ValueRef                                                # Conditional Branch...
  | ""br"" ""int"" ValueRef "","" <LABEL> ValueRef "","" <LABEL> ValueRef 
  | ""switch"" IntType ValueRef "","" <LABEL> ValueRef ""["" JumpTable ""]"" 
  | ""switch"" IntType ValueRef "","" <LABEL> ValueRef ""["" ""]"" 
  | ""invoke"" OptCallingConv ResultTypes ValueRef ""("" ParamList "")"" OptFuncAttrs
    ""to"" <LABEL> ValueRef ""unwind"" <LABEL> ValueRef 
  | ""unwind"" 
  | ""unreachable"" ;



JumpTable : JumpTable IntType ConstValueRef "","" <LABEL> ValueRef 
  | IntType ConstValueRef "","" <LABEL> ValueRef ;

Inst : OptLocalAssign InstVal ;

Inst : LocalNumber InstVal ;


PHIList : Types ""["" ValueRef "","" ValueRef ""]"" 
  | PHIList "","" ""["" ValueRef "","" ValueRef ""]"" ;


ParamList : Types OptParamAttrs ValueRef OptParamAttrs 
  | <LABEL> OptParamAttrs ValueRef OptParamAttrs 
  | ParamList "","" Types OptParamAttrs ValueRef OptParamAttrs 
  | ParamList "","" <LABEL> OptParamAttrs ValueRef OptParamAttrs 
  |  ;

IndexList       # Used for gep instructions and constant expressions
  :  
  | IndexList "","" ResolvedVal 
  ;

ConstantIndexList       # Used for insertvalue and extractvalue instructions
  : "","" <EUINT64VAL> 
  | ConstantIndexList "","" <EUINT64VAL> 
  ;

OptTailCall : ""tail"" ""call"" 
  | ""call"" ;

InstVal : ArithmeticOps Types ValueRef "","" ValueRef 
  | LogicalOps Types ValueRef "","" ValueRef 
  | ""icmp"" IPredicates Types ValueRef "","" ValueRef  
  | ""fcmp"" FPredicates Types ValueRef "","" ValueRef  
  | ""vicmp"" IPredicates Types ValueRef "","" ValueRef  
  | ""vfcmp"" FPredicates Types ValueRef "","" ValueRef  
  | CastOps ResolvedVal ""to"" Types 
  | ""select"" ResolvedVal "","" ResolvedVal "","" ResolvedVal 
  | ""vaarg"" ResolvedVal "","" Types 
  | ""extractelement"" ResolvedVal "","" ResolvedVal 
  | ""insertelement"" ResolvedVal "","" ResolvedVal "","" ResolvedVal 
  | ""shufflevector"" ResolvedVal "","" ResolvedVal "","" ResolvedVal 
  | ""phi"" PHIList 
  | OptTailCall OptCallingConv ResultTypes ValueRef ""("" ParamList "")"" 
    OptFuncAttrs 
  | MemoryInst ;

OptVolatile : ""volatile"" 
  | /* empty */ ;



MemoryInst : ""malloc"" Types OptCAlign 
  | ""malloc"" Types "","" <INTTYPE> ValueRef OptCAlign 
  | ""alloca"" Types OptCAlign 
  | ""alloca"" Types "","" <INTTYPE> ValueRef OptCAlign 
  | ""free"" ResolvedVal 

  | OptVolatile ""load"" Types ValueRef OptCAlign 
  | OptVolatile ""store"" ResolvedVal "","" Types ValueRef OptCAlign 
  | ""getresult"" Types ValueRef "","" <EUINT64VAL>  
  | ""getelementptr"" Types ValueRef IndexList 
  | ""extractvalue"" Types ValueRef ConstantIndexList 
  | ""insertvalue"" Types ValueRef "","" Types ValueRef ConstantIndexList ;"
