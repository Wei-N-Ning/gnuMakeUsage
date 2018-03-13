
#include "holyGrail.hpp"


treasure::HolyGrail::HolyGrail(bool toFill)
    : m_filled(toFill) {
}


void treasure::HolyGrail::fillWater() {
    m_filled = true;
}


void treasure::HolyGrail::dumpWater() {
    m_filled = false;
}


bool treasure::HolyGrail::isEmpty() {
    return m_filled;
}


void treasure::drink(HolyGrail *pHolyGrail) {
    pHolyGrail->dumpWater();
}
