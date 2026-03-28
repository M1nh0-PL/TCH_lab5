# Technologie Chmurowe - Laboratorium 5

**Imię i nazwisko:** Ireneusz Witek

**Grupa:** TI6.2

## Opis
Projekt stanowi realizację zadania z Laboratorium 5, którego głównym celem jest praktyczne zastosowanie **wieloetapowego budowania obrazów (ang. multi-stage build)** w środowisku Docker. Metoda ta pozwala na optymalizację rozmiaru finalnego obrazu oraz oddzielenie środowiska budującego od produkcyjnego.

Zaprojektowany plik `Dockerfile` składa się z dwóch etapów:

1. **Etap 1 :** Obraz budowany jest z wykorzystaniem instrukcji `FROM scratch`.Zaimportowano system plików Alpine Linux z archiwum tar (`alpine-minirootfs-3.23.3-x86_64.tar.gz`).Przy pomocy instrukcji `ARG VERSION`, generowany jest skrypt powłoki (`/page.sh`), który dynamicznie tworzy stronę internetową zawierającą przekazaną wersję aplikacji, nazwę hosta (ID kontenera) oraz jego lokalny adres IP.

2. **Etap 2 :** Jako środowisko uruchomieniowe wykorzystano obraz `nginx:alpine`. Z etapu pierwszego kopiowany jest  gotowy skrypt startowy. Zaimplementowano instrukcję `HEALTHCHECK` bazującą na narzędziu `curl`. Zapewnia to ciągłe monitorowanie stanu i dostępności uruchomionej aplikacji.

## Polecenia:
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
