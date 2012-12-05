#ifndef FUNCTOR_H
#define FUNCTOR_H


namespace zexp
{

struct functor
{
    virtual unsigned short accept_arg_count() const = 0;
    virtual call
};

}

#endif // FUNCTOR_H
