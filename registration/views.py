from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from .forms import LoginForm, RegisterForm
from lupobudgets.translations import Translations
from lupobudgets.utils import Currency
from .models import Profile


def login_view(request):
    msg = ""
    user = None
    username = None
    password = None

    if request.user.is_authenticated:
        return HttpResponseRedirect("index")
    else:
        lang = request.path[1:3]
        invalid_credentials_msg = Translations.translate("invalidcredentials", lang, request)
        if request.method == "POST":
            # POST
            form = LoginForm(request.POST)

            if form.is_valid():
                username = form.cleaned_data["username"]
                password = form.cleaned_data["password"]
                user = authenticate(request, username=username, password=password)

                if user:
                    login(request, user)
                    return HttpResponseRedirect("/")
                else:
                    # No user
                    msg = invalid_credentials_msg
            else:
                # Form not valid
                msg = invalid_credentials_msg
        else:
            # GET
            form = LoginForm()

    context = {
        "form": form,
        "msg": msg,

        "email_label": Translations.translate("email", lang, request),
        "username_label": Translations.translate("username", lang, request),
        "password_label": Translations.translate("password", lang, request),
        "forgotpassword": Translations.translate("forgotpassword", lang, request),
        "signin_button_label": Translations.translate("signin", lang, request),
        "login": Translations.translate("login", lang, request),
    }
    return render(request, "registration/login.html", context)

def logout_view(request):
    logout(request)
    return render(request, "registration/logout_success.html", {})

def register(request):
    lang = request.path[1:3]
    msg = ""

    if request.user.is_authenticated:
        return HttpResponseRedirect("index")
    else:
        if request.method == "POST":
            # POST
            form = RegisterForm(request.POST)
            if form.is_valid():
                name = form.cleaned_data["name"]
                surname = form.cleaned_data["surname"]
                email = form.cleaned_data["email"]
                password1 = form.cleaned_data["password1"]
                password2 = form.cleaned_data["password2"]
                currency = form.cleaned_data["currency"]

                if password1 != password2:
                    msg = Translations.translate("passwordsdontmatch", lang)

                
                response = User.objects.get_or_create(email=email)
                if response[1] == True:
                    # Create new user
                    user = response[0]
                    user.first_name = name
                    user.last_name = surname
                    user.username = email
                    user.email = email
                    user.set_password(password1)
                    user.save()
                    Profile.objects.create(
                        user = user,
                        currency = currency
                    )
                    login(request, user)
                    return HttpResponseRedirect("/")
                else:
                    # User already exists
                    msg = "An account with that email already exists"
        else:
            form = RegisterForm()

    context = {
        "form": form,
        "msg": msg,

        "passwordsdontmatch": Translations.translate("passwordsdontmatch", lang),
    }
    return render(request, "registration/register.html", context)

@login_required
def account_view(request):
    lang = request.path[1:3]
    msg = ""
    profile = Profile.objects.get(user=request.user)
    currency = Currency(profile.currency)

    context = {
        "msg": msg,
        "profile": profile,
        "currency": currency,
        "currency_name": currency.get_name(lang, request),

        "account_text": Translations.translate("accounttext", lang, request),
        "account_information": Translations.translate("accountinformation", lang, request),
    }
    return render(request, "registration/account.html", context)