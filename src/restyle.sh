#!/usr/bin/env bash

VAR1 = $1
VAR1 = ${VAR1:="*"}

sed -i -e 's/,Flashback Italics,/,Italics,/g' $VAR1.ass
sed -i -e 's/,Flashback,/,Main,/g' $VAR1.ass
sed -i -e 's/,Main,Танабэ/,Main-Tanabe,Танабэ/g' $VAR1.ass
sed -i -e 's/,Main,Нисиката/,Main-Nishikata,Нисиката/g' $VAR1.ass
sed -i -e 's/,Main Top,Нисиката,0000,0000,0000,,/,Main-Nishikata,Нисиката,0000,0000,0000,,{\\an8}/g' $VAR1.ass
sed -i -e 's/,Italics,Нисиката,0000,0000,0000,,/,Main-Nishikata,Нисиката,0000,0000,0000,,{\\i1}/g' $VAR1.ass
sed -i -e 's/,Italics Top,Нисиката,0000,0000,0000,,/,Main-Nishikata,Нисиката,0000,0000,0000,,{\\an8\\i1}/g' $VAR1.ass
sed -i -e 's/,Main Top,Нисиката,0,0,0,,/,Main-Nishikata,Нисиката,0,0,0,,{\\an8}/g' $VAR1.ass
sed -i -e 's/,Italics,Нисиката,0,0,0,,/,Main-Nishikata,Нисиката,0,0,0,,{\\i1}/g' $VAR1.ass
sed -i -e 's/,Italics Top,Нисиката,0,0,0,,/,Main-Nishikata,Нисиката,0,0,0,,{\\an8\\i1}/g' $VAR1.ass
sed -i -e 's/,Main,Такаги/,Main-Takagi,Такаги/g' $VAR1.ass
sed -i -e 's/,Main,Мина/,Main-Mina,Мина/g' $VAR1.ass
sed -i -e 's/,Main,Юкари/,Main-Yukari,Юкари/g' $VAR1.ass
sed -i -e 's/,Main,Санаэ/,Main-Sanae,Санаэ/g' $VAR1.ass
sed -i -e 's/,Main,Накай/,Main-Nakai,Накай/g' $VAR1.ass
rm -rf $VAR1.ass-e