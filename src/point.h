#ifndef POINT_H
#define POINT_H
#include <iostream>
using namespace std;
class Point {
    private:
    double x;
    double y;
    public:
    /* constructores */
    Point();
    Point(double xx, double yy);
    /* handle rectangular coordinates */
    double getX() const;
    double getY() const;
    void setX(double xx);
    void setY(double yy);
    /* handle polar coordinates */
    double getRadius() const;
    void setRadius(double r);
    double getAngle() const;
    void setAngle(double theta);
    /* rotate the point of an angle theta*/
    void rotate(double theta);
    bool operator==(const Point& Q) const;
    bool operator!=(const Point& Q) const;
};
    double distance(Point P, Point Q);
    Point midpoint(Point P, Point Q);
    ostream& operator<<(ostream& os, const Point& P);
#endif
