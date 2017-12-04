// Foo.cpp

#include <Foo.hpp>

constexpr int foo_helper_value() {
  return 0x42;
}

int Foo::optimize(Boo::thread_type&) {
  return foo_helper_value();
}
