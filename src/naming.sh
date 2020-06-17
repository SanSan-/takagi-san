#!/usr/bin/env bash

sed -i -e 's/Tanabe/Танабэ/g' $1.ass
sed -i -e 's/Scary Teacher/Танабэ/g' $1.ass
sed -i -e 's/Nishikata/Нисиката/g' $1.ass
sed -i -e 's/Teased/Нисиката/g' $1.ass
sed -i -e 's/Takagi/Такаги/g' $1.ass
sed -i -e 's/Jozu/Такаги/g' $1.ass
sed -i -e 's/Mina/Мина/g' $1.ass
sed -i -e 's/Frazzles/Мина/g' $1.ass
sed -i -e 's/Yukari/Юкари/g' $1.ass
sed -i -e 's/Glasses/Юкари/g' $1.ass
sed -i -e 's/Sanae/Санаэ/g' $1.ass
sed -i -e 's/Bob/Санаэ/g' $1.ass
sed -i -e 's/Nakai/Накай/g' $1.ass
sed -i -e 's/Tall/Накай/g' $1.ass
sed -i -e 's/Mano/Мано/g' $1.ass
sed -i -e 's/Stranger Danger/Мано/g' $1.ass
sed -i -e 's/Takao/Такао/g' $1.ass
sed -i -e 's/Buckteeth/Такао/g' $1.ass
sed -i -e 's/Kimura/Кимура/g' $1.ass
sed -i -e 's/Bomb/Кимура/g' $1.ass
sed -i -e 's/Sakurai/Сакурай/g' $1.ass
sed -i -e 's/Kyunko/Кюнко/g' $1.ass
sed -i -e 's/Ikeo/Икео/g' $1.ass
sed -i -e 's/-san/-сан/g' $1.ass
sed -i -e 's/-chan/-тян/g' $1.ass
sed -i -e 's/-kun/-кун/g' $1.ass
sed -i -e 's/-sensei/-сенсей/g' $1.ass
rm -rf $1.ass-e