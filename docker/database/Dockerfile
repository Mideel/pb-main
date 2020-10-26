FROM postgres:latest
ADD authentication1.sql product1.sql stock1.sql salesorder1.sql salesinvoice1.sql /docker-entrypoint-initdb.d/
ENV POSTGRES_USER=dbexerphi_dba
ENV POSTGRES_PASSWORD=admin
ENV POSTGRES_DB=dbexerphi
# CMD psql postgresql://dbexerphi_dba:admin@localhost:5432/dbexerphi -f authentication.sql \
# && psql postgresql://dbexerphi_dba:admin@localhost:5432/dbexerphi -f product.sql \
# && postgresql://dbexerphi_dba:admin@localhost:5432/dbexerphi -f stock.sql \
# && postgresql://dbexerphi_dba:admin@localhost:5432/dbexerphi -f sales-order.sql \
# && postgresql://dbexerphi_dba:admin@localhost:5432/dbexerphi -f sales-invoice.sql 
