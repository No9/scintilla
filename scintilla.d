#!/usr/sbin/dtrace -Cs

typedef struct Argument
{
  char *data_; 
  size_t  size_;
}Argument_a;
pid$1::_ZN7leveldb10WriteBatch3PutERKNS_5SliceES3_:entry
{
  this->key_ptr = arg1;
  this->key_ptr_arg=(Argument_a*)copyin(this->key_ptr, sizeof(Argument_a));
  printf("\n\nPUT");  
  printf("\n Key:  %s", stringof(copyin((uintptr_t)((Argument_a*)this->key_ptr_arg)->data_, (uintptr_t)((Argument_a*)this->key_ptr_arg)->size_)));
  printf("\n************** END ***************\n\n")
/*
  this->val_ptr = arg2;
  this->val_ptr_arg=(Argument_a*)copyin(this->val_ptr, sizeof(Argument_a));
 
  printf("\n Value:%s", stringof(copyin((uintptr_t)((Argument_a*)this->val_ptr_arg)->data_, (uintptr_t)((Argument_a*)this->val_ptr_arg)->size_)));
  printf("\n************** END ***************\n\n")
*/
}


pid$1::_ZN7leveldb6DBImpl3GetERKNS_11ReadOptionsERKNS_5SliceEPSs:entry
{
  printf("\n\nGET");
  
  
  this->str = *(uintptr_t *)copyin(arg3, sizeof(void *));
  printf("\nKey:  %s", copyinstr(this->str)); 
  /*
  this->val_ptr = arg2;
  this->val_ptr_arg=(Argument_a*)copyin(this->val_ptr, sizeof(Argument_a));
 
  printf("\n Value:%s", stringof(copyin((uintptr_t)((Argument_a*)this->val_ptr_arg)->data_, (uintptr_t)((Argument_a*)this->val_ptr_arg)->size_)));
  
  printf(stringof(copyin((uintptr_t)arg3)));
  */
  printf("\n************** END ***************\n\n");
}

pid$1::_ZN7leveldb10WriteBatch6DeleteERKNS_5SliceE:entry
{
  this->key_ptr = arg1;
  this->key_ptr_arg=(Argument_a*)copyin(this->key_ptr, sizeof(Argument_a));
  printf("\n\nDEL");  
  printf("\n Key:  %s", stringof(copyin((uintptr_t)((Argument_a*)this->key_ptr_arg)->data_, (uintptr_t)((Argument_a*)this->key_ptr_arg)->size_)));
  printf("\n************** END ***************\n\n")



}
