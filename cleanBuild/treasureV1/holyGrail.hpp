//
// Created by Wei on 9/07/2017.
//

#ifndef CXXCLEANBUILDEXAMPLES_HOLYGRAIL_HPP
#define CXXCLEANBUILDEXAMPLES_HOLYGRAIL_HPP


namespace treasure {

class HolyGrail {
public:
    HolyGrail(bool toFill);
    void fillWater();
    void dumpWater();
    bool isEmpty();
private:
    bool m_filled;
};


void drink(HolyGrail *pHolyGrail);

}


#endif //CXXCLEANBUILDEXAMPLES_HOLYGRAIL_HPP
