# gnl_tester
tester for 42 gnl project which make review smoother

```
git clone [URL] [reviwee's repo]

# generate test files
make -C text

# test all combinations of buffer sizes and character lengths
make normal

# test stdin and invalid fd
make se

# test bonus(please check bonux1 and bonus2)
make bonus; a.out bonus1 bonus2
```

if you want to know the tests in detail, please read Makefile and *.c because they are really simple
