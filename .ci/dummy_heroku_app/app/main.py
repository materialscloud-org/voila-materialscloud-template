from fastapi import FastAPI


APP = FastAPI("dummy-heroku-app")

@APP.get("/")
def root():
    return {"message": "Hello World"}
