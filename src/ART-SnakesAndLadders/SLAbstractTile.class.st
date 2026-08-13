Class {
	#name : 'SLAbstractTile',
	#superclass : 'Object',
	#instVars : [
		'position'
	],
	#category : 'ART-SnakesAndLadders',
	#package : 'ART-SnakesAndLadders'
}

{ #category : 'accessing' }
SLAbstractTile >> position [

	^ position
]

{ #category : 'accessing' }
SLAbstractTile >> position: anInteger [

	position := anInteger
]

{ #category : 'printing' }
SLAbstractTile >> printInsideOn: aStream [

	aStream << position asString
]

{ #category : 'printing' }
SLAbstractTile >> printOn: aStream [
	"protocol: 'printing'"

	aStream << '['.
	self printInsideOn: aStream.
	aStream << ']'
]
