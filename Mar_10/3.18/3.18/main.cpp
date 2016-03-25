//
//  main.cpp
//  3.18
//
//  Created by Jon_Snow on 3/18/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#include <iostream>
using namespace std;

class B
{
public:
    B(){}
    ~B(){}
};

class D : public B
{
public:
    D(){}
    ~D(){}
    void foo_d()
    {
        cout << "this is class D" << endl;
    }
};

class Base
{
public:
    Base()
    {
    }
    virtual ~Base(){}
//protected:
    float x_, y_, z_;
};

int main(int argc, const char * argv[]) {
//    D d;
//    B& pb = d;
//    pb.foo_d();
    Base base;
    printf("%p %p %p\n", &Base::x_, &Base::y_, &Base::z_);
    printf("%p %p %p\n", &base.x_, &base.y_, &base.z_);

    return 0;
}
