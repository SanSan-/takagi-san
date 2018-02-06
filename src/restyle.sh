#!/usr/bin/env bash

sed -i -e 's/,Flashback Italics,/,Italics,/g' $1.ass
sed -i -e 's/,Flashback,/,Main,/g' $1.ass
sed -i -e 's/,Main,Танабэ/,Main-Tanabe,Танабэ/g' $1.ass
sed -i -e 's/,Main,Нисиката/,Main-Nishikata,Нисиката/g' $1.ass
sed -i -e 's/,Main Top,Нисиката,0000,0000,0000,,/,Main-Nishikata,Нисиката,0000,0000,0000,,{\\an8}/g' $1.ass
sed -i -e 's/,Italics,Нисиката,0000,0000,0000,,/,Main-Nishikata,Нисиката,0000,0000,0000,,{\\i1}/g' $1.ass
sed -i -e 's/,Italics Top,Нисиката,0000,0000,0000,,/,Main-Nishikata,Нисиката,0000,0000,0000,,{\\an8\\i1}/g' $1.ass
sed -i -e 's/,Main Top,Нисиката,0,0,0,,/,Main-Nishikata,Нисиката,0,0,0,,{\\an8}/g' $1.ass
sed -i -e 's/,Italics,Нисиката,0,0,0,,/,Main-Nishikata,Нисиката,0,0,0,,{\\i1}/g' $1.ass
sed -i -e 's/,Italics Top,Нисиката,0,0,0,,/,Main-Nishikata,Нисиката,0,0,0,,{\\an8\\i1}/g' $1.ass
sed -i -e 's/,Main,Такаги/,Main-Takagi,Такаги/g' $1.ass
sed -i -e 's/,Main,Мина/,Main-Mina,Мина/g' $1.ass
sed -i -e 's/,Main,Юкари/,Main-Yukari,Юкари/g' $1.ass
sed -i -e 's/,Main,Санаэ/,Main-Sanae,Санаэ/g' $1.ass
sed -i -e 's/,Main,Накай/,Main-Nakai,Накай/g' $1.ass
rm -rf $1.ass-e