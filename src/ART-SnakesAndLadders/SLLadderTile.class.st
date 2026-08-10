Class {
	#name : 'SLLadderTile',
	#superclass : 'SLActiveTile',
	#category : 'ART-SnakesAndLadders',
	#package : 'ART-SnakesAndLadders'
}

{ #category : 'printing' }
SLLadderTile >> printOn: aStream [
	"protocol: 'printing'"

	aStream << '['.
	position printOn: aStream.
	aStream << '->'.
	targetTile position printOn: aStream.
	aStream << ']'
]
