%aby zobaczyc wynik nalezy odkomentowac linijke wywolujaca obliczPrzyklad
%podobnie aby wyswietlic tabelke z pomiarem czasu (przyklady 2 - 6) nalezy
%odkomentowac fragemnt kodu mierzacego czas i disp(T)

%--------------------------------PRZYKLAD 1
%Sprawdzenie zgodności naszego algorytmu z wbudowaną funkcją matlaba
%Do tego celu uzyjemy dużych (n = 10 000) macierzy z losowymi (losowane z rozkladu U([0,1])) wyrazami
n = 10000;
M = rand(n, n);
b = rand(1, n);

%obliczPrzyklad(M, b, 1)

%ze wzgledu na to ze macierz jest bardzo duzych rozmiarow i jej wyrazy sa z
%przedzialu [0,1] to wyznacznik wychodzi zerowy, dlatego rozwiaze tez
%mniejszy uklad zeby bylo widac ze wyznacznik tez jest liczony dokladnie

n = 100;
M = rand(n, n);
b = rand(1, n);

%obliczPrzyklad(M, b, 1)

%blad pomijalny - i tak tez wychodzi w pozostalych macierzach
%stad od tego momentu juz nie bede wyswietlal i zajmowal sie bledem
%oczywiscie zawsze mozna go wyswietlic podajac 1 jako ostatni argument
%funkcji obliczPrzyklad (jesli ktos lubi ogladac wiersze pelne liczb bliskich zera
%to polecam)

%--------------------------------PRZYKLAD 2
%Zbadamy teraz jak w przypadku losowych macierzy nasz algorytm radzi sobie
%czasowo w porownaniu do funkcji wbudowanych matlaba

wartosci_n = [100, 1000, 2500, 5000, 10000];
macierzCzasow = zeros(length(wartosci_n), 4); %tu bede trzymal czas obliczany w petli for

%--------pomiar_czasu
% 
% i = 1;
% for n = wartosci_n
%     M = rand(n);
%     b = rand(1, n);
%     czas = zmierzCzas(M, b);
%     macierzCzasow(i, :) = czas;
%     i = i + 1;
% end
% 
% T = table(macierzCzasow(:, 1), macierzCzasow(:, 2), macierzCzasow(:, 3), macierzCzasow(:, 4),...
%     'VariableNames', {'czasObliczaniaWyznacznika', 'czasObliczaniaWyznacznikaMatlab', 'czasRozwiazywaniaUkladu', 'czasRozwiazywaniaUkladuMatlab'},...
%     'RowNames', {'n = 100', 'n = 1000', 'n = 2500', 'n = 5000', 'n = 10000'});
% 
% disp(T);
% 
% subplot(1,2,1)
% plot(wartosci_n, T.czasRozwiazywaniaUkladu, 'LineWidth', 3)
% hold on;
% plot(wartosci_n, T.czasRozwiazywaniaUkladuMatlab, 'LineWidth', 3)
% 
% subplot(1,2,2)
% plot(wartosci_n, log10(T.czasRozwiazywaniaUkladu), 'LineWidth', 3)
% hold on;
% plot(wartosci_n, log10(T.czasRozwiazywaniaUkladuMatlab), 'LineWidth', 3)

%--------------------------------PRZYKLAD 3
%macierz hilberta

wartosci_n = [100, 1000, 2500, 5000, 10000];
macierzCzasow = zeros(length(wartosci_n), 4);

%przed pomiarem obliczenie dla najwiekszego rozmiaru
M = hilb(wartosci_n(length(wartosci_n)));
b = rand(1, wartosci_n(length(wartosci_n)));
%obliczPrzyklad(M, b, 1);

%--------pomiar_czasu

