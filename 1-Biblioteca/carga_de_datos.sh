#!/bin/bash
./alta_libro.sh 1988 "The C Programming Language" Pearson Nuevo "Brian W. Kernighan, Dennis Ritchie" 123124
./alta_libro.sh 1988 "The C Programming Language" Pearson Nuevo "Brian W. Kernighan, Dennis Ritchie" 123124
./alta_libro.sh 1988 "The C Programming Language" Pearson Nuevo "Brian W. Kernighan, Dennis Ritchie" 123124
./alta_libro.sh 2008 "Fundamentos de programación" "McGraw Hill" Nuevo "José Luis García, Cristina Sánchez" 213123
./alta_libro.sh 2008 "Fundamentos de programación" "McGraw Hill" Nuevo "José Luis García, Cristina Sánchez" 213123
./alta_libro.sh 2008 "Fundamentos de programación" "McGraw Hill" Nuevo "José Luis García, Cristina Sánchez" 213123
./alta_libro.sh 2022 "Modern operating systems" "Pearson" Nuevo "Andrew S. Tanenbaum" 2823773
./alta_libro.sh 2022 "Modern operating systems" "Pearson" Nuevo "Andrew S. Tanenbaum" 2823773
./alta_libro.sh 2022 "Modern operating systems" "Pearson" Nuevo "Andrew S. Tanenbaum" 2823773
./alta_libro.sh 2018 "Learning web design" "O'Reilly" Nuevo "Jennifer Niederst Robbins" 2139812
./alta_libro.sh 2018 "Learning web design" "O'Reilly" Nuevo "Jennifer Niederst Robbins" 2139812
./alta_libro.sh 2018 "Learning web design" "O'Reilly" Nuevo "Jennifer Niederst Robbins" 2139812
./alta_libro.sh 2010 "The Linux programming interface" "No Starch Press" Nuevo "Michael Kerrisk" 2139812
./alta_libro.sh 2010 "The Linux programming interface" "No Starch Press" Nuevo "Michael Kerrisk" 2139812
./alta_libro.sh 2010 "The Linux programming interface" "No Starch Press" Nuevo "Michael Kerrisk" 2139812

./alta_estado.sh "Prestado"
./alta_estado.sh "Disponible"
./alta_estado.sh "Devolucion atrasada"

./alta_socio.sh 95199392 "Carlos Quiroga 120" 2622254460 "Diego Estrada"
./alta_socio.sh 13238883 "Av. Siempre Viva 792" 262228838 "John Lennon"
./alta_socio.sh 8283773 "Av. Tendo Dojo" 2622152737 "Miyake Shinobu"

./alta_prestamo.sh 3 2
./alta_prestamo.sh 2 5
./alta_prestamo.sh 2 7
./alta_prestamo.sh 3 1
./alta_prestamo.sh 3 4

sqlite3 biblioteca.db "update prestamo set fecha_prestamo='2024-03-03' where id_prestamo=1"
