//
//  main.cpp
//  DSA-Cpp
//
//  Created by Codes Orbit on 30/09/2023.
//

#include <iostream>
#include <vector>
//#include "Arrays/Different-Questions-Explantaion"
using namespace std;
bool searchMatrix(vector<vector<int>>& matrix, int target) {
        int m = matrix.size(), n = matrix[0].size();
        int start = 0, end = m*n - 1;
        int mid = 0;
    int value = 0;
        while(start <= end){
            mid = start + (end - start)/2;
            value = matrix[mid/n][mid%n];
            if(value == target){
                return true;
            }

            if(target > value){
                start = mid + 1;
            }else{
                end = mid -1;
            }
            
        }
        return false;
    }

bool searchMatrix1(vector<vector<int>>& matrix, int target) {
    // treat the matrix as an array, just taking care of indices
    // [0..n*m]
    // (row, col) -> row*n + col
    // i -> [i/n][i%n]
    if(matrix.empty() || matrix[0].empty())
    {
        return false;
    }
    int m = matrix.size(), n = matrix[0].size();
    int start = 0, end = m*n - 1;
    while(start <= end)
    {
        int mid = start + (end - start)/2;
        int e = matrix[mid/n][mid%n];
        if(target < e)
        {
            end = mid - 1;
        }
        else if(target > e)
        {
            start = mid + 1;
        }
        else
        {
            return true;
        }
    }
    return false;
}
int main(int argc, const char * argv[]) {
    // insert code here...
    vector<int> v;
    v.push_back(100);
//    cout<<v[0];
    vector<vector<int>> matrix{
        {1,2,3,4},
        {5,6,7,8},
        {9,10,11,12}
    };
    if(searchMatrix(matrix,5)){
        cout<<"ture";
    }else{
        cout<<"false";
    }
    cout << "Hello, World!\n";
//    print();
    return 0;
}
