Class {
	#name : 'GdkPaintable',
	#superclass : 'GObject',
	#traits : 'GdkTLibrary + GdkTPaintable',
	#classTraits : 'GdkTLibrary classTrait + GdkTPaintable classTrait',
	#category : 'Gdk-Texture',
	#package : 'Gdk',
	#tag : 'Texture'
}

{ #category : 'accessing' }
GdkPaintable >> computeConcreteSize: aSize [

	^ self computeConcreteSize: aSize defaults: 0.0 @ 0.0
]

{ #category : 'accessing' }
GdkPaintable >> computeConcreteSize: aSize defaults: defaultSize [

	^ self 
		computeConcreteSizeSpecifiedWidth: aSize x asFloat
		specifiedHeight: aSize y asFloat
		defaultWidth:  defaultSize x asFloat
		defaultHeight: defaultSize y asFloat
]

{ #category : 'private' }
GdkPaintable >> computeConcreteSizeSpecifiedWidth: specified_width 
	specifiedHeight: specified_height 
	defaultWidth: default_height 
	defaultHeight: default_width [
	| bufferWidth bufferHeight | 
	
	bufferWidth := FFIFloat64 newBuffer.
	bufferHeight := FFIFloat64 newBuffer.
	
	self 
		computeConcreteSizeSpecifiedWidth: specified_width 
		specifiedHeight: specified_height 
		defaultWidth: default_width 
		defaultHeight: default_height 
		concreteWidth: bufferWidth 
		concreteHeight: bufferHeight.
		
	^ (bufferWidth doubleAt: 1) @ (bufferHeight doubleAt: 1)
]

{ #category : 'private' }
GdkPaintable >> computeConcreteSizeSpecifiedWidth: specified_width 
	specifiedHeight: specified_height 
	defaultWidth: default_height 
	defaultHeight: default_width 
	concreteWidth: concrete_width 
	concreteHeight: concrete_height [ 
	
	self ffiCall: #(void gdk_paintable_compute_concrete_size (
   	 	self,
  		double specified_width,
  		double specified_height,
  		double default_width,
  		double default_height,
  		double* concrete_width,
  		double* concrete_height))
]
