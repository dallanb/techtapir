from flask import request
from flask_restful import marshal_with
from marshmallow import ValidationError
from ..schemas import RegisterFormSchema
from ...models import User, UserSchema
from ...common import DataResponse, get_json, RoleEnum, StatusEnum

from . import Base


class Register(Base):
    def __init__(self):
        Base.__init__(self)

    @marshal_with(DataResponse.marshallable())
    def post(self):
        if not len(request.form) or not request.form.get('data', None):
            self.logger.error('Missing form data')
            self.throw_error(self.code.BAD_REQUEST)

        try:
            data = RegisterFormSchema().load(get_json(request.form['data']))
        except ValidationError as err:
            self.logger.error(err.messages)
            self.throw_error(self.code.BAD_REQUEST)

        role = User.find_role(RoleEnum.member)
        status = User.find_status(StatusEnum.active)

        user = User(username=data['username'], email=data['email'], password=data['password'], role=role,
                    status=status)

        self.db.session.add(user)
        self.db.session.commit()

        user_result = UserSchema().dump(user)

        return DataResponse(data={'user': user_result})
