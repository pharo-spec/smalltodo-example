Class {
	#name : #TODOTaskPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'task',
		'titlePresenter'
	],
	#category : #TODO
}

{ #category : #accessing }
TODOTaskPresenter >> accept [

	self task 
		title: titlePresenter text.
]

{ #category : #accessing }
TODOTaskPresenter >> initializeDialogWindow: 	aDialogWindowPresenter [

	aDialogWindowPresenter 
		title: 'New task';
		initialExtent: 350@120;
		addButton: 'Accept' do: [ :dialog |
			self accept.
			dialog close ];
		addButton: 'Cancel' do: [ :dialog |
			dialog close ]
]

{ #category : #accessing }
TODOTaskPresenter >> initializePresenters [

	titlePresenter := self newTextInput.

	self layout: (SpBoxLayout newVertical 
						add: titlePresenter expand: false;
						yourself).
]

{ #category : #accessing }
TODOTaskPresenter >> task [
	^ task
]

{ #category : #accessing }
TODOTaskPresenter >> task: aTask [
	task := aTask.
	self updatePresenter
]

{ #category : #accessing }
TODOTaskPresenter >> updatePresenter [
	titlePresenter 
		text: (task ifNil: [ '' ] ifNotNil: [task title])
]
