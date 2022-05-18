import os
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def delete_test_db():
    logger.info("Deleting test.db")
    if os.path.exists("test.db"):
        os.remove("test.db")
        



if __name__ == "__main__":
    delete_test_db()
