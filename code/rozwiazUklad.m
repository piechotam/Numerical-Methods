function [rozwiazanie] = rozwiazUklad(M, b)
%ROZWIAZUKLAD Rozwiazuje uklad rownan liniowych
% M - macierz ukladu po zastosowaniu schodkowania
% b - wektor ukladu po zastosowaniu schodkowania

n = length(b);
rozwiazanie = zeros(1, n);

rozwiazanie(n) = b(n)/M(3, n);
rozwiazanie(n-1) = (b(n-1) - M(2, n)*rozwiazanie(n))/M(3, n - 1);

for k = n-2:-1:1
    rozwiazanie(k) = (b(k) - sum(M([5*k + 2, 5*k + 6]).*rozwiazanie([k+1, k+2])))/M(3, k);
end

end

