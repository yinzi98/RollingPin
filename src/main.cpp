#include <iostream>

int main(int argc, char **argv) {
    std::FILE* fp = std::fopen(argv[1], "r");
    if (!fp) {
        std::cout << "Failed to open file" << std::endl;
        return EXIT_FAILURE;
    }
    
    return 0;
}
