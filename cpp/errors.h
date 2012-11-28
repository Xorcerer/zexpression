#ifndef ERRORS_H
#define ERRORS_H

// Not using exceptions in zExpression,
// For exceptions is not widely welcomed in C++ world.
// I love exceptions personally.
// TODO: Make throwing exceptions optional, just like boost does.

namespace zexp
{
enum error
{
    no_error,
    error_variable_unset,
    error_function_unset,
    error_unexpected_char,
    error_unexpected_token
};

}

#endif // ERRORS_H
