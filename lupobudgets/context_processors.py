from django.conf import settings

def mapbox_api_key(request):
    return {"MAPBOX_API_KEY": settings.MAPBOX_API_KEY}