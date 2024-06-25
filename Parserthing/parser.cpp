#include "parser.h"

Parser::Parser() {}

void Parser::trig_function(const std::string& func, float min, float max, QVector<QPointF> &list)
{
    typedef exprtk::symbol_table<float> symbol_table_t;
    typedef exprtk::expression<float>   expression_t;
    typedef exprtk::parser<float>       parser_t;

    const std::string expression_string = func;

    float x;

    symbol_table_t symbol_table;
    symbol_table.add_variable("x",x);
    symbol_table.add_constants();

    expression_t expression;
    expression.register_symbol_table(symbol_table);

    parser_t parser;
    parser.compile(expression_string,expression);

    float resolution = ((max-min)/1000);
    list.clear();
    list.reserve(resolution*(min+max));
    for (x = min; x <= max; x += resolution)
    {
        float y = expression.value();
        list.append({x,y});
    }
}
