#include <iostream>
#include <cmath>
#include <list>

int main() {
  double base = std::pow(9.0, 5.0);
  int last = 9;
  for(int n = 1; n < 10; ++n){
    int num = base * n;
    if(last > num){
      break;
    }
    last = last * 10 + 9;
  }
//  std::cout << last << std::endl;
  std::list<int> ans;
  for(int i = 2; i < last; ++i){
    int tmp = i;
    int sum = 0;
    while(tmp > 0){
      double base = tmp % 10;
      sum += std::pow(base, 5);
      tmp /= 10;
    }
    if(i == sum){
//      std::cout << "ANS : " << i << std::endl;
      ans.push_back(i);
    }
  }
  long ans_sum = 0;
  for (std::list<int>::iterator it = ans.begin();
       it != ans.end(); ++it) {
    ans_sum += *it;
  } 
  std::cout << ans_sum << std::endl;
  return 0;
}
