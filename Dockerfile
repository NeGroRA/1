# Używamy obrazu bazowego AdGuard Home z Docker Hub
FROM adguard/adguardhome:latest

# Określenie strefy czasowej, jeśli chcesz to zmieniać w kontenerze
ENV TZ=Europe/Warsaw

# Tworzymy katalogi na dane (jeśli ich nie ma) i ustawiamy odpowiednie uprawnienia
RUN mkdir -p /opt/adguardhome/work && \
    mkdir -p /opt/adguardhome/conf && \
    chown -R adguardhome:adguardhome /opt/adguardhome

# Skopiowanie konfiguracji (jeśli masz lokalne pliki konfiguracyjne)
COPY ./conf /opt/adguardhome/conf

# Ustawienie katalogu roboczego
WORKDIR /opt/adguardhome

# Uruchamianie AdGuard Home
CMD ["/opt/adguardhome/AdGuardHome", "-c", "/opt/adguardhome/conf/adguardhome.yaml"]
