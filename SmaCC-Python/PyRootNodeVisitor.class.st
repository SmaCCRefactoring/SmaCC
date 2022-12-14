Class {
	#name : #PyRootNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyRootNodeVisitor >> visitAnd: anAnd [
	^ self visitRoot: anAnd
]

{ #category : #generated }
PyRootNodeVisitor >> visitAndExpr: anAndExpr [
	^ self visitRoot: anAndExpr
]

{ #category : #generated }
PyRootNodeVisitor >> visitArgument: anArgument [
	^ self visitRoot: anArgument
]

{ #category : #generated }
PyRootNodeVisitor >> visitAssert: anAssert [
	^ self visitRoot: anAssert
]

{ #category : #generated }
PyRootNodeVisitor >> visitAtom: anAtom [
	^ self visitRoot: anAtom
]

{ #category : #generated }
PyRootNodeVisitor >> visitBackTick: aBackTick [
	^ self visitRoot: aBackTick
]

{ #category : #generated }
PyRootNodeVisitor >> visitBreak: aBreak [
	^ self visitRoot: aBreak
]

{ #category : #generated }
PyRootNodeVisitor >> visitClassdef: aClassdef [
	^ self visitRoot: aClassdef
]

{ #category : #generated }
PyRootNodeVisitor >> visitCompFor: aCompFor [
	^ self visitRoot: aCompFor
]

{ #category : #generated }
PyRootNodeVisitor >> visitCompIf: aCompIf [
	^ self visitRoot: aCompIf
]

{ #category : #generated }
PyRootNodeVisitor >> visitCompOp: aCompOp [
	^ self visitRoot: aCompOp
]

{ #category : #generated }
PyRootNodeVisitor >> visitComparison: aComparison [
	^ self visitRoot: aComparison
]

{ #category : #generated }
PyRootNodeVisitor >> visitContinue: aContinue [
	^ self visitRoot: aContinue
]

{ #category : #generated }
PyRootNodeVisitor >> visitDecorated: aDecorated [
	^ self visitRoot: aDecorated
]

{ #category : #generated }
PyRootNodeVisitor >> visitDecorator: aDecorator [
	^ self visitRoot: aDecorator
]

{ #category : #generated }
PyRootNodeVisitor >> visitDecorators: aDecorators [
	^ self visitRoot: aDecorators
]

{ #category : #generated }
PyRootNodeVisitor >> visitDel: aDel [
	^ self visitRoot: aDel
]

{ #category : #generated }
PyRootNodeVisitor >> visitDictorsetmaker: aDictorsetmaker [
	^ self visitRoot: aDictorsetmaker
]

{ #category : #generated }
PyRootNodeVisitor >> visitDotoptDottedName: aDotoptDottedName [
	^ self visitRoot: aDotoptDottedName
]

{ #category : #generated }
PyRootNodeVisitor >> visitDots: aDots [
	^ self visitRoot: aDots
]

{ #category : #generated }
PyRootNodeVisitor >> visitDottedName: aDottedName [
	^ self visitRoot: aDottedName
]

{ #category : #generated }
PyRootNodeVisitor >> visitElif: anElif [
	^ self visitRoot: anElif
]

{ #category : #generated }
PyRootNodeVisitor >> visitElse: anElse [
	^ self visitRoot: anElse
]

{ #category : #generated }
PyRootNodeVisitor >> visitEvalInput: anEvalInput [
	^ self visitRoot: anEvalInput
]

{ #category : #generated }
PyRootNodeVisitor >> visitExceptClause: anExceptClause [
	^ self visitRoot: anExceptClause
]

{ #category : #generated }
PyRootNodeVisitor >> visitExec: anExec [
	^ self visitRoot: anExec
]

{ #category : #generated }
PyRootNodeVisitor >> visitExprStmt: anExprStmt [
	^ self visitRoot: anExprStmt
]

{ #category : #generated }
PyRootNodeVisitor >> visitFactor: aFactor [
	^ self visitRoot: aFactor
]

{ #category : #generated }
PyRootNodeVisitor >> visitFileInput: aFileInput [
	^ self visitRoot: aFileInput
]

{ #category : #generated }
PyRootNodeVisitor >> visitFinally: aFinally [
	^ self visitRoot: aFinally
]

{ #category : #generated }
PyRootNodeVisitor >> visitFor: aFor [
	^ self visitRoot: aFor
]

{ #category : #generated }
PyRootNodeVisitor >> visitFpdef: aFpdef [
	^ self visitRoot: aFpdef
]

{ #category : #generated }
PyRootNodeVisitor >> visitFuncdef: aFuncdef [
	^ self visitRoot: aFuncdef
]

{ #category : #generated }
PyRootNodeVisitor >> visitGlobal: aGlobal [
	^ self visitRoot: aGlobal
]

{ #category : #generated }
PyRootNodeVisitor >> visitIf: anIf [
	^ self visitRoot: anIf
]

{ #category : #generated }
PyRootNodeVisitor >> visitIfTest: anIfTest [
	^ self visitRoot: anIfTest
]

{ #category : #generated }
PyRootNodeVisitor >> visitImport: anImport [
	^ self visitRoot: anImport
]

{ #category : #generated }
PyRootNodeVisitor >> visitInitOpt: anInitOpt [
	^ self visitRoot: anInitOpt
]

{ #category : #generated }
PyRootNodeVisitor >> visitLShiftExpr: aLShiftExpr [
	^ self visitRoot: aLShiftExpr
]

{ #category : #generated }
PyRootNodeVisitor >> visitLambda: aLambda [
	^ self visitRoot: aLambda
]

{ #category : #generated }
PyRootNodeVisitor >> visitListFor: aListFor [
	^ self visitRoot: aListFor
]

{ #category : #generated }
PyRootNodeVisitor >> visitListIf: aListIf [
	^ self visitRoot: aListIf
]

{ #category : #generated }
PyRootNodeVisitor >> visitListmaker: aListmaker [
	^ self visitRoot: aListmaker
]

{ #category : #generated }
PyRootNodeVisitor >> visitMinusExpr: aMinusExpr [
	^ self visitRoot: aMinusExpr
]

{ #category : #generated }
PyRootNodeVisitor >> visitMoreTests: aMoreTests [
	^ self visitRoot: aMoreTests
]

{ #category : #generated }
PyRootNodeVisitor >> visitNot: aNot [
	^ self visitRoot: aNot
]

{ #category : #generated }
PyRootNodeVisitor >> visitNumber: aNumber [
	^ self visitRoot: aNumber
]

{ #category : #generated }
PyRootNodeVisitor >> visitOr: anOr [
	^ self visitRoot: anOr
]

{ #category : #generated }
PyRootNodeVisitor >> visitPass: aPass [
	^ self visitRoot: aPass
]

{ #category : #generated }
PyRootNodeVisitor >> visitPlusExpr: aPlusExpr [
	^ self visitRoot: aPlusExpr
]

{ #category : #generated }
PyRootNodeVisitor >> visitPower: aPower [
	^ self visitRoot: aPower
]

{ #category : #generated }
PyRootNodeVisitor >> visitPrint: aPrint [
	^ self visitRoot: aPrint
]

{ #category : #generated }
PyRootNodeVisitor >> visitRShiftExpr: aRShiftExpr [
	^ self visitRoot: aRShiftExpr
]

{ #category : #generated }
PyRootNodeVisitor >> visitRaise: aRaise [
	^ self visitRoot: aRaise
]

{ #category : #generated }
PyRootNodeVisitor >> visitReturn: aReturn [
	^ self visitRoot: aReturn
]

{ #category : #generated }
PyRootNodeVisitor >> visitRoot: aRoot [
	^ self visitSmaCCParseNode: aRoot
]

{ #category : #generated }
PyRootNodeVisitor >> visitSimpleStmt: aSimpleStmt [
	^ self visitRoot: aSimpleStmt
]

{ #category : #generated }
PyRootNodeVisitor >> visitSingleInput: aSingleInput [
	^ self visitRoot: aSingleInput
]

{ #category : #generated }
PyRootNodeVisitor >> visitSliceop: aSliceop [
	^ self visitRoot: aSliceop
]

{ #category : #generated }
PyRootNodeVisitor >> visitStrings: aStrings [
	^ self visitRoot: aStrings
]

{ #category : #generated }
PyRootNodeVisitor >> visitSubscript: aSubscript [
	^ self visitRoot: aSubscript
]

{ #category : #generated }
PyRootNodeVisitor >> visitSymbol: aSymbol [
	^ self visitRoot: aSymbol
]

{ #category : #generated }
PyRootNodeVisitor >> visitTerm: aTerm [
	^ self visitRoot: aTerm
]

{ #category : #generated }
PyRootNodeVisitor >> visitTestTestOpt: aTestTestOpt [
	^ self visitRoot: aTestTestOpt
]

{ #category : #generated }
PyRootNodeVisitor >> visitTestlist1: aTestlist1 [
	^ self visitRoot: aTestlist1
]

{ #category : #generated }
PyRootNodeVisitor >> visitTestlistComp: aTestlistComp [
	^ self visitRoot: aTestlistComp
]

{ #category : #generated }
PyRootNodeVisitor >> visitTrailer: aTrailer [
	^ self visitRoot: aTrailer
]

{ #category : #generated }
PyRootNodeVisitor >> visitTry: aTry [
	^ self visitRoot: aTry
]

{ #category : #generated }
PyRootNodeVisitor >> visitVBarExpr: aVBarExpr [
	^ self visitRoot: aVBarExpr
]

{ #category : #generated }
PyRootNodeVisitor >> visitVarArgList: aVarArgList [
	^ self visitRoot: aVarArgList
]

{ #category : #generated }
PyRootNodeVisitor >> visitWhile: aWhile [
	^ self visitRoot: aWhile
]

{ #category : #generated }
PyRootNodeVisitor >> visitWith: aWith [
	^ self visitRoot: aWith
]

{ #category : #generated }
PyRootNodeVisitor >> visitWithItem: aWithItem [
	^ self visitRoot: aWithItem
]

{ #category : #generated }
PyRootNodeVisitor >> visitXorExpr: aXorExpr [
	^ self visitRoot: aXorExpr
]

{ #category : #generated }
PyRootNodeVisitor >> visitYield: aYield [
	^ self visitRoot: aYield
]
