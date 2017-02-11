#include <fstream>
#include <iostream>
#include <iterator>
#include <algorithm>
#include <bitset>

#include <SFML/Graphics/Image.hpp>


const std::uint8_t MASK{0x3};
const std::uint8_t MASKSIZE{2};

void usage(int argc, char** argv);
std::vector<std::uint8_t> split(const std::string& filename);
std::vector<std::uint8_t> split(std::ifstream& file);


int main(int argc, char** argv) {
    usage(argc, argv);
    std::string src_filename = argv[1];
    std::string secret_filename = argv[2];
    std::string dst_filename = argv[3];

    sf::Image img;
    if (!img.loadFromFile(src_filename)) {
        std::cerr << "Error: cannot open file " << argv[1] << ". Exiting..."
                  << std::endl;
        exit(1);
    }

    std::size_t x = 0, y = 0;
    const std::size_t X = img.getSize().x, Y = img.getSize().y;
    const std::size_t i = 3, j = 1;

    for (std::uint8_t d : split(secret_filename)) {
        // Hide data
        auto pix = img.getPixel(x, y);
        std::uint8_t r = (pix.r & ~MASK) | d;
        img.setPixel(x, y, {r, pix.g, pix.b});

        // Step
        x += i;
        if (x >= X) {
            x %= X;
            y += j;
            if (y >= Y) {
                std::cerr << "Error: image is not large enough." << std::endl;
                return 1;
            }
        }
    }

    img.saveToFile(dst_filename);
    return 0;
}


void usage(int argc, char** argv) {
    if (argc != 4) {
        std::cerr << "Usage: " << argv[0]
                  << " PICTURE SECRET OUTPUT\n"
                     "   PICTURE     filename of the picture to modify\n"
                     "   SECRET      filename of the secret to hide\n"
                     "   OUTPUT      filename of the output"
                  << std::endl;
        exit(1);
    }
}


std::vector<std::uint8_t> split(const std::string& filename) {
    std::ifstream file(filename, std::ios::binary);
    if (!file) {
        std::cerr << "Error: cannot open file " << filename << ". Exiting..."
                  << std::endl;
        exit(1);
    } else {
        return split(file);
    }
}


std::vector<std::uint8_t> split(std::ifstream& file) {
    std::vector<uint8_t> data;

    while (!file.eof()) {
        char c = file.get();
        data.push_back((c >> 6) & MASK);
        data.push_back((c >> 4) & MASK);
        data.push_back((c >> 2) & MASK);
        data.push_back(c & MASK);
    }

    return data;
}

