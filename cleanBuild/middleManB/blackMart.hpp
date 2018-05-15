//
// Created by Wei on 9/07/2017.
//

#ifndef CXXCLEANBUILDEXAMPLES_BLACKMART_HPP
#define CXXCLEANBUILDEXAMPLES_BLACKMART_HPP

#include <memory>


namespace middleManB {

class GrailImpl;

class Grail {
public:
    Grail(bool toFill);
    bool isEmpty();
    void dumpWater();
private:
    std::shared_ptr<GrailImpl> pGrailImpl;
};

}


#endif //CXXCLEANBUILDEXAMPLES_BLACKMART_HPP
