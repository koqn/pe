#include <iostream>
#include <set>
#include <cmath>

bool is_prime(int a);

int main()
{
  int ans_count = 0;
  int ans_sum = 0;
  for(int i = 10; i < 1000000; ++i){
    int tmp = i;
    bool check = true;
    // left to right
    do{
      if(!is_prime(tmp)){
        check = false;
        break;
      }
      int keta = pow(10, int(std::log(tmp)/std::log(10)));
      tmp = tmp - int(tmp/keta) * keta;
//      std::cout << i << "," << tmp << "," << keta <<  std::endl;
    }while(tmp > 0);

    if(check){
      tmp = i;
      // right to left
      do{
        if(!is_prime(tmp)){
          check = false;
          break;
        }
        tmp /= 10;
      }while(tmp > 0);
      if(check){
        std::cout << i << std::endl;
        ans_sum += i;
        if(++ans_count == 11){
          break;
        }
      }
    }
  }
  std::cout << "ANS : " << ans_sum << std::endl;
  return 0;
}

bool is_prime(int n)
{
  static std::set<int> prime_cache;
  static std::set<int> not_prime_cache;

  if(n == 2) return true;
  if(n == 1 || n == 0) return false;

  if(prime_cache.find(n) != prime_cache.end()){
    return true;
  }
  if(not_prime_cache.find(n) != not_prime_cache.end()){
    return false;
  }

  int last = sqrt(n);
  for(int i = 2; i < n; ++i){
    if(n % i == 0){
      not_prime_cache.insert(std::set<int>::value_type(n));
      return false;
    }
  }
  prime_cache.insert(std::set<int>::value_type(n));
  return true;
}
