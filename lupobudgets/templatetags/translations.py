from django import template
from django.conf import settings
from django.utils.translation import get_language
from lupobudgets.translations import Translations
from html import escape


register = template.Library()
default_lang = settings.LANGUAGE_CODE

"""
Layout Page and Navbars
"""

# Navbar
@register.simple_tag
def home(lang: str = default_lang) -> str:
    return Translations.translate("home", lang)

@register.simple_tag
def login_text(lang: str = default_lang) -> str:
    return Translations.translate("login", lang)

@register.simple_tag
def logout_text(lang:str = default_lang) -> str:
    return Translations.translate("logout", lang)

@register.simple_tag
def overview(lang:str = default_lang) -> str:
    return Translations.translate("overview", lang)

@register.simple_tag
def categories(lang:str = default_lang) -> str:
    return Translations.translate("categories", lang)

@register.simple_tag
def transactions(lang:str = default_lang) -> str:
    return Translations.translate("transactions", lang)

# Footer
@register.simple_tag
def footer_text(lang: str = default_lang) -> str:
    return Translations.translate("footer", lang)

@register.simple_tag
def footer_privacy_policy(lang: str = default_lang) -> str:
    return Translations.translate("privacypolicy", lang)

@register.simple_tag
def current_lang(lang: str = default_lang) -> str:
    return Translations.get_lang_emoji_html(lang)

@register.simple_tag
def get_language(lang: str = default_lang) -> str:
    return Translations.get_lang_emoji_html(lang)

@register.filter
def index(indexable, i):
    return indexable[i]


# Paths

@register.filter
def cut(string: str) -> str:
    """Cuts the first couple of chars from a string, mostly used to remove the double language part of a URL"""
    return string[3:]

@register.filter
def remove_code_from_path(path: str) -> str:
    """Removes the first part of a URL path, mostly for removing the language code"""
    paths = path.split("/")
    cleaned_paths = paths[2:]
    return "/".join(cleaned_paths)

@register.filter
def get_first_path(path: str) -> str:
    """Pull first param from URL to see if it's /categories, /transactions, etc"""
    paths = path.split("/")
    first_path = paths[2]
    if first_path == "category" or first_path == "categories":
        return "categories"
    if first_path == "transaction" or first_path == "transactions":
        return "transactions"
    return paths[2]
