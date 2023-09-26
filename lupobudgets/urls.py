from django.urls import include, path
from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("registration/", include("registration.urls"), name="registration"),
    path("categories/", views.categories, name="categories"),
    path("category/<int:id>", views.category, name="categories"),
]