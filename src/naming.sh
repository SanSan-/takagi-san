#!/usr/bin/env bash

VAR1 = $1
VAR1 = ${VAR1:="*"}

sed -i -e 's/Tanabe/Танабэ/g' $VAR1.ass
sed -i -e 's/Nishikata/Нисиката/g' $VAR1.ass
sed -i -e 's/Takagi/Такаги/g' $VAR1.ass
sed -i -e 's/Mina/Мина/g' $VAR1.ass
sed -i -e 's/Yukari/Юкари/g' $VAR1.ass
sed -i -e 's/Sanae/Санаэ/g' $VAR1.ass
sed -i -e 's/Nakai/Накай/g' $VAR1.ass
sed -i -e 's/-san/-сан/g' $VAR1.ass
sed -i -e 's/-chan/-тян/g' $VAR1.ass
sed -i -e 's/-kun/-кун/g' $VAR1.ass
sed -i -e 's/-sensei/-сенсей/g' $VAR1.ass
rm -rf $VAR1.ass-e