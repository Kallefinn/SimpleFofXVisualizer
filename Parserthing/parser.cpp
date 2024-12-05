#include "parser.h"

Parser::Parser() {}

void Parser::parse_function(const std::string& func) {
    symbol_table.add_variable("x",x);
    symbol_table.add_constants();
    expression.register_symbol_table(symbol_table);
    parser.compile(func,expression);
}

void Parser::update_function(float min, float max, QVector<QPointF> &list)
{
    x = min;

    float resolution = ((max-min)/1000);
    list.clear();
    list.reserve(resolution*(max+min));
    for (; x <= max; x+= resolution)
    {
        float y = expression.value();
        list.append({x,y});
    }
    x=0;
}
