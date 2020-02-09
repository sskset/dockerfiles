FROM postgres

ENV POSTGRES_DB=myshopdb
ENV POSTGRES_USER=myshopdb_user
ENV POSTGRES_PASSWORD=myshopdb_pwd

COPY ./schema.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
CMD ["postgres"]