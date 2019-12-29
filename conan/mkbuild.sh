#!/bin/bash
if ! conan install . -s build_type=Debug -s compiler.runtime=MTd --build=missing; then
	print "build failed with ${?}";
	return -1;
fi;
if ! conan install . -s build_type=Release -s compiler.runtime=MT --build=missing; then
	print "build failed with ${?}";
	return -1;
fi;
