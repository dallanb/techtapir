from sqlalchemy.event import listens_for
from sqlalchemy_utils import EmailType, UUIDType
from .. import db, ma
from .Base import Base
from .utils import generate_uuid


class User(Base):
    __tablename__ = 'user'
    uuid = db.Column(UUIDType(binary=False), unique=True, nullable=False)
    email = db.Column(EmailType)
    user_name = db.Column(db.String(255))

    # FK
    role_uuid = db.Column(UUIDType(binary=False), db.ForeignKey('role.uuid'), nullable=False)
    status_uuid = db.Column(UUIDType(binary=False), db.ForeignKey('status.uuid'), nullable=False)

    # Relationship
    role = db.relationship("Role")
    status = db.relationship("Status")

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)


@listens_for(User, 'before_insert')
def before_insert(mapper, connect, self):
    self.uuid = generate_uuid()


@listens_for(User, 'before_update')
def before_update(mapper, connect, self):
    return


class UserSchema(ma.SQLAlchemySchema):
    class Meta:
        model = User
        load_instance = True

    uuid = ma.auto_field()
    email = ma.auto_field()
    user_name = ma.auto_field()
    role_uuid = ma.auto_field()
    status_uuid = ma.auto_field()
