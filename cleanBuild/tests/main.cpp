
#include <iostream>

#include <goldEgg.hpp>


namespace treasure {

class Basket {
public:
    void broadcast();
};

void Basket::broadcast() {
    std::cout << "I am a basket!!" << std::endl;
}

}


int main(int argc, char **argv) {
    using namespace treasure;
    Basket b;
    GoldEgg ge{10.0, &b};
    ge.basket()->broadcast();
    return 0;
}