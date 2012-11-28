#include "variable_node.h"
#include <strstream>


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

    e = error_variable_undefined;
    return 0;
}

std::string variable_node::to_string_with_variables_replaced(const variables_map &variables) const
{
    // This method is for debuging, performance does not matter.
    error e = no_error;
    float result = eval(variables, e);
    if (e)
        return _content + "(not set)";

    std::ostringstream os;
    os << result;
    return os.str();
}

}
