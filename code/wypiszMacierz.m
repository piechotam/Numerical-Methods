function [outputM] = wypiszMacierz(M, b)
%WYPISZMACIERZ wypisuje na konsoli macierz pieciodiagonalna w sposob
%zrozumialy dla uzytkownika, dodatkowo zwraca przeksztalcona macierz (przyda sie do
%sprawdzenia wynikow za pomoca linsolve)
% M - macierz pieciodiagonalna, w M sa zapisane jedynie przekatne macierzy
% b - wektor ukladu

p1 = M(1, :);
p1 = p1(3:length(p1));

p2 = M(2, :);
p2 = p2(2:length(p2));

p3 = M(3, :);

p4 = M(4, :);
p4 = p4(1:(length(p4) - 1));

p5 = M(5, :);
p5 = p5(1:(length(p5) - 2));

outputM = diag(p1, 2) + diag(p2, 1) + diag(p3) + diag(p4, -1) + diag(p5, - 2);

if (size(outputM, 1) > 100)
    disp('Dla czytelnosci wyswietlamy tylko poddmacierz 10 na 10: ')
    disp([outputM(1:100, 1:100), b(1:100)'])
else
    disp([outputM, b'])
end

end

