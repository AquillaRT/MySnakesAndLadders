Class {
	#name : 'SLSnakeTile',
	#superclass : 'SLActiveTile',
	#category : 'ART-SnakesAndLadders',
	#package : 'ART-SnakesAndLadders'
}

{ #category : 'printing' }
SLSnakeTile >> printOn: aStream [
	"protocol: 'printing'"

	aStream << '['.
	targetTile position printOn: aStream.
	aStream << '<-'.
	position printOn: aStream.
	aStream << ']'
]
