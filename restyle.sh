#!/usr/bin/env bash


sed -i -e 's/Flashback Italics,/Italics,/g' *.ass
sed -i -e 's/Flashback,/Main,/g' *.ass
sed -i -e 's/Main,Танабэ/Main-Tanabe,Танабэ/g' *.ass
sed -i -e 's/Main,Нисиката/Main-Nishikata,Нисиката/g' *.ass
sed -i -e 's/Main Top,Нисиката,0000,0000,0000,,/Main-Nishikata,Нисиката,0000,0000,0000,,{\\an8}/g' *.ass
sed -i -e 's/Italics,Нисиката,0000,0000,0000,,/Main-Nishikata,Нисиката,0000,0000,0000,,{\\i1}/g' *.ass
sed -i -e 's/Italics Top,Нисиката,0000,0000,0000,,/Main-Nishikata,Нисиката,0000,0000,0000,,{\\an8\\i1}/g' *.ass
sed -i -e 's/Main,Такаги/Main-Takagi,Такаги/g' *.ass
sed -i -e 's/Main,Мина/Main-Mina,Мина/g' *.ass
sed -i -e 's/Main,Юкари/Main-Yukari,Юкари/g' *.ass
sed -i -e 's/Main,Санаэ/Main-Sanae,Санаэ/g' *.ass
sed -i -e 's/Main,Накай/Main-Nakai,Накай/g' *.ass
rm -rf *.ass-e