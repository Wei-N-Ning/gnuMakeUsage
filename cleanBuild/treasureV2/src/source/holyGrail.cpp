
#include "holyGrail.hpp"


treasure::HolyGrail::HolyGrail(bool toFill, double price)
    : m_filled(toFill), m_price(price) {
}


treasure::HolyGrail::HolyGrail(bool toFill)
    : m_filled(toFill), m_price(10000.0) {
}


double treasure::HolyGrail::price() {
    return m_price;
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


void treasure::payToDrink(HolyGrail *pHolyGrail, double pricePaid) {
    if (pricePaid >= pHolyGrail->price())
        treasure::drink(pHolyGrail);
}
