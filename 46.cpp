#include <iostream>
#include <set>
#include <cmath>

bool check_odd(int a);
bool is_prime(int a);

int main()
{
  for(int i = 9; i < INT_MAX; i += 2){
    bool flag = false;
    for(int j = 1; i > 2*j*j; ++j){
      //std::cout << i << "," << j << std::endl;
      if(is_prime(i-2*j*j)){
        flag = true;
        break;
      }
    }
    if(!flag){
      if(check_odd(i)){
        std::cout << i << std::endl;
        break;
      }
    }
  }
  return 0;
}

bool check_odd(int n)
{
  for(int i = 3; i < n/3; i += 2){
    if(n%i == 0 && (n/i)%2 == 1){
      return true;
    }
  }
  return false;
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
