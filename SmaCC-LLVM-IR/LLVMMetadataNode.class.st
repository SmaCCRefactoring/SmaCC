Class {
	#name : #LLVMMetadataNode,
	#superclass : #LLVMAbstractNode,
	#instVars : [
		'metadata_intTokens',
		'equalTokens',
		'metadataTokens',
		'bangTokens',
		'leftBraceTokens',
		'opaqueTokens',
		'iNTTYPETokens',
		'floatTokens',
		'doubleTokens',
		'ppc_fp128Tokens',
		'fp128Tokens',
		'x86_fp80Tokens',
		'addrspaceTokens',
		'leftParenTokens',
		'eUINT64VALTokens',
		'rightParenTokens',
		'timesTokens',
		'__Tokens',
		'voidTokens',
		'leftBracketTokens',
		'xTokens',
		'rightBracketTokens',
		'lessThanTokens',
		'greaterThanTokens',
		'rightBraceTokens',
		'lOCALVAL_IDTokens',
		'gLOBALVAL_IDTokens',
		'lOCALVARTokens',
		'sTRINGCONSTANTTokens',
		'pCTSTRINGCONSTANTTokens',
		'gLOBALVARTokens',
		'aTSTRINGCONSTANTTokens',
		'commaTokens',
		'periodPeriodPeriodTokens',
		'eSINT64VALTokens',
		'eSAPINTVALTokens',
		'eUAPINTVALTokens',
		'fPVALTokens',
		'trueTokens',
		'falseTokens',
		'nullTokens',
		'undefTokens',
		'zeroinitializerTokens',
		'cTokens',
		'truncTokens',
		'zextTokens',
		'sextTokens',
		'fptruncTokens',
		'fpextTokens',
		'bitcastTokens',
		'uitofpTokens',
		'sitofpTokens',
		'fptouiTokens',
		'fptosiTokens',
		'inttoptrTokens',
		'ptrtointTokens',
		'toTokens',
		'getelementptrTokens',
		'selectTokens',
		'addTokens',
		'subTokens',
		'mulTokens',
		'udivTokens',
		'sdivTokens',
		'fdivTokens',
		'uremTokens',
		'sremTokens',
		'fremTokens',
		'shlTokens',
		'lshrTokens',
		'ashrTokens',
		'andTokens',
		'orTokens',
		'xorTokens',
		'icmpTokens',
		'eqTokens',
		'neTokens',
		'sltTokens',
		'sgtTokens',
		'sleTokens',
		'sgeTokens',
		'ultTokens',
		'ugtTokens',
		'uleTokens',
		'ugeTokens',
		'fcmpTokens',
		'oeqTokens',
		'oneTokens',
		'oltTokens',
		'ogtTokens',
		'oleTokens',
		'ogeTokens',
		'ordTokens',
		'unoTokens',
		'ueqTokens',
		'uneTokens',
		'vicmpTokens',
		'vfcmpTokens',
		'extractelementTokens',
		'insertelementTokens',
		'shufflevectorTokens',
		'extractvalueTokens',
		'insertvalueTokens',
		'asmTokens',
		'sideeffectTokens',
		'metadata_nameTokens',
		'zeroextTokens',
		'signextTokens',
		'inregTokens',
		'sretTokens',
		'noaliasTokens',
		'byvalTokens',
		'nestTokens',
		'alignTokens',
		'metadata_stringTokens'
	],
	#category : 'SmaCC-LLVM-IR'
}

