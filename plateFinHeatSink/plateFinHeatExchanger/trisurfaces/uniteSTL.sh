#!/bin/bash

# name of the output file
TARGET=fluidHeaterFins.stl
INLET_FLUID=inlet_fluid.stl
OUTLET_FLUID=outlet_fluid.stl
WALLS_FLUID=walls_fluid.stl
BASE_FINS=base_fins.stl
WALLS_HEATER=walls_heater.stl


[ -f $TARGET ] && rm $TARGET

# create an empty file name defined by TARGET
touch $TARGET

# find text solid and add name of the surface (here inlet_fluid)
sed -i '1 s/^.*$/solid inlet_fluid/' $INLET_FLUID
# add the modified file to target file
cat $INLET_FLUID >> $TARGET

sed -i '1 s/^.*$/solid outlet_fluid/' $OUTLET_FLUID
cat $OUTLET_FLUID >> $TARGET

sed -i '1 s/^.*$/solid walls_fluid/' $WALLS_FLUID
cat $WALLS_FLUID >> $TARGET

sed -i '1 s/^.*$/solid walls_heater/' $WALLS_HEATER
cat $WALLS_HEATER >> $TARGET

sed -i '1 s/^.*$/solid base_fins/' $BASE_FINS
cat $BASE_FINS >> $TARGET
