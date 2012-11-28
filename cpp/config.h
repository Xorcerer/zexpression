#ifndef CONFIG_H
#define CONFIG_H

// GCC does not work until gcc 4.7.
// Clang works.
// MSVC does not work.
#if (__cplusplus == 201103)
#define ZEXP_CPP11 1
#endif

#endif // CONFIG_H
