#ifndef NODE_H
#define NODE_H

#include <string>

#include "errors.h"
#include "containers.h"


namespace zexp
{

class node
{
protected:
    std::string const _content;

public:
    node(std::string const &content) :
        _content(content)
    {}

    ~node() {}

    virtual float eval(variables_map const &variables, error &e) const = 0;

    virtual std::string to_string() const
    {
        return _content;
    }

    virtual std::string to_string_with_variables_replaced(variables_map const &) const
    {
        return to_string();
    }
};

}

#endif // NODE_H
