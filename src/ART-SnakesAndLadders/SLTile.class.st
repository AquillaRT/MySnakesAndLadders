Class {
	#name : 'SLTile',
	#superclass : 'SLAbstractTile',
	#instVars : [
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

{ #category : 'printing' }
SLTile >> printOn: aStream [
	"protocol: 'printing'"

	aStream << $[.
	position printOn: aStream.
	players do: [ :each | each printOn: aStream ].
	aStream << $]
]

{ #category : 'accessing' }
SLTile >> removePlayer: aPlayer [

	players remove: aPlayer
]
