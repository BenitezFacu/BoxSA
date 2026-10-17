SECRET_KEY = "clave-del-tp-box-sa"
DEBUG = True
ALLOWED_HOSTS = []

INSTALLED_APPS = [
    "django.contrib.staticfiles",
    "ordenes",
]

MIDDLEWARE = [
    "django.middleware.csrf.CsrfViewMiddleware",
]

ROOT_URLCONF = "boxsa.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "APP_DIRS": True,
    },
]

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.mysql",
        "NAME": "box_sa",
        "USER": "root",
        "PASSWORD": "admin",
        "HOST": "localhost",
        "PORT": "3306",
    }
}

STATIC_URL = "/static/"
DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"