{ #category : #generated }
LLVMMetadataNode >> __Tokens [
	^ __Tokens
]

{ #category : #generated }
LLVMMetadataNode >> __Tokens: anOrderedCollection [
	__Tokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> aTSTRINGCONSTANTTokens [
	^ aTSTRINGCONSTANTTokens
]

{ #category : #generated }
LLVMMetadataNode >> aTSTRINGCONSTANTTokens: anOrderedCollection [
	aTSTRINGCONSTANTTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitMetadata: self
]

{ #category : #generated }
LLVMMetadataNode >> addTokens [
	^ addTokens
]

{ #category : #generated }
LLVMMetadataNode >> addTokens: anOrderedCollection [
	addTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> addrspaceTokens [
	^ addrspaceTokens
]

{ #category : #generated }
LLVMMetadataNode >> addrspaceTokens: anOrderedCollection [
	addrspaceTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> alignTokens [
	^ alignTokens
]

{ #category : #generated }
LLVMMetadataNode >> alignTokens: anOrderedCollection [
	alignTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> andTokens [
	^ andTokens
]

{ #category : #generated }
LLVMMetadataNode >> andTokens: anOrderedCollection [
	andTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> ashrTokens [
	^ ashrTokens
]

{ #category : #generated }
LLVMMetadataNode >> ashrTokens: anOrderedCollection [
	ashrTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> asmTokens [
	^ asmTokens
]

{ #category : #generated }
LLVMMetadataNode >> asmTokens: anOrderedCollection [
	asmTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
LLVMMetadataNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> bitcastTokens [
	^ bitcastTokens
]

{ #category : #generated }
LLVMMetadataNode >> bitcastTokens: anOrderedCollection [
	bitcastTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> byvalTokens [
	^ byvalTokens
]

{ #category : #generated }
LLVMMetadataNode >> byvalTokens: anOrderedCollection [
	byvalTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> cTokens [
	^ cTokens
]

{ #category : #generated }
LLVMMetadataNode >> cTokens: anOrderedCollection [
	cTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
LLVMMetadataNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> compositeTokenVariables [
	^ #(#metadata_intTokens #equalTokens #metadataTokens #bangTokens #leftBraceTokens #opaqueTokens #iNTTYPETokens #floatTokens #doubleTokens #ppc_fp128Tokens #fp128Tokens #x86_fp80Tokens #addrspaceTokens #leftParenTokens #eUINT64VALTokens #rightParenTokens #timesTokens #__Tokens #voidTokens #leftBracketTokens #xTokens #rightBracketTokens #lessThanTokens #greaterThanTokens #rightBraceTokens #lOCALVAL_IDTokens #gLOBALVAL_IDTokens #lOCALVARTokens #sTRINGCONSTANTTokens #pCTSTRINGCONSTANTTokens #gLOBALVARTokens #aTSTRINGCONSTANTTokens #commaTokens #periodPeriodPeriodTokens #eSINT64VALTokens #eSAPINTVALTokens #eUAPINTVALTokens #fPVALTokens #trueTokens #falseTokens #nullTokens #undefTokens #zeroinitializerTokens #cTokens #metadata_stringTokens #truncTokens #zextTokens #sextTokens #fptruncTokens #fpextTokens #bitcastTokens #uitofpTokens #sitofpTokens #fptouiTokens #fptosiTokens #inttoptrTokens #ptrtointTokens #toTokens #getelementptrTokens #selectTokens #addTokens #subTokens #mulTokens #udivTokens #sdivTokens #fdivTokens #uremTokens #sremTokens #fremTokens #shlTokens #lshrTokens #ashrTokens #andTokens #orTokens #xorTokens #icmpTokens #eqTokens #neTokens #sltTokens #sgtTokens #sleTokens #sgeTokens #ultTokens #ugtTokens #uleTokens #ugeTokens #fcmpTokens #oeqTokens #oneTokens #oltTokens #ogtTokens #oleTokens #ogeTokens #ordTokens #unoTokens #ueqTokens #uneTokens #vicmpTokens #vfcmpTokens #extractelementTokens #insertelementTokens #shufflevectorTokens #extractvalueTokens #insertvalueTokens #asmTokens #sideeffectTokens #metadata_nameTokens #zeroextTokens #signextTokens #inregTokens #sretTokens #noaliasTokens #byvalTokens #nestTokens #alignTokens)
]

{ #category : #generated }
LLVMMetadataNode >> doubleTokens [
	^ doubleTokens
]

{ #category : #generated }
LLVMMetadataNode >> doubleTokens: anOrderedCollection [
	doubleTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> eSAPINTVALTokens [
	^ eSAPINTVALTokens
]

{ #category : #generated }
LLVMMetadataNode >> eSAPINTVALTokens: anOrderedCollection [
	eSAPINTVALTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> eSINT64VALTokens [
	^ eSINT64VALTokens
]

{ #category : #generated }
LLVMMetadataNode >> eSINT64VALTokens: anOrderedCollection [
	eSINT64VALTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> eUAPINTVALTokens [
	^ eUAPINTVALTokens
]

{ #category : #generated }
LLVMMetadataNode >> eUAPINTVALTokens: anOrderedCollection [
	eUAPINTVALTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> eUINT64VALTokens [
	^ eUINT64VALTokens
]

{ #category : #generated }
LLVMMetadataNode >> eUINT64VALTokens: anOrderedCollection [
	eUINT64VALTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> eqTokens [
	^ eqTokens
]

{ #category : #generated }
LLVMMetadataNode >> eqTokens: anOrderedCollection [
	eqTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
LLVMMetadataNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> extractelementTokens [
	^ extractelementTokens
]

{ #category : #generated }
LLVMMetadataNode >> extractelementTokens: anOrderedCollection [
	extractelementTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> extractvalueTokens [
	^ extractvalueTokens
]

{ #category : #generated }
LLVMMetadataNode >> extractvalueTokens: anOrderedCollection [
	extractvalueTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> fPVALTokens [
	^ fPVALTokens
]

{ #category : #generated }
LLVMMetadataNode >> fPVALTokens: anOrderedCollection [
	fPVALTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> falseTokens [
	^ falseTokens
]

{ #category : #generated }
LLVMMetadataNode >> falseTokens: anOrderedCollection [
	falseTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> fcmpTokens [
	^ fcmpTokens
]

{ #category : #generated }
LLVMMetadataNode >> fcmpTokens: anOrderedCollection [
	fcmpTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> fdivTokens [
	^ fdivTokens
]

{ #category : #generated }
LLVMMetadataNode >> fdivTokens: anOrderedCollection [
	fdivTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> floatTokens [
	^ floatTokens
]

{ #category : #generated }
LLVMMetadataNode >> floatTokens: anOrderedCollection [
	floatTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> fp128Tokens [
	^ fp128Tokens
]

{ #category : #generated }
LLVMMetadataNode >> fp128Tokens: anOrderedCollection [
	fp128Tokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> fpextTokens [
	^ fpextTokens
]

{ #category : #generated }
LLVMMetadataNode >> fpextTokens: anOrderedCollection [
	fpextTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> fptosiTokens [
	^ fptosiTokens
]

{ #category : #generated }
LLVMMetadataNode >> fptosiTokens: anOrderedCollection [
	fptosiTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> fptouiTokens [
	^ fptouiTokens
]

{ #category : #generated }
LLVMMetadataNode >> fptouiTokens: anOrderedCollection [
	fptouiTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> fptruncTokens [
	^ fptruncTokens
]

{ #category : #generated }
LLVMMetadataNode >> fptruncTokens: anOrderedCollection [
	fptruncTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> fremTokens [
	^ fremTokens
]

{ #category : #generated }
LLVMMetadataNode >> fremTokens: anOrderedCollection [
	fremTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> gLOBALVAL_IDTokens [
	^ gLOBALVAL_IDTokens
]

{ #category : #generated }
LLVMMetadataNode >> gLOBALVAL_IDTokens: anOrderedCollection [
	gLOBALVAL_IDTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> gLOBALVARTokens [
	^ gLOBALVARTokens
]

{ #category : #generated }
LLVMMetadataNode >> gLOBALVARTokens: anOrderedCollection [
	gLOBALVARTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> getelementptrTokens [
	^ getelementptrTokens
]

{ #category : #generated }
LLVMMetadataNode >> getelementptrTokens: anOrderedCollection [
	getelementptrTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
LLVMMetadataNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> iNTTYPETokens [
	^ iNTTYPETokens
]

{ #category : #generated }
LLVMMetadataNode >> iNTTYPETokens: anOrderedCollection [
	iNTTYPETokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> icmpTokens [
	^ icmpTokens
]

{ #category : #generated }
LLVMMetadataNode >> icmpTokens: anOrderedCollection [
	icmpTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
LLVMMetadataNode >> initialize [
	super initialize.
	metadata_intTokens := OrderedCollection new: 2.
	equalTokens := OrderedCollection new: 2.
	metadataTokens := OrderedCollection new: 2.
	bangTokens := OrderedCollection new: 2.
	leftBraceTokens := OrderedCollection new: 2.
	opaqueTokens := OrderedCollection new: 2.
	iNTTYPETokens := OrderedCollection new: 2.
	floatTokens := OrderedCollection new: 2.
	doubleTokens := OrderedCollection new: 2.
	ppc_fp128Tokens := OrderedCollection new: 2.
	fp128Tokens := OrderedCollection new: 2.
	x86_fp80Tokens := OrderedCollection new: 2.
	addrspaceTokens := OrderedCollection new: 2.
	leftParenTokens := OrderedCollection new: 2.
	eUINT64VALTokens := OrderedCollection new: 2.
	rightParenTokens := OrderedCollection new: 2.
	timesTokens := OrderedCollection new: 2.
	__Tokens := OrderedCollection new: 2.
	voidTokens := OrderedCollection new: 2.
	leftBracketTokens := OrderedCollection new: 2.
	xTokens := OrderedCollection new: 2.
	rightBracketTokens := OrderedCollection new: 2.
	lessThanTokens := OrderedCollection new: 2.
	greaterThanTokens := OrderedCollection new: 2.
	rightBraceTokens := OrderedCollection new: 2.
	lOCALVAL_IDTokens := OrderedCollection new: 2.
	gLOBALVAL_IDTokens := OrderedCollection new: 2.
	lOCALVARTokens := OrderedCollection new: 2.
	sTRINGCONSTANTTokens := OrderedCollection new: 2.
	pCTSTRINGCONSTANTTokens := OrderedCollection new: 2.
	gLOBALVARTokens := OrderedCollection new: 2.
	aTSTRINGCONSTANTTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	periodPeriodPeriodTokens := OrderedCollection new: 2.
	eSINT64VALTokens := OrderedCollection new: 2.
	eSAPINTVALTokens := OrderedCollection new: 2.
	eUAPINTVALTokens := OrderedCollection new: 2.
	fPVALTokens := OrderedCollection new: 2.
	trueTokens := OrderedCollection new: 2.
	falseTokens := OrderedCollection new: 2.
	nullTokens := OrderedCollection new: 2.
	undefTokens := OrderedCollection new: 2.
	zeroinitializerTokens := OrderedCollection new: 2.
	cTokens := OrderedCollection new: 2.
	metadata_stringTokens := OrderedCollection new: 2.
	truncTokens := OrderedCollection new: 2.
	zextTokens := OrderedCollection new: 2.
	sextTokens := OrderedCollection new: 2.
	fptruncTokens := OrderedCollection new: 2.
	fpextTokens := OrderedCollection new: 2.
	bitcastTokens := OrderedCollection new: 2.
	uitofpTokens := OrderedCollection new: 2.
	sitofpTokens := OrderedCollection new: 2.
	fptouiTokens := OrderedCollection new: 2.
	fptosiTokens := OrderedCollection new: 2.
	inttoptrTokens := OrderedCollection new: 2.
	ptrtointTokens := OrderedCollection new: 2.
	toTokens := OrderedCollection new: 2.
	getelementptrTokens := OrderedCollection new: 2.
	selectTokens := OrderedCollection new: 2.
	addTokens := OrderedCollection new: 2.
	subTokens := OrderedCollection new: 2.
	mulTokens := OrderedCollection new: 2.
	udivTokens := OrderedCollection new: 2.
	sdivTokens := OrderedCollection new: 2.
	fdivTokens := OrderedCollection new: 2.
	uremTokens := OrderedCollection new: 2.
	sremTokens := OrderedCollection new: 2.
	fremTokens := OrderedCollection new: 2.
	shlTokens := OrderedCollection new: 2.
	lshrTokens := OrderedCollection new: 2.
	ashrTokens := OrderedCollection new: 2.
	andTokens := OrderedCollection new: 2.
	orTokens := OrderedCollection new: 2.
	xorTokens := OrderedCollection new: 2.
	icmpTokens := OrderedCollection new: 2.
	eqTokens := OrderedCollection new: 2.
	neTokens := OrderedCollection new: 2.
	sltTokens := OrderedCollection new: 2.
	sgtTokens := OrderedCollection new: 2.
	sleTokens := OrderedCollection new: 2.
	sgeTokens := OrderedCollection new: 2.
	ultTokens := OrderedCollection new: 2.
	ugtTokens := OrderedCollection new: 2.
	uleTokens := OrderedCollection new: 2.
	ugeTokens := OrderedCollection new: 2.
	fcmpTokens := OrderedCollection new: 2.
	oeqTokens := OrderedCollection new: 2.
	oneTokens := OrderedCollection new: 2.
	oltTokens := OrderedCollection new: 2.
	ogtTokens := OrderedCollection new: 2.
	oleTokens := OrderedCollection new: 2.
	ogeTokens := OrderedCollection new: 2.
	ordTokens := OrderedCollection new: 2.
	unoTokens := OrderedCollection new: 2.
	ueqTokens := OrderedCollection new: 2.
	uneTokens := OrderedCollection new: 2.
	vicmpTokens := OrderedCollection new: 2.
	vfcmpTokens := OrderedCollection new: 2.
	extractelementTokens := OrderedCollection new: 2.
	insertelementTokens := OrderedCollection new: 2.
	shufflevectorTokens := OrderedCollection new: 2.
	extractvalueTokens := OrderedCollection new: 2.
	insertvalueTokens := OrderedCollection new: 2.
	asmTokens := OrderedCollection new: 2.
	sideeffectTokens := OrderedCollection new: 2.
	metadata_nameTokens := OrderedCollection new: 2.
	zeroextTokens := OrderedCollection new: 2.
	signextTokens := OrderedCollection new: 2.
	inregTokens := OrderedCollection new: 2.
	sretTokens := OrderedCollection new: 2.
	noaliasTokens := OrderedCollection new: 2.
	byvalTokens := OrderedCollection new: 2.
	nestTokens := OrderedCollection new: 2.
	alignTokens := OrderedCollection new: 2.
]

{ #category : #generated }
LLVMMetadataNode >> inregTokens [
	^ inregTokens
]

{ #category : #generated }
LLVMMetadataNode >> inregTokens: anOrderedCollection [
	inregTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> insertelementTokens [
	^ insertelementTokens
]

{ #category : #generated }
LLVMMetadataNode >> insertelementTokens: anOrderedCollection [
	insertelementTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> insertvalueTokens [
	^ insertvalueTokens
]

{ #category : #generated }
LLVMMetadataNode >> insertvalueTokens: anOrderedCollection [
	insertvalueTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> inttoptrTokens [
	^ inttoptrTokens
]

{ #category : #generated }
LLVMMetadataNode >> inttoptrTokens: anOrderedCollection [
	inttoptrTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> lOCALVAL_IDTokens [
	^ lOCALVAL_IDTokens
]

{ #category : #generated }
LLVMMetadataNode >> lOCALVAL_IDTokens: anOrderedCollection [
	lOCALVAL_IDTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> lOCALVARTokens [
	^ lOCALVARTokens
]

{ #category : #generated }
LLVMMetadataNode >> lOCALVARTokens: anOrderedCollection [
	lOCALVARTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
LLVMMetadataNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
LLVMMetadataNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
LLVMMetadataNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
LLVMMetadataNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> lshrTokens [
	^ lshrTokens
]

{ #category : #generated }
LLVMMetadataNode >> lshrTokens: anOrderedCollection [
	lshrTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> metadataTokens [
	^ metadataTokens
]

{ #category : #generated }
LLVMMetadataNode >> metadataTokens: anOrderedCollection [
	metadataTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> metadata_intTokens [
	^ metadata_intTokens
]

{ #category : #generated }
LLVMMetadataNode >> metadata_intTokens: anOrderedCollection [
	metadata_intTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> metadata_nameTokens [
	^ metadata_nameTokens
]

{ #category : #generated }
LLVMMetadataNode >> metadata_nameTokens: anOrderedCollection [
	metadata_nameTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> metadata_stringTokens [
	^ metadata_stringTokens
]

{ #category : #generated }
LLVMMetadataNode >> metadata_stringTokens: anOrderedCollection [
	metadata_stringTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> mulTokens [
	^ mulTokens
]

{ #category : #generated }
LLVMMetadataNode >> mulTokens: anOrderedCollection [
	mulTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> neTokens [
	^ neTokens
]

{ #category : #generated }
LLVMMetadataNode >> neTokens: anOrderedCollection [
	neTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> nestTokens [
	^ nestTokens
]

{ #category : #generated }
LLVMMetadataNode >> nestTokens: anOrderedCollection [
	nestTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> noaliasTokens [
	^ noaliasTokens
]

{ #category : #generated }
LLVMMetadataNode >> noaliasTokens: anOrderedCollection [
	noaliasTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> nullTokens [
	^ nullTokens
]

{ #category : #generated }
LLVMMetadataNode >> nullTokens: anOrderedCollection [
	nullTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> oeqTokens [
	^ oeqTokens
]

{ #category : #generated }
LLVMMetadataNode >> oeqTokens: anOrderedCollection [
	oeqTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> ogeTokens [
	^ ogeTokens
]

{ #category : #generated }
LLVMMetadataNode >> ogeTokens: anOrderedCollection [
	ogeTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> ogtTokens [
	^ ogtTokens
]

{ #category : #generated }
LLVMMetadataNode >> ogtTokens: anOrderedCollection [
	ogtTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> oleTokens [
	^ oleTokens
]

{ #category : #generated }
LLVMMetadataNode >> oleTokens: anOrderedCollection [
	oleTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> oltTokens [
	^ oltTokens
]

{ #category : #generated }
LLVMMetadataNode >> oltTokens: anOrderedCollection [
	oltTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> oneTokens [
	^ oneTokens
]

{ #category : #generated }
LLVMMetadataNode >> oneTokens: anOrderedCollection [
	oneTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> opaqueTokens [
	^ opaqueTokens
]

{ #category : #generated }
LLVMMetadataNode >> opaqueTokens: anOrderedCollection [
	opaqueTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> orTokens [
	^ orTokens
]

{ #category : #generated }
LLVMMetadataNode >> orTokens: anOrderedCollection [
	orTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> ordTokens [
	^ ordTokens
]

{ #category : #generated }
LLVMMetadataNode >> ordTokens: anOrderedCollection [
	ordTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> pCTSTRINGCONSTANTTokens [
	^ pCTSTRINGCONSTANTTokens
]

{ #category : #generated }
LLVMMetadataNode >> pCTSTRINGCONSTANTTokens: anOrderedCollection [
	pCTSTRINGCONSTANTTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
LLVMMetadataNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> pluralVariablesMap [
	^ Dictionary new
		at: 'metadata_intToken' put: 'metadata_intTokens';
		at: 'equalToken' put: 'equalTokens';
		at: 'metadataToken' put: 'metadataTokens';
		at: 'bangToken' put: 'bangTokens';
		at: 'leftBraceToken' put: 'leftBraceTokens';
		at: 'opaqueToken' put: 'opaqueTokens';
		at: 'iNTTYPEToken' put: 'iNTTYPETokens';
		at: 'floatToken' put: 'floatTokens';
		at: 'doubleToken' put: 'doubleTokens';
		at: 'ppc_fp128Token' put: 'ppc_fp128Tokens';
		at: 'fp128Token' put: 'fp128Tokens';
		at: 'x86_fp80Token' put: 'x86_fp80Tokens';
		at: 'addrspaceToken' put: 'addrspaceTokens';
		at: 'leftParenToken' put: 'leftParenTokens';
		at: 'eUINT64VALToken' put: 'eUINT64VALTokens';
		at: 'rightParenToken' put: 'rightParenTokens';
		at: 'timesToken' put: 'timesTokens';
		at: '__Token' put: '__Tokens';
		at: 'voidToken' put: 'voidTokens';
		at: 'leftBracketToken' put: 'leftBracketTokens';
		at: 'xToken' put: 'xTokens';
		at: 'rightBracketToken' put: 'rightBracketTokens';
		at: 'lessThanToken' put: 'lessThanTokens';
		at: 'greaterThanToken' put: 'greaterThanTokens';
		at: 'rightBraceToken' put: 'rightBraceTokens';
		at: 'lOCALVAL_IDToken' put: 'lOCALVAL_IDTokens';
		at: 'gLOBALVAL_IDToken' put: 'gLOBALVAL_IDTokens';
		at: 'lOCALVARToken' put: 'lOCALVARTokens';
		at: 'sTRINGCONSTANTToken' put: 'sTRINGCONSTANTTokens';
		at: 'pCTSTRINGCONSTANTToken' put: 'pCTSTRINGCONSTANTTokens';
		at: 'gLOBALVARToken' put: 'gLOBALVARTokens';
		at: 'aTSTRINGCONSTANTToken' put: 'aTSTRINGCONSTANTTokens';
		at: 'commaToken' put: 'commaTokens';
		at: 'periodPeriodPeriodToken' put: 'periodPeriodPeriodTokens';
		at: 'eSINT64VALToken' put: 'eSINT64VALTokens';
		at: 'eSAPINTVALToken' put: 'eSAPINTVALTokens';
		at: 'eUAPINTVALToken' put: 'eUAPINTVALTokens';
		at: 'fPVALToken' put: 'fPVALTokens';
		at: 'trueToken' put: 'trueTokens';
		at: 'falseToken' put: 'falseTokens';
		at: 'nullToken' put: 'nullTokens';
		at: 'undefToken' put: 'undefTokens';
		at: 'zeroinitializerToken' put: 'zeroinitializerTokens';
		at: 'cToken' put: 'cTokens';
		at: 'metadata_stringToken' put: 'metadata_stringTokens';
		at: 'truncToken' put: 'truncTokens';
		at: 'zextToken' put: 'zextTokens';
		at: 'sextToken' put: 'sextTokens';
		at: 'fptruncToken' put: 'fptruncTokens';
		at: 'fpextToken' put: 'fpextTokens';
		at: 'bitcastToken' put: 'bitcastTokens';
		at: 'uitofpToken' put: 'uitofpTokens';
		at: 'sitofpToken' put: 'sitofpTokens';
		at: 'fptouiToken' put: 'fptouiTokens';
		at: 'fptosiToken' put: 'fptosiTokens';
		at: 'inttoptrToken' put: 'inttoptrTokens';
		at: 'ptrtointToken' put: 'ptrtointTokens';
		at: 'toToken' put: 'toTokens';
		at: 'getelementptrToken' put: 'getelementptrTokens';
		at: 'selectToken' put: 'selectTokens';
		at: 'addToken' put: 'addTokens';
		at: 'subToken' put: 'subTokens';
		at: 'mulToken' put: 'mulTokens';
		at: 'udivToken' put: 'udivTokens';
		at: 'sdivToken' put: 'sdivTokens';
		at: 'fdivToken' put: 'fdivTokens';
		at: 'uremToken' put: 'uremTokens';
		at: 'sremToken' put: 'sremTokens';
		at: 'fremToken' put: 'fremTokens';
		at: 'shlToken' put: 'shlTokens';
		at: 'lshrToken' put: 'lshrTokens';
		at: 'ashrToken' put: 'ashrTokens';
		at: 'andToken' put: 'andTokens';
		at: 'orToken' put: 'orTokens';
		at: 'xorToken' put: 'xorTokens';
		at: 'icmpToken' put: 'icmpTokens';
		at: 'eqToken' put: 'eqTokens';
		at: 'neToken' put: 'neTokens';
		at: 'sltToken' put: 'sltTokens';
		at: 'sgtToken' put: 'sgtTokens';
		at: 'sleToken' put: 'sleTokens';
		at: 'sgeToken' put: 'sgeTokens';
		at: 'ultToken' put: 'ultTokens';
		at: 'ugtToken' put: 'ugtTokens';
		at: 'uleToken' put: 'uleTokens';
		at: 'ugeToken' put: 'ugeTokens';
		at: 'fcmpToken' put: 'fcmpTokens';
		at: 'oeqToken' put: 'oeqTokens';
		at: 'oneToken' put: 'oneTokens';
		at: 'oltToken' put: 'oltTokens';
		at: 'ogtToken' put: 'ogtTokens';
		at: 'oleToken' put: 'oleTokens';
		at: 'ogeToken' put: 'ogeTokens';
		at: 'ordToken' put: 'ordTokens';
		at: 'unoToken' put: 'unoTokens';
		at: 'ueqToken' put: 'ueqTokens';
		at: 'uneToken' put: 'uneTokens';
		at: 'vicmpToken' put: 'vicmpTokens';
		at: 'vfcmpToken' put: 'vfcmpTokens';
		at: 'extractelementToken' put: 'extractelementTokens';
		at: 'insertelementToken' put: 'insertelementTokens';
		at: 'shufflevectorToken' put: 'shufflevectorTokens';
		at: 'extractvalueToken' put: 'extractvalueTokens';
		at: 'insertvalueToken' put: 'insertvalueTokens';
		at: 'asmToken' put: 'asmTokens';
		at: 'sideeffectToken' put: 'sideeffectTokens';
		at: 'metadata_nameToken' put: 'metadata_nameTokens';
		at: 'zeroextToken' put: 'zeroextTokens';
		at: 'signextToken' put: 'signextTokens';
		at: 'inregToken' put: 'inregTokens';
		at: 'sretToken' put: 'sretTokens';
		at: 'noaliasToken' put: 'noaliasTokens';
		at: 'byvalToken' put: 'byvalTokens';
		at: 'nestToken' put: 'nestTokens';
		at: 'alignToken' put: 'alignTokens';
		yourself
]

{ #category : #generated }
LLVMMetadataNode >> ppc_fp128Tokens [
	^ ppc_fp128Tokens
]

{ #category : #generated }
LLVMMetadataNode >> ppc_fp128Tokens: anOrderedCollection [
	ppc_fp128Tokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> ptrtointTokens [
	^ ptrtointTokens
]

{ #category : #generated }
LLVMMetadataNode >> ptrtointTokens: anOrderedCollection [
	ptrtointTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
LLVMMetadataNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
LLVMMetadataNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
LLVMMetadataNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> sTRINGCONSTANTTokens [
	^ sTRINGCONSTANTTokens
]

{ #category : #generated }
LLVMMetadataNode >> sTRINGCONSTANTTokens: anOrderedCollection [
	sTRINGCONSTANTTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> sdivTokens [
	^ sdivTokens
]

{ #category : #generated }
LLVMMetadataNode >> sdivTokens: anOrderedCollection [
	sdivTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> selectTokens [
	^ selectTokens
]

{ #category : #generated }
LLVMMetadataNode >> selectTokens: anOrderedCollection [
	selectTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> sextTokens [
	^ sextTokens
]

{ #category : #generated }
LLVMMetadataNode >> sextTokens: anOrderedCollection [
	sextTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> sgeTokens [
	^ sgeTokens
]

{ #category : #generated }
LLVMMetadataNode >> sgeTokens: anOrderedCollection [
	sgeTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> sgtTokens [
	^ sgtTokens
]

{ #category : #generated }
LLVMMetadataNode >> sgtTokens: anOrderedCollection [
	sgtTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> shlTokens [
	^ shlTokens
]

{ #category : #generated }
LLVMMetadataNode >> shlTokens: anOrderedCollection [
	shlTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> shufflevectorTokens [
	^ shufflevectorTokens
]

{ #category : #generated }
LLVMMetadataNode >> shufflevectorTokens: anOrderedCollection [
	shufflevectorTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> sideeffectTokens [
	^ sideeffectTokens
]

{ #category : #generated }
LLVMMetadataNode >> sideeffectTokens: anOrderedCollection [
	sideeffectTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> signextTokens [
	^ signextTokens
]

{ #category : #generated }
LLVMMetadataNode >> signextTokens: anOrderedCollection [
	signextTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> sitofpTokens [
	^ sitofpTokens
]

{ #category : #generated }
LLVMMetadataNode >> sitofpTokens: anOrderedCollection [
	sitofpTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> sleTokens [
	^ sleTokens
]

{ #category : #generated }
LLVMMetadataNode >> sleTokens: anOrderedCollection [
	sleTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> sltTokens [
	^ sltTokens
]

{ #category : #generated }
LLVMMetadataNode >> sltTokens: anOrderedCollection [
	sltTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> sremTokens [
	^ sremTokens
]

{ #category : #generated }
LLVMMetadataNode >> sremTokens: anOrderedCollection [
	sremTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> sretTokens [
	^ sretTokens
]

{ #category : #generated }
LLVMMetadataNode >> sretTokens: anOrderedCollection [
	sretTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> subTokens [
	^ subTokens
]

{ #category : #generated }
LLVMMetadataNode >> subTokens: anOrderedCollection [
	subTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> timesTokens [
	^ timesTokens
]

{ #category : #generated }
LLVMMetadataNode >> timesTokens: anOrderedCollection [
	timesTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> toTokens [
	^ toTokens
]

{ #category : #generated }
LLVMMetadataNode >> toTokens: anOrderedCollection [
	toTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> trueTokens [
	^ trueTokens
]

{ #category : #generated }
LLVMMetadataNode >> trueTokens: anOrderedCollection [
	trueTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> truncTokens [
	^ truncTokens
]

{ #category : #generated }
LLVMMetadataNode >> truncTokens: anOrderedCollection [
	truncTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> udivTokens [
	^ udivTokens
]

{ #category : #generated }
LLVMMetadataNode >> udivTokens: anOrderedCollection [
	udivTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> ueqTokens [
	^ ueqTokens
]

{ #category : #generated }
LLVMMetadataNode >> ueqTokens: anOrderedCollection [
	ueqTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> ugeTokens [
	^ ugeTokens
]

{ #category : #generated }
LLVMMetadataNode >> ugeTokens: anOrderedCollection [
	ugeTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> ugtTokens [
	^ ugtTokens
]

{ #category : #generated }
LLVMMetadataNode >> ugtTokens: anOrderedCollection [
	ugtTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> uitofpTokens [
	^ uitofpTokens
]

{ #category : #generated }
LLVMMetadataNode >> uitofpTokens: anOrderedCollection [
	uitofpTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> uleTokens [
	^ uleTokens
]

{ #category : #generated }
LLVMMetadataNode >> uleTokens: anOrderedCollection [
	uleTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> ultTokens [
	^ ultTokens
]

{ #category : #generated }
LLVMMetadataNode >> ultTokens: anOrderedCollection [
	ultTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> undefTokens [
	^ undefTokens
]

{ #category : #generated }
LLVMMetadataNode >> undefTokens: anOrderedCollection [
	undefTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> uneTokens [
	^ uneTokens
]

{ #category : #generated }
LLVMMetadataNode >> uneTokens: anOrderedCollection [
	uneTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> unoTokens [
	^ unoTokens
]

{ #category : #generated }
LLVMMetadataNode >> unoTokens: anOrderedCollection [
	unoTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> uremTokens [
	^ uremTokens
]

{ #category : #generated }
LLVMMetadataNode >> uremTokens: anOrderedCollection [
	uremTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> vfcmpTokens [
	^ vfcmpTokens
]

{ #category : #generated }
LLVMMetadataNode >> vfcmpTokens: anOrderedCollection [
	vfcmpTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> vicmpTokens [
	^ vicmpTokens
]

{ #category : #generated }
LLVMMetadataNode >> vicmpTokens: anOrderedCollection [
	vicmpTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> voidTokens [
	^ voidTokens
]

{ #category : #generated }
LLVMMetadataNode >> voidTokens: anOrderedCollection [
	voidTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> x86_fp80Tokens [
	^ x86_fp80Tokens
]

{ #category : #generated }
LLVMMetadataNode >> x86_fp80Tokens: anOrderedCollection [
	x86_fp80Tokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> xTokens [
	^ xTokens
]

{ #category : #generated }
LLVMMetadataNode >> xTokens: anOrderedCollection [
	xTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> xorTokens [
	^ xorTokens
]

{ #category : #generated }
LLVMMetadataNode >> xorTokens: anOrderedCollection [
	xorTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> zeroextTokens [
	^ zeroextTokens
]

{ #category : #generated }
LLVMMetadataNode >> zeroextTokens: anOrderedCollection [
	zeroextTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> zeroinitializerTokens [
	^ zeroinitializerTokens
]

{ #category : #generated }
LLVMMetadataNode >> zeroinitializerTokens: anOrderedCollection [
	zeroinitializerTokens := anOrderedCollection
]

{ #category : #generated }
LLVMMetadataNode >> zextTokens [
	^ zextTokens
]

{ #category : #generated }
LLVMMetadataNode >> zextTokens: anOrderedCollection [
	zextTokens := anOrderedCollection
]
