from typing import Optional
from pydantic import BaseModel
from datetime import datetime, timedelta
from bson import ObjectId

from jose import JWTError, jwt
from fastapi.security import OAuth2PasswordBearer

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")

# openssl rand -hex 32
SECRET_KEY = "c48c84f02c2b2334392044ea6bcd2307758451dabec81d2d549d745c09ee1355"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 10080  # 1week


def create_access_token(user_id: ObjectId):
    to_encode = {"sub": str(user_id)}
    expire = datetime.utcnow() + timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt
