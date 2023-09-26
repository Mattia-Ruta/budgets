from django.contrib import admin
from .models import *

admin.site.register(Merchant)
admin.site.register(Category)
admin.site.register(SubCategory)
admin.site.register(Transaction)
admin.site.register(Translation)