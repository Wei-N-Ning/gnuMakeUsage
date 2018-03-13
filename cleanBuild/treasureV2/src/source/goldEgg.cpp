//
// Created by Wei on 9/07/2017.
//

#include "goldEgg.hpp"


treasure::GoldEgg::GoldEgg(double weight)
    : m_weight(weight), pBasket(nullptr) {
}


treasure::GoldEgg::GoldEgg(double weight, Basket *pBasket)
    : m_weight(weight), pBasket(pBasket) {
}


double treasure::GoldEgg::weight() {
    return m_weight;
}


treasure::Basket *treasure::GoldEgg::basket() {
    return pBasket;
}


treasure::GoldEgg treasure::makeEgg(double weight) {
    return {weight};
}
