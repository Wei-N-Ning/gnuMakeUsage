//
// Created by Wei on 9/07/2017.
//

#ifndef CXXCLEANBUILDEXAMPLES_GOLDEGG_HPP
#define CXXCLEANBUILDEXAMPLES_GOLDEGG_HPP

namespace treasure {

class GoldEgg {
public:
    GoldEgg(double weight);
    double weight();
private:
    double m_weight;
};


GoldEgg makeEgg(double weight);

}

#endif //CXXCLEANBUILDEXAMPLES_GOLDEGG_HPP
