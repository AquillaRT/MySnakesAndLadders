Class {
	#name : 'SLTile',
	#superclass : 'Object',
	#instVars : [
		'position',
		'players'
	],
	#category : 'ART-SnakesAndLadders',
	#package : 'ART-SnakesAndLadders'
}

{ #category : 'adding' }
SLTile >> addPlayer: aSLPlayer [ 

	players add: aSLPlayer 
]

{ #category : 'initialization' }
SLTile >> initialize [

	super initialize.
	players := OrderedCollection new.
	position := 0
]

{ #category : 'accessing' }
SLTile >> players [

	^ players
]

{ #category : 'accessing' }
SLTile >> position: anInteger [

	position := anInteger
]

{ #category : 'printing' }
SLTile >> printOn: aStream [

	aStream << $[.
	position printOn: aStream.
	aStream << $]
]
