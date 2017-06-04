#include <exception>
#include <iostream>

#include "mylib/public.h"

int main()
{
    try
    {
        // Todo(modern-cpp): Use MyLib here
    }
    catch(const std::exception &e)
    {
        std::cerr << "Error: " << e.what() << std::endl;
        return -1;
    }

    return 0;
}
