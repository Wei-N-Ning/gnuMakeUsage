//
// Created by Wei on 9/07/2017.
//

#include "goldEgg.hpp"


treasure::GoldEgg::GoldEgg(double weight)
    : m_weight(weight) {
}


double treasure::GoldEgg::weight() {
    return m_weight;
}


treasure::GoldEgg treasure::makeEgg(double weight) {
    return treasure::GoldEgg(weight);
}
