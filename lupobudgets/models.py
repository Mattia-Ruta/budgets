from django.db import models
from django.conf import settings

class Merchant(models.Model):
    name = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    mapcode = models.CharField(max_length=30)
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE
    )

    def __str__(self) -> str:
        return f"{self.name} - {self.mapcode}"

class Category(models.Model):
    name = models.CharField(max_length=64)

    def __str__(self) -> str:
        return f"{self.name}"

class SubCategory(models.Model):
    name = models.CharField(max_length=64)
    category = models.ForeignKey(Category, on_delete=models.SET_NULL, null=True)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self) -> str:
        return f"{self.name} [{self.category.name}]"

class Transaction(models.Model):
    name = models.CharField(max_length=64)
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE
    )
    category = models.ForeignKey(SubCategory, on_delete=models.SET_NULL, blank=True, null=True)
    amount = models.DecimalField(max_digits=8, decimal_places=2, default=0.0)
    currency = models.CharField(max_length=3, default="GBP")
    is_expense = models.BooleanField(default=True, verbose_name="Is Expense")
    address = models.CharField(max_length=255, blank=True, null=True)
    mapcode = models.CharField(max_length=30, blank=True, null=True)
    notes = models.TextField(blank=True, null=True)

    def __str__(self) -> str:
        return f"{self.name} - {self.amount} {self.currency.code}"

class Translation(models.Model):
    key = models.CharField(max_length=64)
    lang = models.CharField(max_length=6)
    translation = models.CharField(max_length=255)

    def __str__(self) -> str:
        return f"[{self.lang}] {self.key} - {self.translation}"
    
    class Meta:
        unique_together = ("key", "lang")