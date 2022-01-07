from django.urls import path

from .views import (
	home,
)

app_name = 'company'
company_urlpatterns = ([
	path('', home, name='home_url'),
], app_name)
