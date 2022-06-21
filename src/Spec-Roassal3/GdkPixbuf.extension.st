Extension { #name : #GdkPixbuf }

{ #category : #'*Spec-Roassal3' }
GdkPixbuf >> saveImage: string [
    | fileName typeFile isSaved srcIcon extensionIcon iconNumber |
    
    srcIcon := '/icon_'.
    extensionIcon := '.png'.
    iconNumber := 1.
    fileName := string, srcIcon, iconNumber asString, extensionIcon.
    [fileName asFileReference exists]
        whileTrue: [
                iconNumber := iconNumber + 1.
                fileName := string, srcIcon, iconNumber asString, extensionIcon.
            ].
    typeFile := 'png'.
    isSaved := self saveImage: fileName given: typeFile.
    isSaved
        ifTrue: [^fileName]
        ifFalse: [ ^'' ]
]

{ #category : #'*Spec-Roassal3' }
GdkPixbuf >> saveImage: fileName given: typeFile [
    ^ self ffiCall: #(gboolean gdk_pixbuf_savev(self, "const char*"void *fileName, "const char*"void *typeFile, NULL, NULL, NULL)) module: GdkPixbufLibrary
]
