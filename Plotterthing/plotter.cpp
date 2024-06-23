#include "plotter.h"
#include <parser.h>

int Plotter::counter = 0;

Plotter::Plotter(QObject* parent) : QObject(parent)
{
    counter++;

    m_Name = QString{"f(x) "}.append(QString::number(counter));

}

Plotter::~Plotter()
{
    counter--;
}

const QString &Plotter::Name()
{
    return m_Name;
}

void Plotter::setName(const QString &name)
{
    m_Name = name;
}

const QString& Plotter::Text()
{
    return m_Text;
}

void Plotter::setText(const QString& text)
{
    m_Text = text;
    updateList();
}

const QList<QPointF> &Plotter::Line()
{
    return m_Line;
}

void Plotter::updateList()
{
    Parser::trig_function(Text().toStdString(),m_xAxis->min(),m_xAxis->max(),m_Line);
}

QValueAxis *Plotter::xAxis() const
{
    return m_xAxis;
}

void Plotter::setXAxis(QValueAxis *newXAxis)
{
    if (m_xAxis == newXAxis)
        return;
    m_xAxis = newXAxis;
    bool success = connect(m_xAxis,&QValueAxis::rangeChanged,
                           this,&Plotter::ValuesChanged);
    Q_ASSERT(success);
    emit xAxisChanged();
}

QValueAxis *Plotter::yAxis() const
{
    return m_yAxis;
}

void Plotter::setYAxis(QValueAxis *newYAxis)
{
    if (m_yAxis == newYAxis)
        return;
    m_yAxis = newYAxis;
    connect(m_yAxis,&QValueAxis::rangeChanged,this,&Plotter::ValuesChanged);
    emit yAxisChanged();
}

void Plotter::ValuesChanged(qreal min, qreal max)
{
    updateList();
    reference->replace(m_Line);
}
