from django.db import models
from django.contrib.auth.models import User

class Profile(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    currency = models.CharField(max_length=3, default="GBP")

    def __str__(self) -> str:
        return f"{self.user.username} - {self.currency}"