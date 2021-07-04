#!/bin/sh


test, test2 = `echo $(amixer -c 1 sget Front | grep "\%" | cut -f1 -d'%' | cut -d '[' -f2)`

#amixer -c 1 sget Headphone | grep "\%" | cut -f1 -d'%' | cut -d '[' -f2

#amixer -c 1 set Headphone 0% && amixer -c 1 set Front 100%
echo $test