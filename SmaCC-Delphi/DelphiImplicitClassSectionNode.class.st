Class {
	#name : #DelphiImplicitClassSectionNode,
	#superclass : #DelphiClassSectionNode,
	#category : 'SmaCC-Delphi'
}

{ #category : #generated }
DelphiImplicitClassSectionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitImplicitClassSection: self
]
