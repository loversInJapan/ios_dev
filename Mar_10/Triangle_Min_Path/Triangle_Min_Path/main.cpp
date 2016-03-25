//
//  main.cpp
//  Triangle_Min_Path
//
//  Created by Jon_Snow on 3/22/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int minimumTotal(vector<vector<int>>& triangle) {
    int out_size = (int)triangle.size();
    int total=0;
    for(int i=0; i<out_size; ++i){
        auto min_iter = std::min_element(triangle[i].begin(), triangle[i].end());
        total+=*min_iter;
    }
    return total;
}
int main(int argc, const char * argv[]) {
    vector<vector<int>> matrix{{-1},{2,3},{1,-1,-3}};
    int res = minimumTotal(matrix);
    cout << res << endl;
    return 0;
}
