#include "x.h"

double multiply(double a, double b) {
    return a * b;
}

double divide(double a, double b) {
    if (b != 0) {
        return a / b;
    } else {
        // Handle division by zero error
        return 0.0;
    }
}