#!/usr/bin/env bash

MASK = $1
MASK = ${MASK:="*"}

sed -i -e 's/,Flashback Italics,/,Italics,/g' $MASK.ass
sed -i -e 's/,Flashback,/,Main,/g' $MASK.ass
sed -i -e 's/,Main,Танабэ/,Main-Tanabe,Танабэ/g' $MASK.ass
sed -i -e 's/,Main,Нисиката/,Main-Nishikata,Нисиката/g' $MASK.ass
sed -i -e 's/,Main Top,Нисиката,0000,0000,0000,,/,Main-Nishikata,Нисиката,0000,0000,0000,,{\\an8}/g' $MASK.ass
sed -i -e 's/,Italics,Нисиката,0000,0000,0000,,/,Main-Nishikata,Нисиката,0000,0000,0000,,{\\i1}/g' $MASK.ass
sed -i -e 's/,Italics Top,Нисиката,0000,0000,0000,,/,Main-Nishikata,Нисиката,0000,0000,0000,,{\\an8\\i1}/g' $MASK.ass
sed -i -e 's/,Main Top,Нисиката,0,0,0,,/,Main-Nishikata,Нисиката,0,0,0,,{\\an8}/g' $MASK.ass
sed -i -e 's/,Italics,Нисиката,0,0,0,,/,Main-Nishikata,Нисиката,0,0,0,,{\\i1}/g' $MASK.ass
sed -i -e 's/,Italics Top,Нисиката,0,0,0,,/,Main-Nishikata,Нисиката,0,0,0,,{\\an8\\i1}/g' $MASK.ass
sed -i -e 's/,Main,Такаги/,Main-Takagi,Такаги/g' $MASK.ass
sed -i -e 's/,Main,Мина/,Main-Mina,Мина/g' $MASK.ass
sed -i -e 's/,Main,Юкари/,Main-Yukari,Юкари/g' $MASK.ass
sed -i -e 's/,Main,Санаэ/,Main-Sanae,Санаэ/g' $MASK.ass
sed -i -e 's/,Main,Накай/,Main-Nakai,Накай/g' $MASK.ass
sed -i -e 's/,Main,Такао/,Main-Takao,Такао/g' $MASK.ass
rm -rf $MASK.ass-e