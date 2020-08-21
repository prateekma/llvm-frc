#include <iostream>
#include <cmath>

int main() {
    float x = 5.4;
    float y = 6.3;
    double result = std::lerp(1.0, 2.0, 0.5);
    std::cout << "Lerp result is: " << result << std::endl;
    std::cout << "Sum of two numbers is: " << x + y << std::endl;
    std::cout << "Hello, world!" << std::endl;
}

