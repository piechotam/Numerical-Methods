function [wyznacznik, wyznacznikOdwrotnosci] = obliczWyznacznik(M)
%OBLICZWYZNACZNIK oblicza wyznacznik macierzy układu
% M - macierz przekatnych po zastosowaniu schodkowania, 3 wiersz to glowna przekatna

wyznacznik = prod(M(3, :));
wyznacznikOdwrotnosci = 1 / wyznacznik;

end

