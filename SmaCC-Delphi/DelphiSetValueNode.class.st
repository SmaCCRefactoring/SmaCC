Class {
	#name : #DelphiSetValueNode,
	#superclass : #DelphiProgramNode,
	#category : 'SmaCC-Delphi'
}

{ #category : #generated }
DelphiSetValueNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSetValue: self
]
