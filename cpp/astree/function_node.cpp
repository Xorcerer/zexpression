#include "function_node.h"
#include <sstream>


namespace zexp
{

function_node::function_node(const std::string &content):
    node(content)
{
}

function_node::~function_node()
{
    for (node_vector::const_iterator itor = _parameters.begin(); itor != _parameters.end(); ++itor)
        delete *itor;
}

float function_node::eval(const variables_map &variables, error &e) const
{
    // TODO
}

std::string function_node::to_string() const
{
    std::ostringstream os;
    os << _content << '(';
    for (node_vector::const_iterator itor = _parameters.begin(); itor != _parameters.end(); ++itor)
    {
        os << itor->to_string();
        if (*itor != _parameters.back())
            os << ", ";
    }
    os << ')';
    return os.c_str();
}

std::string function_node::to_string_with_variables_replaced(const variables_map &variables) const
{
    std::ostringstream os;
    os << _content << '(';
    for (node_vector::const_iterator itor = _parameters.begin(); itor != _parameters.end(); ++itor)
    {
        os << itor->to_string_with_variables_replaced(variables);
        if (*itor != _parameters.back())
            os << ", ";
    }
    os << ')';
    return os.c_str();
}

void function_node::add_parameter(const node &parameter)
{
    _parameters.push_back(parameter);
}

}
