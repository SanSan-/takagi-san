#!/usr/bin/env bash

MASK = $1
MASK = ${MASK:="*"}

sed -i -e 's/Tanabe/Танабэ/g' $MASK.ass
sed -i -e 's/Nishikata/Нисиката/g' $MASK.ass
sed -i -e 's/Takagi/Такаги/g' $MASK.ass
sed -i -e 's/Mina/Мина/g' $MASK.ass
sed -i -e 's/Yukari/Юкари/g' $MASK.ass
sed -i -e 's/Sanae/Санаэ/g' $MASK.ass
sed -i -e 's/Nakai/Накай/g' $MASK.ass
sed -i -e 's/-san/-сан/g' $MASK.ass
sed -i -e 's/-chan/-тян/g' $MASK.ass
sed -i -e 's/-kun/-кун/g' $MASK.ass
sed -i -e 's/-sensei/-сенсей/g' $MASK.ass
rm -rf $MASK.ass-e