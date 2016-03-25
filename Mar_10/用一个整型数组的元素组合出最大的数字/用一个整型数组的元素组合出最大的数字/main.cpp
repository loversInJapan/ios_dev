//
//  main.cpp
//  用一个整型数组的元素组合出最大的数字
//
//  Created by Jon_Snow on 3/12/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#include <iostream>
#include <string>
#include <vector>
using namespace std;

struct{
    bool operator()(string s1, string s2){
        size_t s1_len = s1.size();
        size_t s2_len = s2.size();
        size_t len = s1_len < s2_len ? s1_len : s2_len;
        for(size_t i = 0; i < len; ++i){
            if(s1[i] > s2[i])
                return true;
            else if(s1[i] < s2[i])
                return false;
        }
        if(s1_len == s2_len)
            return true;
        else if(s1_len > s2_len)
            return s1[len] > s1[len-1];
        else
            return s2[len] > s2[len-1];
//        return s1 > s2;
    }
}MyComp;

int main(int argc, const char * argv[]) {
    vector<int> iVec = {12,56,5,99,91,81,77,133,71};//{7,77,777,771};
    vector<string> strVec;
    for(auto i : iVec){
//        cout << i << endl;
        strVec.push_back(to_string(i));
    }
    sort(strVec.begin(), strVec.end(), MyComp);
    for(auto s : strVec)
        cout << s << endl;
//    string res;
//    for(auto s : strVec)
//        res+=s;
//    cout << res << endl;
    return 0;
}
