# ya-conan-cmake-find-multi-template
Template to be used when using the cmake_find_multi conan generator for personal projects. Currently only tested (and made for) MSVC 16. Might get future edits as deemed necessary.

NOTE: This is meant for personal use, but publicised because why not?

It includes spdlog and eastl, and uses the former to write hello world. Fancy. Targeting C++20, and uses MTd/MT on msvc.

Building: 
1. Download conan, create a profile
2. Run conan/mkbuild.sh
3. Configure and build cmake project from root.

Usage: 
* ./source/ contains source code
* ./cmake/ contains cmake includes
* ./conan/ contains conanfile.txt, used when defining dependencies, and mkbuild.sh which currently gets (or builds) for /MTd /MT targets for MSVC
