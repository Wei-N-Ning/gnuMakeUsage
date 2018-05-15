//
// Created by Wei on 9/07/2017.
//

#ifndef CXXCLEANBUILDEXAMPLES_STORE_HPP
#define CXXCLEANBUILDEXAMPLES_STORE_HPP

#include <memory>


namespace middleManA {

class EggBasketImpl;

class EggBasket {
public:
    EggBasket(int num, double weight);
    double weight(int idx);
    int num();
private:
    std::shared_ptr<EggBasketImpl> pImpl;
};

}


#endif //CXXCLEANBUILDEXAMPLES_STORE_HPP
