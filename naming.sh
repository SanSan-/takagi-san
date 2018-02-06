#!/usr/bin/env bash

sed -i -e 's/Tanabe/Танабэ/g' *.ass
sed -i -e 's/Nishikata/Нисиката/g' *.ass
sed -i -e 's/Takagi/Такаги/g' *.ass
sed -i -e 's/Mina/Мина/g' *.ass
sed -i -e 's/Yukari/Юкари/g' *.ass
sed -i -e 's/Sanae/Санаэ/g' *.ass
sed -i -e 's/Nakai/Накай/g' *.ass
sed -i -e 's/-san/-сан/g' *.ass
sed -i -e 's/-chan/-тян/g' *.ass
sed -i -e 's/-kun/-кун/g' *.ass
sed -i -e 's/-sensei/-сенсей/g' *.ass
rm -rf *.ass-e