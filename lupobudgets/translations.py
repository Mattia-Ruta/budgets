from deep_translator import GoogleTranslator
from .models import Translation
from django.conf import settings
import logging


class Translations:
    """Always keep the first entry as the default English backup"""
    translations = {
        # Registration
        "login": {
            "en": "Login",
            "it": "Accedi",
            "de": "Anmelden"
        },
        "logout": {
            "en": "Logout",
            "it": "Esci"
        },
        "username": {
            "en": "Username"
        },
        "password": {
            "en": "Password",
            "it": "Password",
        },
        "signin": {
            "en": "Sign In",
            "it": "Accedi",
            "de": "Anmelden"
        },
        "invalidcredentials": {
            "en": "Invalid Credentials"
        },
        "registernewuser": {
            "en": "Register New User"
        },
        "passwordsdontmatch": {
            "en": "Passwords don't match, please try again"
        },
        "name": {
            "en": "Name"
        },
        "surname": {
            "en": "Surname"
        },
        "email": {
            "en": "Email"
        },
        "repassword": {
            "en": "Re-Enter Password"
        },
        "createaccount": {
            "en": "Create Account"
        },
        "forgotpassword": {
            "en": "Forgot password?",
            "it": "Hai dimenticato la password?"
        },
        "accounttext": {
            "en": "Account"
        },
        "accountinformation": {
            "en": "Account Information"
        },

        # Navbar
        "home": {
            "en": "Home",
            "it": "Home"
        },
        "overview": {
            "en": "Overview",
        },
        "category": {
            "en": "Category"
        },
        "categories": {
            "en": "Categories"
        },
        "transaction": {
            "en": "Transaction",
        },
        "transactions": {
            "en": "Transactions"
        },

        # Footer
        "footer": {
            "en": "Mattia Ruta 2021-2023 | Powered by Python 3 using Django Framework | "
        },
        "privacypolicy": {
            "en": "Privacy Policy"
        }
    }

    # Most languages can work in translation but these will be the ones supported mostly.
    # If adding new languages, don't forget to add in layout templates as well (nav.html, sidenav.html, etc)
    available_languages = {
        "ar": "🌍 العربية",
        "cs": "🇨🇿 Čeština",
        "cy": "🏴󠁧󠁢󠁷󠁬󠁳󠁿 Cymraeg",
        "da": "🇩🇰 Dansk",
        "de": "🇩🇪 Deutsch",
        "en": "🇬🇧 English (UK)",
        "en-gb": "🇬🇧 English (UK)",
        "en-us": "🇬🇧 English (UK)",
        "eo": "🌍 Esperanto",
        "es": "🇪🇸 Español (España)",
        "fi": "🇫🇮 Suomi",
        "fr": "🇫🇷 Français",
        "gd": "🏴󠁧󠁢󠁳󠁣󠁴󠁿 Gàidhlig",
        "he": "🌍 עברית",
        "hi": "🇮🇳 हिंदी",
        "hu": "🇭🇺 Magyar",
        "id": "🇮🇩 bahasa Indonesia",
        "is": "🇮🇸 Íslenska",
        "it": "🇮🇹 Italiano",
        "ja": "🇯🇵 日本語",
        "lt": "🇱🇹 Lietuvių Kalba",
        "mt": "🇲🇹 Malti",
        "nl": "🌍 Nederlands",
        "no": "🇳🇴 Norsk",
        "pl": "🇵🇱 Polski",
        "pt": "🌍 Português",
        "ru": "🌍 Русский",
        "sk": "🇸🇰 Slovenčina",
        "sv": "🇸🇪 Svenska",
        "ta": "🌍 தமிழ்",
        "th": "🌍 ไทย",
        "uk": "🇺🇦 Українська",
        "zh-hans": "🌍 中文 [漢語]",
        "zh-CN": "🌍 中文 [漢語]",
    }

    def get_language_from_locale(code: str):
        if code not in GoogleTranslator().get_supported_languages():
            return False
        if len(code) == 5:
            return code[:2]
        else:
            return code

    def translate(key: str, lang: str = "en", request = None) -> str:
        session_key = f"translation_{key}_{lang}"
        if request and session_key in request.session:
            print(f"pulled translation {session_key}")
            return request.session.get(session_key)

        # Language doesn't exist
        if key not in Translations.translations:
            return ""
        
        # Fixes discrepancy between Locale code and language code for Chinese
        if lang == "zh-hans":
            lang = "zh-CN"
        if lang == "ua":
            lang = "uk"

        # Normalise languages to generic (en-gb to en)
        if len(lang) > 2:
            lang = lang[:2]

        # Loop through translation items in given key to search for language code
        for trans_lang, text in Translations.translations.get(key).items():
            if lang == "en" or trans_lang == lang:
                # Searching English or found item in translations dict, return item
                return text
            if trans_lang == "en":
                backup_text = text

        # Not in session, query for translation and cache for next time
        try:
            obj = Translation.objects.get(key=key, lang=lang)
            return obj.translation
        except Exception as e: 
            try:
                logger = logging.getLogger(__name__)
                translation = GoogleTranslator("en", lang).translate(backup_text)
                obj = Translation.objects.create(
                    key = key,
                    lang = lang,
                    translation = translation
                )
                obj.save()

                # Save to session for faster retrieval
                if request:
                    request.session[session_key] = translation
                return translation
            except Exception as e:
                # Some error occured, default to backup text
                logger.warning(f"Translation not found for: {key} - {e}")
                return backup_text

    def get_lang_emoji_html(lang: str = "en") -> str:
        for code, language in settings.LANGUAGES:
            if code == lang:
                return language
        return lang