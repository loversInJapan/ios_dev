#include <iostream>
using namespace std;

class Base
{
public:
    int age_;
};

class Derived : public Base
{
public:
    //int age_;
    void setAge(int);
    int age()
    {
        return age_;
    }
};

void Derived::setAge(int age)
{
    age_ = age;
}

int main()
{
    Derived obj;
    obj.setAge(10);
    cout << obj.age() << endl;
    return 0;
}