#include "helper.h"
#include <iconv.h>
#include <string.h>

int Iconv(char*in,size_t ilen, char* out,size_t olen,char *from,char* to)  {
	iconv_t cd = iconv_open(to,from);
	if (cd == 0) {
		return 0;
	}
	int size = iconv(cd,&in,&ilen,&out,&olen);
	memset(out+size,0,2*ilen-size);
	if (cd != 0) {
		iconv_close(cd);
	}
	return size;

}
