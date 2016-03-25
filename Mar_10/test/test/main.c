//
//  main.c
//  test
//
//  Created by Jon_Snow on 3/12/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#include <stdio.h>
void sort(int* nums, int lenght);
void quickSort(int* nums, int low, int high);

int main(int argc, const char * argv[]) {
    // insert code here...
    int nums[10] = {16,21,34,42,55,67,79,82,93,108};
    sort(nums, 10);
//    quickSort(nums, 0, 9);
    for (int i = 0; i < 10; ++i) {
        printf("%d ",nums[i]);
    }
    printf("\n");
    return 0;
}

void sort(int* nums, int lenght)
{
//    int odds[lenght];
//    int evens[lenght];
//    int odd_idx = 0;
//    int dou_idx = 0;
//    for (int i = 0; i < lenght; ++i) {
//        int res = nums[i]%2;
//        if (res == 1) {
//            odds[odd_idx++] = nums[i];
//        }else{
//            evens[dou_idx++] = nums[i];
//        }
//    }
//
//    int index = 0;
//    for (int j = 0; j < odd_idx; ++j) {
//        nums[index++] = odds[j];
//    }
//    for (int j = 0; j < dou_idx; ++j) {
//        nums[index++] = evens[j];
//    }
    int i=0, j=lenght-1;
    while(i<j) {
        if (nums[i]%2 == 1) {
            ++i;
            continue;
        }
        if (nums[j]%2 == 0) {
            --j;
            continue;
        }
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
        ++i;
        --j;
    }
    if (nums[i]%2 == 0) {
        i -= 1;
    }
    quickSort(nums, 0, i);
    quickSort(nums, i+1, lenght-1);

}

int partition(int* nums, int low, int high)
{
    int pivot = nums[low];
    while (low < high) {
        while (low < high && nums[high] > pivot) {
            --high;
        }
        nums[low] = nums[high];
        while (low < high && nums[low] < pivot) {
            ++low;
        }
        nums[high] = nums[low];
    }
    nums[low] = pivot;
    return low;
}

void quickSort(int* nums, int low, int high)
{
    if (low < high) {
        int k = partition(nums, low, high);
        quickSort(nums, low, k-1);
        quickSort(nums, k+1, high);
    }
}
