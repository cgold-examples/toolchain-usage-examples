// main.cpp

#include <iostream> // std::cout

#include <Boo.hpp>

#ifdef WITH_FOO
# include <Foo.hpp>
#endif

int main() {
  Boo::thread_type t;

  std::cout << "C++ standard: " << __cplusplus << std::endl;

#ifdef WITH_FOO
  std::cout << "With Foo support" << std::endl;
  Foo::optimize(t);
#endif

  Boo::call(t);
}
