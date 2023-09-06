import logging
import os

from fastapi import FastAPI

from app._utils import get_voila_templates_dir


LOGGER = logging.getLogger("uvicorn")

voila_templates_dir, nbconvert_templates_dir = get_voila_templates_dir()
LOGGER.info("Voilà templates found at: %s", voila_templates_dir)
LOGGER.info("Voilà templates: %s", os.listdir(voila_templates_dir))
LOGGER.info("Nbconvert templates found at: %s", nbconvert_templates_dir)
LOGGER.info("Nbconvert templates: %s", os.listdir(nbconvert_templates_dir))


APP = FastAPI(title="dummy-heroku-app")

@APP.get("/")
def root():
    return {"message": "Hello World"}
