function [] = obliczPrzyklad(macierz, b, pokaz_blad)
%OBLICZPRZYKLAD rozwiazuje uklad i oblicza wyznaczniki dla podanych
%przekatnych macierzy oraz wektora b
%zwykla funkcja pomocnicza, zeby nie przeklejac ciagle tego samego kodu w
%skrypcie z przykladami
%jesli flaga pokaz_blad jest true to funkcja wypisze dodatkowo
%blad wzgledy i bezwzgledny wyniku 

if (nargin == 2)
    pokaz_blad = 0;
end

p1 = diag(macierz, 2)'; 
p2 = diag(macierz, 1)';
p3 = diag(macierz)';
p4 = diag(macierz, -1)';
p5 = diag(macierz, -2)';

M = stworzMacierz(p1, p2, p3, p4, p5);
disp('Podana macierz: ')
podanaMacierz = wypiszMacierz(M, b);

tic
wyznacznikMatlab = det(podanaMacierz);
wyznacznikOdwrotnosciMatlab = 1/det(podanaMacierz);
matlabWyznacznikCzas = toc;

tic
[MpoSchodkowaniu, bPoSchodkowaniu] = schodkowanie(M, b);
czasSchodkowania = toc;

disp('Macierz po schodkowaniu: ')
wypiszMacierz(MpoSchodkowaniu, bPoSchodkowaniu);

tic
[wyznacznik, wyznacznikOdwrotnosci] = obliczWyznacznik(MpoSchodkowaniu);
wyznacznikCzas = toc;

disp('Wyznacznik macierzy: ')
disp(wyznacznik)
disp('Wyznacznik macierzy odwrotnej: ')
disp(wyznacznikOdwrotnosci)
disp('Czas obliczania wyznacznika: ')
disp(wyznacznikCzas)

disp('Wyznacznik macierzy (matlab): ')
disp(wyznacznikMatlab)
disp('Wyznacznik macierzy odwrotnej (matlab): ')
disp(wyznacznikOdwrotnosciMatlab)
disp('Czas obliczania wyznacznika (matlab): ')
disp(matlabWyznacznikCzas)

tic
rozwiazanie = rozwiazUklad(MpoSchodkowaniu, bPoSchodkowaniu);
czasRozwiazania = toc;

disp('Rozwiazanie ukladu: ')
if (length(rozwiazanie) > 100)
    disp('Dla czytelności wyświetlono pierwsze 100 elementów wektora rozwiązań.')
    disp(rozwiazanie(1:100))
else
    disp(rozwiazanie)
end

disp('Czas działania: ')
disp(czasSchodkowania + czasRozwiazania)

disp('Rozwiazanie matlaba: ')

tic
matlabRozwiazanie = linsolve(podanaMacierz, b');
czasMatlab = toc;

if (length(rozwiazanie) > 100)
    disp('Dla czytelności wyświetlono pierwsze 100 elementów wektora rozwiązań.')
    disp(matlabRozwiazanie(1:100)')
else
    disp(matlabRozwiazanie')
end

disp('Czas działania: ')
disp(czasMatlab)

if (pokaz_blad == true)
    k = min(length(rozwiazanie), 100);
    disp('Blad bezwgledny: ')
    disp(rozwiazanie(1:k) - matlabRozwiazanie(1:k)')
    disp('Blad wzgledny: ')
    disp((rozwiazanie(1:k) - matlabRozwiazanie(1:k)') ./ matlabRozwiazanie(1:k)')
end

end

