# Technologie Chmurowe - Laboratorium 5

**Imię i nazwisko:** Ireneusz Witek

**Grupa:** TI6.2

## Opis
Projekt stanowi realizację zadania z Laboratorium 5, którego głównym celem jest praktyczne zastosowanie **wieloetapowego budowania obrazów (ang. multi-stage build)** w środowisku Docker. Metoda ta pozwala na optymalizację rozmiaru finalnego obrazu oraz oddzielenie środowiska budującego od produkcyjnego.

Zaprojektowany plik `Dockerfile` składa się z dwóch etapów:

1. **Etap 1 (Builder):** Obraz budowany jest całkowicie od podstaw z wykorzystaniem instrukcji `FROM scratch`. Jako minimalne środowisko operacyjne zaimportowano system plików Alpine Linux z lokalnego archiwum tar (`alpine-minirootfs-3.23.3-x86_64.tar.gz`). Na tym etapie, przy pomocy instrukcji `ARG VERSION`, generowany jest skrypt powłoki (`/app.sh`), który dynamicznie tworzy stronę internetową zawierającą przekazaną wersję aplikacji, nazwę hosta (ID kontenera) oraz jego lokalny adres IP.

2. **Etap 2 (Produkcja):** Jako środowisko uruchomieniowe wykorzystano oficjalny, lekki obraz `nginx:alpine`. Z etapu pierwszego kopiowany jest wyłącznie gotowy skrypt startowy. Dodatkowo w kontenerze instalowane jest narzędzie `curl`, które służy do regularnego odpytywania serwera WWW w ramach zaimplementowanej instrukcji `HEALTHCHECK`. Zapewnia to ciągłe monitorowanie stanu i dostępności uruchomionej aplikacji.
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
