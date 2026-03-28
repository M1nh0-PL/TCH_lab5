# Technologie Chmurowe - Laboratorium 5

**Imię i nazwisko:** Ireneusz Witek
**Grupa:** TI6.2

## Opis
Obraz Docker oparty na Ubuntu z zainstalowanym serwerem Apache.  

Zawiera prostą stronę WWW z danymi studenta.

## Uruchomienie
docker build -t web100 . 

docker run -d -p 8080:80 web100


## Optymalizacja Dockerfile

Wprowadzono optymalizację pliku Dockerfile poprzez połączenie poleceń w jedną instrukcję RUN, co zmniejsza liczbę warstw obrazu. Dodatkowo usunięto cache menedżera pakietów (apt-get clean oraz usunięcie /var/lib/apt/lists), co pozwala zmniejszyć rozmiar obrazu.

Zastosowano uruchomienie serwera Apache w trybie foreground (CMD ["apachectl", "-D", "FOREGROUND"]), aby kontener działał poprawnie i nie kończył pracy po uruchomieniu.

Uproszczono konfigurację poprzez użycie jednej instrukcji CMD zamiast ENTRYPOINT i CMD, co poprawia czytelność pliku Dockerfile.

## Warstwy obrazu

Liczbę warstw sprawdzono przy użyciu polecenia:

docker history web100

Obraz ma 3 warstwy.
