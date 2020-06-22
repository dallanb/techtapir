from flask_restful import marshal_with
from ...common import DataResponse

from . import Base


class Login(Base):
    def __init__(self):
        Base.__init__(self)

    @marshal_with(DataResponse.marshallable())
    def post(self):
        return DataResponse(data={})
