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