% i = 1;
% for n = wartosci_n
%     M = hilb(n);
%     b = rand(1, n);
%     czas = zmierzCzas(M, b);
%     macierzCzasow(i, :) = czas;
%     i = i + 1;
% end
% 
% T = table(macierzCzasow(:, 1), macierzCzasow(:, 2), macierzCzasow(:, 3), macierzCzasow(:, 4),...
%     'VariableNames', {'czasObliczaniaWyznacznika', 'czasObliczaniaWyznacznikaMatlab', 'czasRozwiazywaniaUkladu', 'czasRozwiazywaniaUkladuMatlab'},...
%     'RowNames', {'n = 100', 'n = 1000', 'n = 2500', 'n = 5000', 'n = 10000'});
% 
% disp(T);
% 
% subplot(1,2,1)
% plot(wartosci_n, T.czasRozwiazywaniaUkladu, 'LineWidth', 3)
% hold on;
% plot(wartosci_n, T.czasRozwiazywaniaUkladuMatlab, 'LineWidth', 3)
% 
% subplot(1,2,2)
% plot(wartosci_n, log10(T.czasRozwiazywaniaUkladu), 'LineWidth', 3)
% hold on;
% plot(wartosci_n, log10(T.czasRozwiazywaniaUkladuMatlab), 'LineWidth', 3)

%--------------------------------PRZYKLAD 4
%testowanie limitow
wartosci_n = [5000, 10000, 20000, 50000, 75000, 100000, 150000];
macierzCzasow = zeros(length(wartosci_n), 1);

%--------pomiar_czasu

% i = 1;
% for n = wartosci_n
%     p1 = rand(1, n - 2);
%     p2 = rand(1, n - 1);
%     p3 = rand(1, n);
%     p4 = rand(1, n - 1);
%     p5 = rand(1, n - 2);
% 
%     M = stworzMacierz(p1, p2, p3, p4, p5);
%     b = rand(1, n);
% 
%     tic
%     [MpoSchodkowaniu, bPoSchodkowaniu] = schodkowanie(M, b);
%     [wyznacznik, wyznacznikOdwrotnosci] = obliczWyznacznik(MpoSchodkowaniu);
%     rozwiazanie = rozwiazUklad(MpoSchodkowaniu, bPoSchodkowaniu);
%     czas = toc;
% 
%     macierzCzasow(i, :) = czas;
%     i = i + 1;
% end
% 
% T = table(macierzCzasow(:, 1),...
%     'VariableNames', {'czasRozwiazywaniaUkladu'},...
%     'RowNames', {'n = 5000', 'n = 10000', 'n = 20000', 'n = 50000', 'n = 75000', 'n = 100000', 'n = 150000'});

%------------wieksze n
wartosci_n = [150000, 300000, 500000, 750000, 1000000];
macierzCzasow = zeros(length(wartosci_n), 1);

i = 1;
for n = wartosci_n
    p1 = rand(1, n - 2);
    p2 = rand(1, n - 1);
    p3 = rand(1, n);
    p4 = rand(1, n - 1);
    p5 = rand(1, n - 2);
    
    M = stworzMacierz(p1, p2, p3, p4, p5);
    b = rand(1, n);
    
    tic
    [MpoSchodkowaniu, bPoSchodkowaniu] = schodkowanie(M, b);
    [wyznacznik, wyznacznikOdwrotnosci] = obliczWyznacznik(MpoSchodkowaniu);
    rozwiazanie = rozwiazUklad(MpoSchodkowaniu, bPoSchodkowaniu);
    czas = toc;

    macierzCzasow(i, :) = czas;
    i = i + 1;
end

T = table(macierzCzasow(:, 1),...
    'VariableNames', {'czasRozwiazywaniaUkladu'},...
    'RowNames', {'n = 150000', 'n = 300000', 'n = 500000', 'n = 750000', 'n = 1000000'});


disp(T);

subplot(1,2,1)
plot(wartosci_n, T.czasRozwiazywaniaUkladu, 'LineWidth', 3)


subplot(1,2,2)
plot(wartosci_n, log10(T.czasRozwiazywaniaUkladu), 'LineWidth', 3)

%--------------------------------PRZYKLAD 5
%gdy macierz nie ma rozwiązań

M = [1 1 1; 1 1 1; 2 1 3];
b = [1 2 7];

%obliczPrzyklad(M, b);

%Przyklad 6
M = [10 7 1; 0.9999 0.7 0.1; 1 0.9999 1];
b = [18, 1.7999, 2.9999];

%wskaznik = cond(M);
%disp(wskaznik);

%obliczPrzyklad(M, b, 1);
