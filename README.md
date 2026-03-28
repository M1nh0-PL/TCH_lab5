# Technologie Chmurowe - Laboratorium 5

**Imię i nazwisko:** Ireneusz Witek

**Grupa:** TI6.2

## Opis
Projekt stanowi realizację zadania z Laboratorium 5, którego celem jest demonstracja wieloetapowego budowania obrazów Docker.

## Polecenia
**Budowa obrazu**
```bash
docker build --pull --no-cache --build-arg VERSION=2.1.0 -t lab5-iw .
