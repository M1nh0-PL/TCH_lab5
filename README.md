# Technologie Chmurowe - Laboratorium 5

**Imię i nazwisko:** Ireneusz Witek

**Grupa:** TI6.2

## Opis
Zgodnie z wymogami zadania, plik `Dockerfile` został podzielony na dwa etapy:
1. **Etap 1 (Builder):** Zbudowany od podstaw w oparciu o pusty obraz `scratch`. Do środka wgrano minimalny system plików Alpine Linux za pomocą archiwum `.tar`. W tym etapie generowany jest skrypt startowy serwera, do którego wstrzykiwana jest wersja aplikacji (przez zmienną `ARG`) oraz skrypty odczytujące w locie `hostname` i adres IP kontenera.
2. **Etap 2 (Produkcja):** Oparty na oficjalnym obrazie `nginx:alpine`. Kopiuje on gotowy skrypt z pierwszego etapu. Zaimplementowano w nim również instrukcję `HEALTHCHECK` opartą na poleceniu `curl`, która stale monitoruje dostępność aplikacji.

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
