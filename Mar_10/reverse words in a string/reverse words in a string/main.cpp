//
//  main.cpp
//  reverse words in a string
//
//  Created by Jon_Snow on 3/16/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#include <iostream>
#include <string>
#include <stack>
#include <sstream>
using namespace std;

void reverseWords(string &s) {
    if(s.size() == 0)
        return;
    size_t ssize = s.size();
    string res;
    stack<string> strs;
    istringstream iss(s);
    string tmp;
    while(iss>>tmp){
        if(tmp == string("")){
            s = res;
            return;
        }
        strs.push(tmp);
    }
    while(!strs.empty()){
        string tmp = strs.top();
        res += tmp;
        res += ' ';
        strs.pop();
    }
    if(res.size() > 0)
        res.erase(res.size()-1,1);
    s = res;
    return;
}

int main(int argc, const char * argv[]) {
    //string s("  hello    welcome to    NewYork  ");
    string s("  ");
    reverseWords(s);
    cout << s << endl;
    return 0;
}
