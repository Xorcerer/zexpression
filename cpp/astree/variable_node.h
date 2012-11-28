#ifndef VARIABLE_NODE_H
#define VARIABLE_NODE_H

#include "node.h"

namespace zexp
{
class variable_node : public node
{
public:
    variable_node(std::string const &content);

    virtual float eval(variables_map const &variables, error &e) const;

    virtual std::string to_string_with_variables_replaced(variables_map const &variables) const;
};

}

#endif // VARIABLE_NODE_H
