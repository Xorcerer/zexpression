#ifndef NUMBER_NODE_H
#define NUMBER_NODE_H

#include "node.h"

namespace zexp
{

class number_node : public node
{
    float const _value;
public:
    number_node(std::string const &content);

    virtual float eval(variables_map const &variables, error &e) const;
};

}
#endif // NUMBER_NODE_H
