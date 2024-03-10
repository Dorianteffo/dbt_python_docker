import logging

import pandas as pd
from sqlalchemy.engine.base import Engine

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
)

logger = logging.getLogger(__name__)


def load_table_to_landing(
    df: pd.DataFrame, engine: Engine, table_name: str, schema_name: str
):
    try:
        df.to_sql(
            table_name,
            engine,
            if_exists='replace',
            index=False,
            schema=schema_name,
        )
        logger.info(f"Table {table_name} loaded to the {schema_name} schema!!!")
    except Exception as e:
        logger.error("!!!!!!!!!!!!!!!!!!!!!!")
        logger.error(f"Enable to load the table {table_name} to {schema_name} schema : {e}")
