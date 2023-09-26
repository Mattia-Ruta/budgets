from collections.abc import Mapping
from typing import Any
from django import forms
from django.forms.utils import ErrorList
from lupobudgets.utils import Currency


class LoginForm(forms.Form):
    username = forms.CharField(widget=forms.TextInput(attrs={
        "class": "validate"
    }))
    password = forms.CharField(widget=forms.PasswordInput(attrs={
        "class": "validate"
    }))
    def clean(self):
        cleaned_data = super().clean()
        return cleaned_data
    
class RegisterForm(forms.Form):
    name = forms.CharField(widget=forms.TextInput(attrs={
        "class": "validate"
    }))
    surname = forms.CharField(widget=forms.TextInput(attrs={
        "class": "validate",
    }))
    email = forms.EmailField(widget=forms.EmailInput(attrs={
        "class": "validate"
    }))
    password1 = forms.CharField(widget=forms.PasswordInput(attrs={
        "class": "validate passwordfield"
    }))
    password2 = forms.CharField(widget=forms.PasswordInput(attrs={
        "class": "validate passwordfield"
    }))
    currency = forms.ChoiceField(choices=Currency.choices, widget=forms.Select(attrs={
        "class": "validate"
    }), initial="GBP")

    def clean(self):
        cleaned_data = super().clean()
        return cleaned_data