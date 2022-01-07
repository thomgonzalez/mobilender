from django.conf.urls import re_path, include
from rest_framework import routers

from .views import (OrderViewSet)

router = routers.DefaultRouter()
router.register(r'orders', OrderViewSet, basename='order')


urlpatterns = [
	re_path(r'^', include(router.urls)),
]
