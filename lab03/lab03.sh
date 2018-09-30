#!/bin/bash
cp /etc/passwd pass.txt
echo "Вивести файл test.txt:"
cat test.txt #Вивести файл test.txt
echo "Вивести файл city.txt:"
cat city.txt #Вивести файл city.txt
echo "Вивести файл pass.txt:"
cat pass.txt #Вивести файл pass.txt
echo "Вивести кількість слів у test.txt:"
wc -w test.txt #Вивести кількість слів у test.txt
echo "Вивести кількість слів у city.txt:"
wc -w city.txt #Вивести кількість слів у city.txt
echo "Вивести кількість слів у pass.txt:"
wc -w pass.txt #Вивести кількість слів у pass.txt
echo "Вивести з кожного рядка файлу pass.txt 6 та 1 поле(поля у рядках розділені двокрапкою):"
awk -F "\"*:\"*" '{print $6,$1}' pass.txt #Вивести з кожного рядка файлу pass.txt 6 та 1 поле. Поля у рядках розділені двокрапкою.
echo "Вивести останні 8 рядків з файлу pass.txt:"
tail -n 8 pass.txt #Вивести останні 8 рядків з файлу pass.txt
echo "Вивести city.txt з сортуванням рядків за алфавітом у зворотному напрямку:"
sort -r city.txt #Вивести city.txt з сортуванням рядків за алфавітом у зворотному напрямку
echo "Вивести city.txt з виконанням заміни a на X, b на Y, c на Z:"
sed -e 's/a/X/; s/b/Y/; s/c/Z/' city.txt #Вивести city.txt з виконанням заміни a на X, b на Y, c на Z
echo "Вивести з city.txt рядки в яких є Hungary або Austria:"
awk /Hungary/ city.txt; awk /Austria/ city.txt #Вивести з city.txt рядки в яких є Hungary або Austria
echo "Розділити city.txt на декілька файлів, по 3 рядки у кожному:"
split -l 3 city.txt #Розділити city.txt на декілька файлів, по 3 рядки у кожному