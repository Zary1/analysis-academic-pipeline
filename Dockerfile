FROM apache/airflow:3.1.7-python3.12

USER root

# Instalar Microsoft ODBC Driver 17
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       curl \
       gnupg \
       unixodbc-dev \
    && curl -fsSL https://packages.microsoft.com/keys/microsoft.asc \
       | gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg \
    && curl -fsSL https://packages.microsoft.com/config/debian/12/prod.list \
       -o /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y msodbcsql17 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER airflow

# Dependências Python compatíveis com Airflow
ARG AIRFLOW_VERSION=3.1.7
ARG PYTHON_VERSION=3.12

RUN pip install --no-cache-dir \
    --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt" \
    pandas \
    sqlalchemy \
    pyodbc \
    python-dotenv

# Ambiente virtual independente para dbt (com pyodbc)
RUN python -m venv /home/airflow/dbt_venv \
    && /home/airflow/dbt_venv/bin/pip install --no-cache-dir dbt-sqlserver pyodbc