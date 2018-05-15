//
// Created by Wei on 9/07/2017.
//

#ifndef CXXCLEANBUILDEXAMPLES_GOLDEGG_HPP
#define CXXCLEANBUILDEXAMPLES_GOLDEGG_HPP

namespace treasure {

class Basket;

class GoldEgg {
public:
    GoldEgg();
    GoldEgg(double weight);
    GoldEgg(double weight, Basket *pBasket);
    double weight();
    Basket *basket();
private:
    double m_weight;
    Basket *pBasket;
};


GoldEgg makeEgg(double weight);

}

#endif //CXXCLEANBUILDEXAMPLES_GOLDEGG_HPP
