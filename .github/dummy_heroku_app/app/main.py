from fastapi import FastAPI


APP = FastAPI(title="dummy-heroku-app")

@APP.get("/")
def root():
    return {"message": "Hello World"}
