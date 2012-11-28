#include "variable_node.h"
#include <sstream>


namespace zexp
{

variable_node::variable_node(std::string const &content) :
    node(content)
{
}

float variable_node::eval(variables_map const &variables, error &e) const
{
    variables_map::const_iterator itor = variables.find(_content);
    if (itor != variables.end())
        return itor->second;

    e = error_variable_unset;
    return 0;
}

std::string variable_node::to_string_with_variables_replaced(const variables_map &variables) const
{
    // This method is for debugging, performance does not matter.
    error e = no_error;
    float result = eval(variables, e);
    if (e == error_variable_unset)
        return _content;

    std::ostringstream os;
    os << result;
    return os.str();
}

}
