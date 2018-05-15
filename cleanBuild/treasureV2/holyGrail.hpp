//
// Created by Wei on 9/07/2017.
//

#ifndef CXXCLEANBUILDEXAMPLES_HOLYGRAIL_HPP
#define CXXCLEANBUILDEXAMPLES_HOLYGRAIL_HPP


namespace treasure {

class HolyGrail {
public:
    HolyGrail(bool toFill);
    HolyGrail(bool toFill, double price);
    double price();
    void fillWater();
    void dumpWater();
    bool isEmpty();
private:
    double m_price;
    bool m_filled;
};


void drink(HolyGrail *pHolyGrail);

void payToDrink(HolyGrail *pHolyGrail, double pricePaid);

}


#endif //CXXCLEANBUILDEXAMPLES_HOLYGRAIL_HPP
