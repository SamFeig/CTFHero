# -*- coding: utf-8 -*-
"""User views."""
from flask import Blueprint, render_template
from flask_login import login_required, current_user

blueprint = Blueprint('user', __name__, url_prefix='/users', static_folder='../static')

from .models import UserData

@blueprint.route('/')
@login_required
def members():
    """List members."""
    userdata = UserData.query.filter_by(user_id=current_user.id).first()
    return render_template('users/members.html',userdata=userdata)
