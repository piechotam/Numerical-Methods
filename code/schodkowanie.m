function [macierzZeschodkowana, b] = schodkowanie(M, b)
%SCHODKOWANIE metodą eliminacji gaussa doprowadza układ do postaci
%zeschodkowanej, operacje są wykonywane na macierzy gdzie wierszami są
%przekątne więc algorytm nie bedzie przeprowadzany w tradycyjny sposob
% M - macierz przekatnych
% b - wektor ukladu
%szczegoly w sprawozdaniu

[m, n] = size(M);

for i = 1:(n-2)
    indeksy = [3 + 5*(i - 1), 7 + 5*(i - 1), 11 + 5*(i - 1)];

    mnoznik1 = M(4 + 5*(i - 1))/M(3 + 5*(i - 1));
    mnoznik2 = M(5 + 5*(i - 1))/M(3 + 5*(i - 1));

    M(indeksy + 1) = M(indeksy + 1) - mnoznik1.*M(indeksy);
    M(indeksy + 2) = M(indeksy + 2) - mnoznik2.*M(indeksy);

    b(i + 1) = b(i + 1) - mnoznik1*b(i);
    b(i + 2) = b(i + 2) - mnoznik2*b(i);
end

mnoznik = M(m*n - 6)/M(m*n - 7);
M([m*n - 6, m*n - 2]) = M([m*n - 6, m*n - 2]) - mnoznik*M([m*n - 7, m*n - 3]); 

b(length(b)) = b(length(b)) - b(length(b) - 1)*mnoznik;

macierzZeschodkowana = M;

end

