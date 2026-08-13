Class {
	#name : 'SLSnakeTile',
	#superclass : 'SLActiveTile',
	#category : 'ART-SnakesAndLadders',
	#package : 'ART-SnakesAndLadders'
}

{ #category : 'printing' }
SLSnakeTile >> printInsideOn: aStream [

	aStream
		<< targetTile position asString; 
		<< '<-';
		<< position asString
]
