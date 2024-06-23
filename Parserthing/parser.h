#ifndef PARSER_H
#define PARSER_H

#include "exprtk.hpp"
#include <QVector>
#include <QPointF>

class Parser {
public:
    Parser();
    static void trig_function(const std::string& func, float min, float max, QVector<QPointF> &list);

};
#endif // PARSER_H
