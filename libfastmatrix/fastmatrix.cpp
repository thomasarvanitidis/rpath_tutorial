// Author: Thomas Arvanitidis
// URL:    https://github.com/tarvanitidis/rpath_tutorial

#include <iostream>
#include "fastmatrix_api.h"

namespace fastmatrix 
{

void yo() 
{
    std::cout << "Library fastmatrix says Yo, world!\n";
}

void supper_fast_addition(std::vector<double>& a, std::vector<double>& b,
                          std::vector<double>& out)
{
    if (a.size() != b.size()
        && a.size() != out.size())
        std::cout << "Vectors should be of same size.\n";

    for (int n = 0; n < b.size(); ++n)
    {
        out[n] = a[n] + b[n];
    }
}

} // End of namespace fastmatrix
