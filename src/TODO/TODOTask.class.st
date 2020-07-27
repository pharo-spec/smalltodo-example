Class {
	#name : #TODOTask,
	#superclass : #Object,
	#instVars : [
		'done',
		'title'
	],
	#category : #TODO
}

{ #category : #testing }
TODOTask class >> isVoyageRoot [

	^ true
]

{ #category : #accessing }
TODOTask >> done: aBoolean [
	done := aBoolean
]

{ #category : #initialization }
TODOTask >> initialize [

	super initialize.
	self done: false
]

{ #category : #testing }
TODOTask >> isDone [

	^ done
]

{ #category : #accessing }
TODOTask >> title [
	^ title
]

{ #category : #accessing }
TODOTask >> title: aString [
	title := aString
]
