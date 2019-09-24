// Author: Thomas Arvanitidis
// URL:    https://github.com/tarvanitidis/rpath_tutorial

#include <vector>
#include <iostream>
#include "mymaths.h"

int main() {
    mymaths::yo();

    std::vector<double> a {1,2,3};
    std::vector<double> b {1,1,1};

    auto result = mymaths::add(a, b);

    std::cout << "Adding {1,2,3} and {1,1,1}.\n";
    std::cout << "Result:\n";
    for (auto x:result) {
        std::cout << x << std::endl;
    }

    return 0;
}
