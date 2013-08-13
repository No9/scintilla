# scintilla

A command line tool for monitoring leveldb instances using DTrace without the need for USDTs in leveldb.

## Prereqs

1. A system that supports DTrace  based system. (Tested on Open Indiana and SmartOS Current Linux DTrace not supported)

2. node.js 0.10.x

3. awk 

4. pgrep 

## Install 

```bash
$ npm install scintilla -g 
```

## Usage 

As root (or sudo) 

To list available processes 

```
# scintilla -l
```

To monitor a process 

``` 
# scintilla -p XXXX
```
or

```bash
$ sudo scintilla -pid XXXX
```

Where XXXX is the process id of the node application hosting leveldb. 

To monitor all currently running node processes and any new processes that are started.

```
# scintilla -a
``` 

Any node processes found that do not have a leveldb instance will display a warning message


## Output

From the repo directory run 

```bash
$ node tests/mock.js
```

Then from another console

```
& sudo scintilla -a 
```

Will produce the following output

```
monitor all
Attaching pid : 11880
Attach output :  dtrace
Attach output :  : 
Attach output :  script
Attach output :   '
Attach output :  ./scintilla.d
Attach output :  ' matched 
Attach output :  3
Attach output :   probe
Attach output :  s

CPU     ID                    FUNCTION:NAME
  0  63970 _ZN7leveldb10WriteBatch3PutERKNS_5SliceES3_:entry 

PUT
 Key:  name
  0  63973 _ZN7leveldb6DBImpl3GetERKNS_11ReadOptionsERKNS_5SliceEPSs:entry 
************** END ***************


GET
Key:  name
************** END ***************


  0  63972 _ZN7leveldb10WriteBatch6DeleteERKNS_5SliceE:entry 

DEL
 Key:  name
************** END ***************
```

## Notes 

Currently only supports key string monitoring. 
