#ifndef PARSER_H
#define PARSER_H

#include "exprtk.hpp"
#include <QVector>
#include <QPointF>

class Parser {
public:
    Parser();
    void parse_function(const std::string& func);
    void update_function(float min, float max, QVector<QPointF> &list);
private:
    exprtk::symbol_table<float> symbol_table;
    exprtk::expression<float> expression;
    exprtk::parser<float> parser;
    float x=0;
};
#endif // PARSER_H
