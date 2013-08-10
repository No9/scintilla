#!/usr/sbin/dtrace -Cs

typedef struct Argument
{
  void *ptr;
}

pid$1::_ZN9leveldown8Database13PutToDatabaseEPN7leveldb12WriteOptionsENS1_5SliceES4_:entry
{
 trace(arg1)
  this->ptr = arg0;
/*
#include <node.h>
#include <node_buffer.h>
*/
/* this->hints = ( const v8::Arguments *) copyin(arg2, sizeof (const v8::Arguments))
  printf("%s \n", copyinstr(arg0))

  printf("%s : %s : %s : %s: %s: %s: %s  \n", copyinstr(arg0))
  , copyinstr(arg1)
  , copyinstr(arg2)
  , copyinstr(arg3)
  , copyinstr(arg4)
  , copyinstr(arg5)
  , copyinstr(arg6)
  );
  trace(arg0);
  trace(arg1); 
  trace(arg2);
  trace(arg3); 
  trace(arg4);
*/
}
END
{
}

