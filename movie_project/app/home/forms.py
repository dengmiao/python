# coding:utf8
from flask_wtf import FlaskForm
from wtforms.fields import StringField, PasswordField, SubmitField, FileField, TextAreaField
from wtforms.validators import DataRequired, EqualTo, Email, Regexp, ValidationError
from app.models import User


class RegisterForm(FlaskForm):
    name = StringField(
        label="昵称",
        validators=[
            DataRequired("请输入昵称!")
        ],
        description="昵称",
        render_kw={
            "class": "form-control input-lg",
            "placeholder": "请输入昵称！",
        }
    )
    email = StringField(
        label="邮箱",
        validators=[
            DataRequired("请输入邮箱!"),
            Email('邮箱格式不正确！')
        ],
        description="邮箱",
        render_kw={
            "class": "form-control input-lg",
            "placeholder": "请输入邮箱！",
        }
    )
    phone = StringField(
        label="手机",
        validators=[
            DataRequired("请输入手机!"),
            Regexp('1[345789]\\d{9}', message="手机格式不正确！")
        ],
        description="手机",
        render_kw={
            "class": "form-control input-lg",
            "placeholder": "请输入手机！",
        }
    )
    pwd = PasswordField(
        label="密码",
        validators=[
            DataRequired("请输入密码!")
        ],
        description="密码",
        render_kw={
            "class": "form-control input-lg",
            "placeholder": "请输入密码！",
        }
    )
    repwd = PasswordField(
        label="确认密码",
        validators=[
            DataRequired("请输入确认密码!"),
            EqualTo('pwd', message='两次密码输入不一致')
        ],
        description="确认密码",
        render_kw={
            "class": "form-control input-lg",
            "placeholder": "请输入确认密码！",
        }
    )
    submit = SubmitField(
        '注册',
        render_kw={
            "class": "btn btn-lg btn-success btn-block"
        }
    )

    def validate_name(self, field):
        name = field.data
        count = User.query.filter_by(name=name).count()
        if count != 0:
            raise ValidationError("昵称已经存在！")

    def validate_email(self, field):
        email = field.data
        count = User.query.filter_by(email=email).count()
        if count != 0:
            raise ValidationError("邮箱已经存在！")

    def validate_phone(self, field):
        phone = field.data
        count = User.query.filter_by(phone=phone).count()
        if count != 0:
            raise ValidationError("手机号码已经存在！")


class LoginForm(FlaskForm):
    name = StringField(
        label="账号",
        validators=[
            DataRequired("请输入账号!")
        ],
        description="账号",
        render_kw={
            "class": "form-control input-lg",
            "placeholder": "请输入账号！",
        }
    )
    pwd = PasswordField(
        label="密码",
        validators=[
            DataRequired("请输入密码!")
        ],
        description="密码",
        render_kw={
            "class": "form-control input-lg",
            "placeholder": "请输入密码！",
        }
    )
    submit = SubmitField(
        '登录',
        render_kw={
            "class": "btn btn-lg btn-primary btn-block"
        }
    )


class UserdetailForm(FlaskForm):
    name = StringField(
        label="账号",
        validators=[
            DataRequired("请输入账号!")
        ],
        description="账号",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入账号！",
        }
    )
    email = StringField(
        label="邮箱",
        validators=[
            DataRequired("请输入邮箱!"),
            Email('邮箱格式不正确！')
        ],
        description="邮箱",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入邮箱！",
        }
    )
    phone = StringField(
        label="手机",
        validators=[
            DataRequired("请输入手机!"),
            Regexp('1[345789]\\d{9}', message="手机格式不正确！")
        ],
        description="手机",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入手机！",
        }
    )
    face = FileField(
        label="头像",
        validators=[
            DataRequired("请上传头像!")
        ],
        description="头像",
    )
    info = TextAreaField(
        label="简介",
        validators=[
            DataRequired("请输入简介!")
        ],
        description="简介",
        render_kw={
            "class": "form-control",
            "rows": 10
        }
    )
    submit = SubmitField(
        '保存修改',
        render_kw={
            "class": "btn btn-success",
            "span": "glyphicon glyphicon-saved"
        }
    )


class PwdForm(FlaskForm):
    """密码表单"""
    old_pwd = PasswordField(
        label="旧密码",
        validators=[
            DataRequired("请输入旧密码!")
        ],
        description="旧密码",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入旧密码！"
        }
    )
    new_pwd = PasswordField(
        label="新密码",
        validators=[
            DataRequired("请输入新密码!")
        ],
        description="新密码",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入新密码！"
        }
    )
    submit = SubmitField(
        '修改密码',
        render_kw={
            "class": "btn btn-success"
        }
    )
