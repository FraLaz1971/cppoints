#include "point.h"
#include <iostream>
using namespace std;
int main(int argc, char* argv[]){
    Point p1(10.2, 7.33);
    cout << argv[0]<< ": creating a point p1(10.2, 7.33)" << endl;
    cout << "p1_x = " << p1.getX() << " p1_y = " << p1.getY() << endl;
	return EXIT_SUCCESS;
}
