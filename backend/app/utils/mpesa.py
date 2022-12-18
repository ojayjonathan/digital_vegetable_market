import requests
from requests.auth import HTTPBasicAuth
from datetime import datetime
import base64
import json


def mpesa_access_token(
    MPESA_API_URL: str,
    consumer_key: str,
    consumer_secret: str,
):

    response = requests.get(
        MPESA_API_URL, auth=HTTPBasicAuth(consumer_key, consumer_secret)
    )
    print(response.content, consumer_key, consumer_secret)
    mpesa_access_token = json.loads(response.text)
    return mpesa_access_token["access_token"]


def lipa_na_mpesa_password(passkey: str, short_code: str):
    lipa_time = datetime.now().strftime("%Y%m%d%H%M%S")

    data_to_encode = short_code + passkey + lipa_time
    online_password = base64.b64encode(data_to_encode.encode())
    decode_password = online_password.decode("utf-8")

    return {"decode_password": decode_password, "lipa_time": lipa_time}
