import os

import pandas as pd
from connection import close_conn, create_conn
from to_landing import load_table_to_landing
from utils.db import WarehouseConnection, get_warehouse_creds


def main():

    engine = create_conn(
        WarehouseConnection(get_warehouse_creds()).connection_string()
    )
    """ Landing area """
    file_path = os.getenv('FILE_PATH')
    table_name = os.getenv('TABLE_NAME')

    df = pd.read_csv(file_path)
    load_table_to_landing(df, engine, table_name, 'landing')

    close_conn(engine)


if __name__ == "__main__":
    main()
