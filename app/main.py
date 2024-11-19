from fastapi import FastAPI, Header, Request
from starlette.responses import Response
import socket

app = FastAPI()

@app.get("/health")
def read_root():
    return {}

@app.get("/hostName")
def read_root():
    return socket.gethostname()

@app.get("/headers")
def read_headers(request:Request, response: Response):
    for header in request.headers:
        response.headers[header] = request.headers.__getitem__(header)
        return {}