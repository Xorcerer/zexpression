#ifndef CONTAINERS_H
#define CONTAINERS_H

#include "config.h"

#include <string>
#ifdef ZEXP_CPP11
#include <unordered_map>
#else
#include <hash_map.h>
#endif

#ifdef _GLIBCXX_BEGIN_NAMESPACE
_GLIBCXX_BEGIN_NAMESPACE(__gnu_cxx)
#else
namespace std
{
#endif
    template<> struct hash<std::string>
    {
        size_t operator()(std::string const &x) const
        {
            return hash<char const *>()(x.c_str());
        }
    };
}

namespace zexp
{
#ifdef ZEXP_CPP11
typedef std::unordered_map<std::string, float> variables_map;
#else
typedef hash_map<std::string, float> variables_map;
#endif

}
#endif // CONTAINERS_H
