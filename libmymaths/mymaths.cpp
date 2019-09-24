// Author: Thomas Arvanitidis
// URL:    https://github.com/tarvanitidis/rpath_tutorial

#include <iostream>
#include "fastmatrix/fastmatrix_api.h"
#include "mymaths_api.h"

namespace mymaths
{

void yo()
{
    std::cout << "Library mymaths says Yo, world!\n";
}

std::vector<double> add(std::vector<double>& a, std::vector<double>& b)
{
    std::vector<double> output (a.size());

    // Showcase the use of fastmatrix.
    fastmatrix::yo();
    fastmatrix::supper_fast_addition(a, b, output);

    return output;
}

} // namespace mymaths
