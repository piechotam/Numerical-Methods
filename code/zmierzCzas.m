function [czasWektor] = zmierzCzas(macierz, b)
%ZMIERZCZAS robi to samo co obliczPrzyklad tylko bez wyswietlania
%informacji dla uzytkownika, uzywam tej funkcji zeby generowac tabelki z
%porownywaniem czasu obliczen
p1 = diag(macierz, 2)'; 
p2 = diag(macierz, 1)';
p3 = diag(macierz)';
p4 = diag(macierz, -1)';
p5 = diag(macierz, -2)';

M = stworzMacierz(p1, p2, p3, p4, p5);

podanaMacierz = diag(p1, 2) + diag(p2, 1) + diag(p3) + diag(p4, -1) + diag(p5, - 2);

tic
wyznacznikMatlab = det(podanaMacierz);
wyznacznikOdwrotnosciMatlab = 1/det(podanaMacierz);
czasObliczaniaWyznacznikaMatlab = toc;

tic
[MpoSchodkowaniu, bPoSchodkowaniu] = schodkowanie(M, b);
czasSchodkowania = toc;

tic
[wyznacznik, wyznacznikOdwrotnosci] = obliczWyznacznik(MpoSchodkowaniu);
czasObliczaniaWyznacznika = toc;

tic
rozwiazanie = rozwiazUklad(MpoSchodkowaniu, bPoSchodkowaniu);
czasRozwiazania = toc;

czasRozwiazywaniaUkladu = czasRozwiazania + czasSchodkowania;

tic
matlabRozwiazanie = linsolve(podanaMacierz, b');
czasRozwiazywaniaUkladuMatlab = toc;

czasWektor = [czasObliczaniaWyznacznika, czasObliczaniaWyznacznikaMatlab, czasRozwiazywaniaUkladu, czasRozwiazywaniaUkladuMatlab];

end

