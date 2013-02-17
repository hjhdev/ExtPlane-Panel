#ifndef VALUEINTERPOLATOR_H
#define VALUEINTERPOLATOR_H

#include <QObject>

/**
 * A helper class that can be used to interpolate double values
 * to make transitions look smoother.
 */
class ValueInterpolator : public QObject
{
    Q_OBJECT
public:
    explicit ValueInterpolator(QObject *parent, double spd);
    
signals:
    void interpolatedValueChanged(QString name, double speed);

public slots:
    void valueChanged(QString name, double val);
    void tickTime(double dt, int total);
private:
    double currentValue, targetValue;
    double speed;
    QString refName;
};

#endif // VALUEINTERPOLATOR_H