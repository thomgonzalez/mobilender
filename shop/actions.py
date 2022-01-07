from django.db import models
from rest_framework.exceptions import ValidationError
from .models import Order, OrderDetail


class OrderAction(object):
	
	def create(self, **kwargs):
		"""Crear pedido."""
		instance = Order(**kwargs)
		instance.save()
		return instance

	def filter(self, **kwargs):
		return Order.objects.filter(**kwargs)

	def all(self):
		return Order.objects.all()

	def get(self, **kwargs):
		try:
			return Order.objects.get(**kwargs)
		except Order.DoesNotExist:
			return None

class OrderDetailAction(object):
	
	def create(self, **kwargs):
		"""Crear detalle."""
		# Save Detail
		detail = OrderDetail(**kwargs)
		model = detail.save()
		return model
