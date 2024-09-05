"
Error codes returned by spawning processes.
See https://github.com/GNOME/glib/blob/main/glib/gspawn.h
You can instantiate me like this: `(GSpawnError newValue: error code)`

GSpawnError:
 * @G_SPAWN_ERROR_FORK: Fork failed due to lack of memory.
 * @G_SPAWN_ERROR_READ: Read or select on pipes failed.
 * @G_SPAWN_ERROR_CHDIR: Changing to working directory failed.
 * @G_SPAWN_ERROR_ACCES: execv() returned `EACCES`
 * @G_SPAWN_ERROR_PERM: execv() returned `EPERM`
 * @G_SPAWN_ERROR_TOO_BIG: execv() returned `E2BIG`
 * @G_SPAWN_ERROR_2BIG: deprecated alias for %G_SPAWN_ERROR_TOO_BIG (deprecated since GLib 2.32)
 * @G_SPAWN_ERROR_NOEXEC: execv() returned `ENOEXEC`
 * @G_SPAWN_ERROR_NAMETOOLONG: execv() returned `ENAMETOOLONG`
 * @G_SPAWN_ERROR_NOENT: execv() returned `ENOENT`
 * @G_SPAWN_ERROR_NOMEM: execv() returned `ENOMEM`
 * @G_SPAWN_ERROR_NOTDIR: execv() returned `ENOTDIR`
 * @G_SPAWN_ERROR_LOOP: execv() returned `ELOOP`
 * @G_SPAWN_ERROR_TXTBUSY: execv() returned `ETXTBUSY`
 * @G_SPAWN_ERROR_IO: execv() returned `EIO`
 * @G_SPAWN_ERROR_NFILE: execv() returned `ENFILE`
 * @G_SPAWN_ERROR_MFILE: execv() returned `EMFILE`
 * @G_SPAWN_ERROR_INVAL: execv() returned `EINVAL`
 * @G_SPAWN_ERROR_ISDIR: execv() returned `EISDIR`
 * @G_SPAWN_ERROR_LIBBAD: execv() returned `ELIBBAD`
 * @G_SPAWN_ERROR_FAILED: Some other fatal failure,
 *   `error->message` should explain.
"
Class {
	#name : 'GSpawnError',
	#superclass : 'GEnumeration',
	#classVars : [
		'G_SPAWN_ERROR_2BIG',
		'G_SPAWN_ERROR_ACCES',
		'G_SPAWN_ERROR_CHDIR',
		'G_SPAWN_ERROR_FAILED',
		'G_SPAWN_ERROR_FORK',
		'G_SPAWN_ERROR_INVAL',
		'G_SPAWN_ERROR_IO',
		'G_SPAWN_ERROR_ISDIR',
		'G_SPAWN_ERROR_LIBBAD',
		'G_SPAWN_ERROR_LOOP',
		'G_SPAWN_ERROR_MFILE',
		'G_SPAWN_ERROR_NAMETOOLONG',
		'G_SPAWN_ERROR_NFILE',
		'G_SPAWN_ERROR_NOENT',
		'G_SPAWN_ERROR_NOEXEC',
		'G_SPAWN_ERROR_NOMEM',
		'G_SPAWN_ERROR_NOTDIR',
		'G_SPAWN_ERROR_PERM',
		'G_SPAWN_ERROR_READ',
		'G_SPAWN_ERROR_TOO_BIG',
		'G_SPAWN_ERROR_TXTBUSY'
	],
	#category : 'GLib-IO-Process',
	#package : 'GLib-IO',
	#tag : 'Process'
}

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_2BIG [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_2BIG
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_ACCES [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_ACCES
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_CHDIR [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_CHDIR
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_FAILED [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_FAILED
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_FORK [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_FORK
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_INVAL [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_INVAL
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_IO [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_IO
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_ISDIR [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_ISDIR
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_LIBBAD [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_LIBBAD
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_LOOP [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_LOOP
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_MFILE [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_MFILE
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_NAMETOOLONG [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_NAMETOOLONG
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_NFILE [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_NFILE
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_NOENT [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_NOENT
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_NOEXEC [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_NOEXEC
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_NOMEM [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_NOMEM
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_NOTDIR [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_NOTDIR
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_PERM [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_PERM
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_READ [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_READ
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_TOO_BIG [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_TOO_BIG
]

{ #category : 'accessing enum' }
GSpawnError class >> G_SPAWN_ERROR_TXTBUSY [
	"This method was automatically generated"
	^ G_SPAWN_ERROR_TXTBUSY
]

{ #category : 'enum declaration' }
GSpawnError class >> enumDecl [
	"
	self initializeEnumeration.
	self rebuildEnumAccessors.
	"

	^ #(
  G_SPAWN_ERROR_FORK 0
  G_SPAWN_ERROR_READ 1
  G_SPAWN_ERROR_CHDIR 2
  G_SPAWN_ERROR_ACCES 3
  G_SPAWN_ERROR_PERM 4
  G_SPAWN_ERROR_TOO_BIG 5
  G_SPAWN_ERROR_2BIG 5
  G_SPAWN_ERROR_NOEXEC 6
  G_SPAWN_ERROR_NAMETOOLONG 7
  G_SPAWN_ERROR_NOENT 8
  G_SPAWN_ERROR_NOMEM 9
  G_SPAWN_ERROR_NOTDIR 10
  G_SPAWN_ERROR_LOOP 11
  G_SPAWN_ERROR_TXTBUSY 12
  G_SPAWN_ERROR_IO 13
  G_SPAWN_ERROR_NFILE 14
  G_SPAWN_ERROR_MFILE 15
  G_SPAWN_ERROR_INVAL 16
  G_SPAWN_ERROR_ISDIR 17
  G_SPAWN_ERROR_LIBBAD 18
  G_SPAWN_ERROR_FAILED 19
	)
]
