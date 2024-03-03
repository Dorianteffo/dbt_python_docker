import pandas as pd
import pytest

from ingestion.connection import create_conn
from ingestion.to_landing import load_table_to_landing
from ingestion.utils.db import WarehouseConnection, get_warehouse_creds


@pytest.fixture
def postgres_conn():
    return create_conn(
        WarehouseConnection(get_warehouse_creds()).connection_string()
    )


@pytest.fixture
def sample_dataframe():
    df = pd.read_csv('tests/sample_file.csv')
    return df


def test_load_landing(postgres_conn, sample_dataframe):
    table = 'sample_table'
    schema = 'test'
    load_table_to_landing(sample_dataframe, postgres_conn, table, schema)

    sql_df = pd.read_sql_query(
        f"SELECT * FROM {schema}.{table}", postgres_conn
    )

    assert sample_dataframe.equals(sql_df)
