// Author: Thomas Arvanitidis
// URL:    https://github.com/tarvanitidis/rpath_tutorial

#include <vector>
#include <iostream>
#include "mymaths/mymaths_api.h"

int main() {
    mymaths::yo();

    std::vector<double> a; a.push_back(1); a.push_back(2); a.push_back(3);
    std::vector<double> b (3, 1);

    std::vector<double> result = mymaths::add(a, b);

    std::cout << "Adding {1,2,3} and {1,1,1}.\n";
    std::cout << "Result:\n";
    for (int i = 0; i < result.size(); ++i) {
        std::cout << result[i] << std::endl;
    }

    return 0;
}
