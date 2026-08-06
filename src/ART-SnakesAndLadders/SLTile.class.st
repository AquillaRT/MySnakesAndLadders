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

{ #category : 'testing' }
SLTile >> includesPlayer: aPlayer [

	^ players includes: aPlayer
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
SLTile >> position [

	^ position
]

{ #category : 'accessing' }
SLTile >> position: anInteger [

	position := anInteger
]

{ #category : 'printing' }
SLTile >> printOn: aStream [
	"protocol: 'printing'"

	aStream << $[.
	position printOn: aStream.
	players do: [ :each | each printOn: aStream ].
	aStream << $]
]
