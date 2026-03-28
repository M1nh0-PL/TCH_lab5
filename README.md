# Technologie Chmurowe - Laboratorium 5

**Imię i nazwisko:** Ireneusz Witek

**Grupa:** TI6.2

## Opis
Projekt stanowi realizację zadania z Laboratorium 5, którego celem jest demonstracja wieloetapowego budowania obrazów Docker.

## Polecenia
**Budowa obrazu:**
```bash
docker build --pull --no-cache --build-arg VERSION=2.1.0 -t lab5-iw .
```
![Zrzut ekranu z budowania obrazu](1.png)

**Uruchomienie serwera oraz sprawdzenie działania:**
```bash
docker run -d -p 8080:80 --name serwer_lab5 lab5-iw
```
```bash
docker ps
```
![Zrzut ekranu z uruchomienia serwera](2.png)

![Zrzut ekranu ze srtony serwera](3.png)
