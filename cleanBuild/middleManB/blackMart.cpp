//
// Created by Wei on 9/07/2017.
//

#include <holyGrail.hpp>

#include "blackMart.hpp"


namespace middleManB {

class GrailImpl {
public:
    GrailImpl(bool toFill);
    
    treasure::HolyGrail m_hg;
};

GrailImpl::GrailImpl(bool toFill)
    : m_hg(toFill) {
}

Grail::Grail(bool toFill)
    : pGrailImpl(new GrailImpl(toFill)) {
}

bool Grail::isEmpty() {
    return pGrailImpl->m_hg.isEmpty();
}

void Grail::dumpWater() {
    pGrailImpl->m_hg.dumpWater();
}

}