#include "v.h"

double divide_new(double a, double b) {
    if (b != 0) {
        return (a / b) + 2;
    } else {
        // Handle division by zero error
        return 0.0;
    }
}