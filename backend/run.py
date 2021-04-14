import uvicorn

if __name__ == "__main__":
    uvicorn.run("api:app", reload=True, host='0.0.0.0', port=8080, debug=True)