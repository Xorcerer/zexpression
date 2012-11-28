#ifndef FUNCTION_NODE_H
#define FUNCTION_NODE_H

#include "node.h"
#include <vector>

namespace zexp
{

class function_node : public node
{
    typedef std::vector<node const *> node_vector;
    node_vector _parameters;

public:
    function_node(std::string const &content);
    ~function_node();

    virtual float eval(variables_map const &variables, error &e) const;

    virtual std::string to_string() const;

    // parameter's ownership transfer to this node.
    void add_parameter(node const &parameter);
};

}
#endif // FUNCTION_NODE_H
