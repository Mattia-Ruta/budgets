from django.urls import include, path
from . import views

app_name = "registration"
urlpatterns = [
    path("login/", views.login_view, name="login"),
    path("logout/", views.logout_view, name="logout"),
    path("register/", views.register, name="register"),
    path("account/", views.account_view, name="account"),
]