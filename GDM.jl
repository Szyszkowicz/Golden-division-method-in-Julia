
#Metoda złotego podziału – numeryczna metoda optymalizacji jednowymiarowej funkcji celu.

#Algorytm ten może być używany przy minimalizacji kierunkowej razem z innymi metodami optymalizacji 
#funkcji wielowymiarowych, takich jak metody gradientowe (np. metoda gradientu prostego, metoda Newtona) 
#lub bezgradientowe (np. metoda Gaussa-Seidela, metoda Powella).

gp = (sqrt(5) - 1) / 2  
gp2 = (3 - sqrt(5)) / 2  

#złota proporcja dla każdego z 2 końców przedziałów

function grm(f, a, b, tol=1e-5)
    
    #funkcja porównuje wprowadzone wartości końców przedziałów
    #dzięki temu nie ma różnicy, czy użytkownik zachowa odpowiednią kolejność
    

    (a, b) = (min(a, b), max(a, b))
    h = b - a
    
    #obliczanie wielkości przedziału
    
    if h <= tol
        return (a, b)
    end
    
    #porównanie szerokości do ustalonej dokładności

    n = ceil(log(tol / h) / log(gp))
    #ustalamy ilość kroków do osiągnięcia zadanej tolerancji

    c = a + gp2 * h
    d = a + gp * h
    #obliczanie nowych przedziałów
    yc = f(c)
    yd = (d-2)^2

    for k in range(1, n)
        if yc < yd
            b = d
            d = c
            yd = yc
            h = gp * h
            c = a + gp2 * h
            yc = f(c)  
            #ponowne obliczanie nowych przedziałów
        else
            a = c
            c = d
            yc = yd
            h = gp * h
            d = a + gp * h
            yd = (d-2)^2
        end
    end
    
    if yc < yd
        return (a, d)
    else
        return (c, b)
    end
    
    #końcowe porównanie, który przedział, będzie przedziałem
    #o bliższej dokładności
    
end











#podstawienie odpowiednich zmiennych
#funkcja

f(x) = (x-2)^2

a = 1
b = 5
tol = 1e-5

#tolerancja (przedział)

(c, d) = grm(f, a, b, tol)

print("Interval 1= ", c)
print("_________________Interval 2= ", d)

#ostateczny, przybliżony do liczb całkowitych wynik

w = ((c+d)/2)
round(w)
