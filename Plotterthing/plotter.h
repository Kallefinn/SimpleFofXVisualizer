#ifndef PLOTTER_H
#define PLOTTER_H

#include <QtQml/qqmlregistration.h>
#include <QObject>
#include <QPointF>
#include <QList>
#include <QtCharts/QLineSeries>
#include <QValueAxis>



class Plotter : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(QString Name READ Name WRITE setName NOTIFY NameChanged FINAL)
    Q_PROPERTY(QString Text READ Text WRITE setText NOTIFY TextChanged FINAL)
    Q_PROPERTY(QVector<QPointF> Line READ Line NOTIFY LineChanged FINAL)
    Q_PROPERTY(QValueAxis *xAxis READ xAxis WRITE setXAxis NOTIFY xAxisChanged FINAL)
    Q_PROPERTY(QValueAxis *yAxis READ yAxis WRITE setYAxis NOTIFY yAxisChanged FINAL)

public:

    Q_INVOKABLE void appendList(QLineSeries* series) {
        series->replace(m_Line);
        reference = series;
    }
    Q_INVOKABLE QLineSeries* getReference() {
        return reference;
    }
    Plotter(QObject* parent=nullptr);
    ~Plotter();

    const QString& Name();
    void setName(const QString&);
    const QString& Text();
    void setText(const QString&);

    const QVector<QPointF>& Line();

    QValueAxis *xAxis() const;
    void setXAxis(QValueAxis *newXAxis);

    QValueAxis *yAxis() const;
    void setYAxis(QValueAxis *newYAxis);

signals:
    void NameChanged();
    void TextChanged();
    void LineChanged();

    void xAxisChanged();

    void yAxisChanged();

private slots:
    void ValuesChanged(qreal,qreal);

private:

    QString m_Name;
    QString m_Text{"x"};
    QVector<QPointF> m_Line;
    QLineSeries* reference;

    void updateList();
    static int counter;
    QValueAxis *m_xAxis;
    QValueAxis *m_yAxis;
};

#endif // PLOTTER_H
