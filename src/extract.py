import os
from urllib.parse import quote_plus

import pandas as pd
from sqlalchemy import create_engine

DATA_DIR = "/opt/airflow/data/bronze"


def get_engine():
    user = os.environ["MSSQL_USER"]
    password = quote_plus(os.environ["MSSQL_PASSWORD"])
    host = os.environ["MSSQL_HOST"]
    port = os.environ["MSSQL_PORT"]
    db = os.environ["MSSQL_DATABASE"]

    return create_engine(
        f"mssql+pyodbc://{user}:{password}@{host}:{port}/{db}"
        "?driver=ODBC+Driver+17+for+SQL+Server"
        "&TrustServerCertificate=yes"
    )


def _load_csv(filename, table):
    df = pd.read_csv(f"{DATA_DIR}/{filename}", sep=";")
    df.to_sql(
        table,
        con=get_engine(),
        schema="raw",
        if_exists="replace",
        index=False,
    )
    print(f"Dados {table} carregados na camada raw ({len(df)} linhas)")


def extract_student_mat():
    _load_csv("student-mat.csv", "student_mat")


def extract_student_por():
    _load_csv("student-por.csv", "student_por")


if __name__ == "__main__":
    extract_student_mat()
    extract_student_por()