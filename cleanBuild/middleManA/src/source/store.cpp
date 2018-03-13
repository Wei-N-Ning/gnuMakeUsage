//
// Created by Wei on 9/07/2017.
//

#include <vector>

#include <goldEgg.hpp>

#include "store.hpp"


namespace middleManA {

class EggBasketImpl {
public:
    EggBasketImpl(int num, double weight);
    typedef std::vector<treasure::GoldEgg> EggVec;
    EggVec m_vec;
};

EggBasketImpl::EggBasketImpl(int num, double weight) {
    for (int i = 0; i < num; i++) {
        m_vec.push_back(treasure::GoldEgg(weight));
    }
}

EggBasket::EggBasket(int num, double weight)
    : pImpl(new EggBasketImpl(num, weight)) {
}

int EggBasket::num() {
    return pImpl->m_vec.size();
}

double EggBasket::weight(int idx) {
    if (idx <= pImpl->m_vec.size() - 1)
        return pImpl->m_vec[idx].weight();
    return 0.0;
}

}
