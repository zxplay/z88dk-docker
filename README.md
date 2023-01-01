# Z88DK

```bash
vi hello.c
```

```c
#include <arch/zx.h>
#include <stdio.h>

int main()
{
  zx_cls(PAPER_WHITE);
  puts("Hello, world!");
  return 0;
}
```

```bash
docker run -v ${PWD}:/src/ -it ghcr.io/stever/z88dk-docker /
	zcc +zx -vn -create-app -clib=sdcc_iy -startup=0 hello.c -o hello
```
