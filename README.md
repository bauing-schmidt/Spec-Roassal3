# Spec-Roassal3

## Installation

```Smalltalk
 Metacello new
 baseline:'SpecRoassal3';
 repository: 'github://ObjectProfile/Spec-Roassal3:main/src';
 onConflict: [ :e | e useIncoming ];
 onUpgrade: [ :e | e useIncoming ];
 ignoreImage;
 load
```

### Example
```Smalltalk
gtkExample := (SpDemoStandaloneFormPresenter on: SpDemoFormModel new)
application: (SpApplication new useBackend: #Gtk).

roassalExample := (SpDemoStandaloneFormPresenter on: SpDemoFormModel new)
application: (SpApplication new useBackend: #Roassal).

RSLayoutConfiguration new 
	base: gtkExample; 
	adjust: roassalExample; 
	open.
 ```
