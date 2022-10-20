FROM registry.developers.crunchydata.com/crunchydata/crunchy-postgres:ubi8-14.5-1

USER root

RUN curl -sSL -o /etc/yum.repos.d/timescale_timescaledb.repo "https://packagecloud.io/install/repositories/timescale/timescaledb/config_file.repo?os=el&dist=8" && \
    microdnf --disablerepo=crunchypg14 update -y && \
    microdnf --disablerepo=crunchypg14 install -y timescaledb-2-postgresql-14 && \
    microdnf --disablerepo=crunchypg14 install -y timescaledb-toolkit-postgresql-14 && \
    microdnf clean all
USER 26
