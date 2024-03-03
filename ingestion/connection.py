import logging

from sqlalchemy import create_engine

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
)

logger = logging.getLogger(__name__)


def create_conn(connection_string):
    # connect to the postgres database
    try:
        engine = create_engine(connection_string)
        logger.info("Connected to postgres database!!")
        return engine
    except Exception as e:
        logger.error("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        logger.error(f"Enable to connect to postgres : {e}")


def close_conn(engine):
    # close the connection
    engine.dispose()
