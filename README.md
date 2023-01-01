# Z88DK

## Example usage

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

The following command will compile `hello.c` to create a `hello.tap` file that can be run in [Fuse](https://fuse-emulator.sourceforge.net/).

```bash
docker run -v ${PWD}:/src/ -it ghcr.io/stever/z88dk-docker \
	zcc +zx -vn -create-app -clib=sdcc_iy -startup=0 hello.c -o hello
```

```bash
fuse hello.tap
```
