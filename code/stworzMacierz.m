function [macierz] = stworzMacierz(p1, p2, p3, p4, p5)
%STWORZMACIERZ Tworzy macierz przekątnych
% wynikowa macierz jest wymiarow 5 x n, kazdy wiersz to przekatna - puste
% miejsca uzupelnione sa zerami


% uzupelniamy zerami aby macierzy byla 5 x n
p1 = [0, 0, p1];
p2 = [0, p2];
p4 = [p4, 0];
p5 = [p5, 0, 0];

macierz = [p1; p2; p3; p4; p5];

end

