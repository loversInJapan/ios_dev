//
//  main.cpp
//  LIS
//
//  Created by Jon_Snow on 3/19/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#include <iostream>
#include <vector>
using namespace std;

int lengthOfLIS(vector<int>& nums) {
    int n = (int)nums.size();
    if(n <= 1){
        return n;
    }
    vector<int> liss(n,1);
    for(int i=1; i<n; ++i){
        for(int j=0; j<i; ++j){
            if(nums[j] < nums[i] && liss[j]+1 > liss[i]){
                liss[i] = liss[j]+1;
            }
        }
    }
    int max=1;
    for(auto i : liss)
        max = max > i ? max : i;
    return max;
}

int main(int argc, const char * argv[]) {
    vector<int> iv{10,9,2,5,3,7,101,18};
    int len = lengthOfLIS(iv);
    cout << len << endl;
    return 0;
}
