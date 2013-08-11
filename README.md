# scintilla

A command line tool for monitoring leveldb instances using DTrace without the need for USDTs in leveldb.

## Prereqs

1. An IllumOS based system. (Tested on Open Indiana and SmartOS)

2. node.js 0.10.x

## Install 

```bash
$ npm install scintilla -g 
```

## Usage 

As root 

```bash 
# scintilla --pid XXXX
```

or

```bash
$ sudo scintilla -pid XXXX
```

Where XXXX is the process id of the node application hosting leveldb. 


## Output

```
```
