//
// Created by Wei on 9/07/2017.
//

#include <iostream>

#include <store.hpp>
#include <blackMart.hpp>


int main(int argc, char **argv) {
    middleManA::EggBasket eggBasket(10, 2.13412);
    std::cout << "gold egg weight: " << eggBasket.weight(0) << std::endl;
    std::cout << "total number of gold eggs: " << eggBasket.num() << std::endl;
    middleManB::Grail hg(true);
    std::cout << "holy grail is empty: " << hg.isEmpty() << std::endl;
    hg.dumpWater();
    std::cout << "holy grail is empty: " << hg.isEmpty() << std::endl;
    return 0;
}