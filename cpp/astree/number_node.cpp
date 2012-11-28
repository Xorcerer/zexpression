#include "number_node.h"

namespace zexp
{

number_node::number_node(const std::string &content) :
    node(content),
    _value(::atof(content.c_str()))
{
}

float number_node::eval(const zexp::variables_map &, zexp::error &) const
{
    return _value;
}

}
