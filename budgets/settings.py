import os
from dotenv import load_dotenv
from pathlib import Path
from django.utils.translation import gettext_lazy as _


load_dotenv()

# BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent
SECRET_KEY = os.environ.get("SECRET_KEY")
DEBUG = os.environ.get("DEBUG")

ALLOWED_HOSTS = [
    "127.0.0.1",
    "lupobudgets.local",
]

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'lupobudgets',
    'registration',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'budgets.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [
            BASE_DIR / "templates"
        ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'lupobudgets.context_processors.mapbox_api_key',
            ],
        },
    },
]

WSGI_APPLICATION = 'budgets.wsgi.application'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': os.environ.get("DB_NAME"),
        'HOST': os.environ.get("DB_HOST"),
        'PORT': os.environ.get("DB_PORT"),
        'USER': os.environ.get("DB_USERNAME"),
        'PASSWORD': os.environ.get("DB_PASSWORD"),
        'OPTIONS': {
            'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
            'charset': 'utf8mb4',
            'use_unicode': True
        }
    }
}

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Localisation
LANGUAGE_CODE = "en-gb"
LOCALE_PATHS = [
    BASE_DIR / "locale/",
]
LANGUAGES = [
    ("ar", "🌍 العربية"),
    ("ar-eg", "🌍 العربية"),
    ("ar-ae", "🌍 العربية"),
    ("ar-qa", "🌍 العربية"),
    ("cs", "🇨🇿 Čeština"),
    ("cy", "🏴󠁧󠁢󠁷󠁬󠁳󠁿 Cymraeg"),
    ("da", "🇩🇰 Dansk"),
    ("de", "🇩🇪 Deutsch"),
    ("de-at", "🇦🇹 Deutsch (Österreich)"),
    ("de-ch", "🇨🇭 Deutsch (Schweiz)"),
    ("en", "🇬🇧 English (UK)"),
    ("en-au", "🇦🇺 English (Australia)"),
    ("en-ca", "🇨🇦 English (Canada)"),
    ("en-gb", "🇬🇧 English (UK)"),
    ("en-ie", "🇮🇪 English (Ireland)"),
    ("en-nz", "🇳🇿 English (NZ)"),
    ("en-us", "🇺🇸 English (US)"),
    ("en-za", "🇿🇦 English (SA)"),
    ("eo", "🌍 Esperanto"),
    ("es", "🇪🇸 Español (España)"),
    ("es-ar", "🇦🇷 Español (Argentina)"),
    ("es-co", "🇨🇴 Español (Colombia)"),
    ("es-cr", "🇨🇷 Español (Costa Rica)"),
    ("es-do", "🇨🇷 Español (República Dominicana)"),
    ("fi", "🇫🇮 Suomi"),
    ("fr", "🇫🇷 Français"),
    ("fr-be", "🇧🇪 Français (Belgique)"),
    ("fr-ca", "🇨🇦 Français (Canada)"),
    ("fr-ch", "🇨🇭 Français (Suisse)"),
    ("gd", "🏴󠁧󠁢󠁳󠁣󠁴󠁿 Gàidhlig"),
    ("he", "🌍 עברית"),
    ("hi", "🇮🇳 हिंदी"),
    ("hu", "🇭🇺 Magyar"),
    ("id", "🇮🇩 Bahasa Indonesia"),
    ("is", "🇮🇸 Íslenska"),
    ("it", "🇮🇹 Italiano"),
    ("it-ch", "🇨🇭 Italiano (Svizzera)"),
    ("ja", "🇯🇵 日本語"),
    ("lt", "🇱🇹 Lietuvių Kalba"),
    ("mt", "🇲🇹 Malti"),
    ("nl", "🌍 Nederlands"),
    ("nl-be", "🇧🇪 Nederlands (België)"),
    ("no", "🇳🇴 Norsk"),
    ("pl", "🇵🇱 Polski"),
    ("pt", "🇵🇹 Português"),
    ("pt-br", "🇧🇷 Português (Brasil)"),
    ("ru", "🌍 Русский"),
    ("sk", "🇸🇰 Slovenčina"),
    ("sv", "🇸🇪 Svenska"),
    ("sv-fi", "🇫🇮 Svenska (Finland)"),
    ("ta", "🌍 தமிழ்"),
    ("th", "🌍 ไทย"),
    ("ua", "🇺🇦 Українська"),
    ("zh", "🌍 中文 [漢語]"),
    ("zh-hans", "🌍 中文 [漢語]"),
    ("zh-CN", "🌍 中文 [漢語]"),
]

# Date / Time Settings
TIME_ZONE = "Europe/London"
USE_L10N = True
USE_I18N = True
USE_TZ = True
DATETIME_FORMAT = "d N Y, H.i"
TIME_FORMAT = "H.i"

# Static Files
STATIC_URL = "static/"
STATICFILES_DIRS = (
    os.path.join(BASE_DIR, "staticfiles"),
)
STATIC_ROOT = os.environ.get("STATIC_ROOT")

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# Logging
ERROR_LOG = BASE_DIR / "logs/error.log"
SENDGRID_LOG = BASE_DIR / "logs/sendgrid.log"
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        # Filters
    },
    'formatters': {
        'verbose': {
            'format': '{levelname} {asctime} {module} {process:d} {thread:d} {message}',
            'style': '{',
        },
        'file': {
            'format': '{levelname} {asctime} | {message}',
            'style': '{',
        }
    },
    'handlers': {
        'file': {
            'level': 'WARNING',
            'class': 'logging.handlers.RotatingFileHandler',
            'filename': ERROR_LOG,
            'maxBytes': 1024 * 1024 * 15,   # 15MB
            'backupCount': 2,
            'formatter': 'file'
        },
        'file_sendgrid': {
            'level': 'DEBUG',
            'class': 'logging.handlers.RotatingFileHandler',
            'filename': SENDGRID_LOG,
            'maxBytes': 1024 * 1024 * 15,   # 15MB
            'backupCount': 2,
            'formatter': 'file'
        },
        'console': {
            'level': 'INFO',
            'class': 'logging.StreamHandler',
        }
    },
    'loggers': {
        'django': {
            'handlers': ['file', 'console'],
            'level': 'DEBUG',
            'propagate': True,
        },
        'sendgrid': {
            'handlers': ['file_sendgrid'],
            'level': 'DEBUG',
            'propagate': True,
        }
    },
}

# Mapbox
MAPBOX_API_KEY = os.environ.get("MAPBOX_API_KEY")